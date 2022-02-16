---
title: Amavis DKIM Signing configuration
Description: How to configure DKIM for No Fuss Computings mail server.
---

To utilise DKIM message signing for outbound mail (leaving the server), you will need to configure dkim to use your certificates.

This document assumes that your are familar with amavis and DKIM E-Mail signing. Without this assumed knowledge, there may be uninteded consequences.


## DKIM Key creation

You will be required to generate your DKIM signing certificates for the E-Mail domains that you utilise. The recommended location for DKIM keys is `/certs/amavis/dkim`, this ensures they are included in the backups.

``` bash title="bash"

$ amavisd-new genrsa /certs/amavis/dkim/example.org.dkim.pem 2048 # (1)!

$ chmod g+r /certs/amavis/dkim/example.org.dkim.pem # (2)!

$ chgrp amavis /certs/amavis/dkim/example.org.dkim.pem # (2)!
```

1. create your DKIM Key

    is an RSA Key

    has a key of length 2048 bits _[See RFC6376 - Key Sizes](https://datatracker.ietf.org/doc/html/rfc6376#section-3.3.3)_

    saved to location `/certs/amavis/dkim/` with a name of `example.org.dkim.pem`

    The filename is crucial and has some requirements:

    - `example.org` set to your E-Mail domain name.

    - `dkim` is the key selector that will be utilised during the amavis configuration

    - `.pem` is the file extension

    For example: if you have a E-Mail domain called `myemail.com` and wanted to use a key selector of `q2` for second quarter of teh year, you would use command `amavisd-new genrsa /certs/amavis/dkim/myemail.com.q2.pem 2048` to create your dkim signing key. _not forgetting that `q2` needs to be added to your amavis config, see below_

2. Set the permissions for your dkim signing key to only be accessable to amavis


## Configuring Amavis

To configure amavis, you will be required to create a confiuguration file with your E-Mail domain settings. you can name this file anything you wish, as long as the filename is oredered after `90-dkim`. The configuration file needs to be located in `/etc/amavis/conf.d/` and amavis will need to be restarted `supervisorctl restart amavis` for the configuration to take effect.

!!! tip Note
    Ensure you adjust all occurances of `example.org` to match your E-Mail domain


``` conf title="/etc/amavis/conf.d/99-dkim-keys"
dkim_key(
    'example.org', # (1)!
    'dkim', # (2)!
    '/certs/amavis/dkim/example.org.dkim.pem' # (3)!
);


@dkim_signature_options_bysender_maps = (
    {
        "example.org" => { # (1)!
            s   => 'dkim', # (2)! # (4)!
            d   => 'example.org', # (1)!
            a   => 'rsa-sha256', # (5)!
            ttl => 30*24*3600 # (6)!
        }
    }
);

```

1. Adjust to suit your domain name

2. This is the key selector _located in the filename, `{E-Mail domain}.{key_selector}.pem`_.

3. This is the location of the DKIM Signing key. This must match the name given during key generation.

4. This is the key selector. Only this key will be used to sign the E-Mails if it matches the E-Mail domain name.

5. This is the key signing algorithm

6. This is the signed E-Mail validity duration `30*24*3600` = `30 days * 24 hours * seconds in one hour`. This value is used to set the E-Mails signature validation period.

!!! Tip
    you can add as many `dkim_key` sections to your config as required.

!!! note
    if you don't place a domain entry in `@dkim_signature_options_bysender_maps` that matches your E-Mail domain, any email sent from that domain will not be dkim signed. You can specify `'.'` for the domain entry to capture all domains.

Once configuration is complete issue command `supervisorctl restart amavis` to load the config changes


## Configuring DNS

Once you have configured Amavis and created your DKIM keys, you will need to configure DNS. For this you will require the DKIM Key information. Since we are using Amavis, issue command `amavisd-new showkeys` to display your keys and the required dns config.

``` bash title="DNS Configuration"
$ amavisd-new showkeys
; key#1 4096 bits, i=dkim, d=example.org, /certs/amavis/dkim/example.org.dkim.pem
dkim._domainkey.example.org.    3600 TXT (
  "v=DKIM1; p="
  "MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEArP2MsM5q9IbgVTxwj0nA"
  "2Iqa8NsL5L72TGEnBib8nusfoFWw5G8yGpAkterD7w9hIhCiRbpXakzQ8a9vrsnF"
  "HsQph79d02mAndE9VS3b+dxABzGKNWdRszrKHDb4q8OeX+g6fsPlPlIOb1ngg4qo"
  "oVJTlswV3KacE7OwGq1ZRy8X6CIAjzeiC3x7qiBH5Yxi895i7GLeTwMKQY8mIv1Z"
  "iLVoNcH5lpB3FOJFWtXiztpkQaLLVY/YQAGzwRnWQHcqRd6ybtf9q34ADYhq1gZb"
  "NC6GOnkets6mv2o7daTQ78Sr+GO2/4DpciXGIDB8QbbX4Qh0kaazEqx9HlGG7MC2"
  "TdyIjmMF0pzI9qjVDdkXvwFJLLyIDP4Y4DgGuVHi/+Zdi9YtxcWrKpb8Zv+32xgU"
  "Qvz8EQt03upcpxB0aVRkK1I6GYKYr3I0uhYhfBZdUonUkxaklcnrQZVsooo+xont"
  "MMyPbPM6HYf0KJZCxGa6AYrIiYlnj7giudVTJdvA1J3IOQEGjq0tRmH0id/Qv2F5"
  "Po5zMEPMtx/pcWcqEJEC7/phgboQ3vkZYf/lCqZ8T2JXAIE9ujQFTFE86v+pXhVf"
  "98/oY4n5PN9LYfaflkTOmWyfig/qQ7mCjxdaYnOko9hlUnaRGrG5d6Dfy16qFt64"
  "PYEseCN67yeWZz8r1NaZHckCAwEAAQ==")
$ 

```

1. Using the example output from the above command, displays the required DNS txt entry.

    Create a DNS `TXT` entry named `dkim._domainkey.example.org` The breakdown of this name is as follows `{key selector}._domainkey.{domain name}`

    !!! note
        if you have configured amavis correctly, the selector and domain name will match your E-Mail domain.

    Give it a TTL of at least `3600`. Any value can be set here. However understand that if the duration is too long, if you need to change your key, the ttl period will need to pass before any cached look ups will expire.

    enter the value of (obviously, use the output of your command run):

    ``` text
    "v=DKIM1; p="
      "MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEArP2MsM5q9IbgVTxwj0nA"
      "2Iqa8NsL5L72TGEnBib8nusfoFWw5G8yGpAkterD7w9hIhCiRbpXakzQ8a9vrsnF"
      "HsQph79d02mAndE9VS3b+dxABzGKNWdRszrKHDb4q8OeX+g6fsPlPlIOb1ngg4qo"
      "oVJTlswV3KacE7OwGq1ZRy8X6CIAjzeiC3x7qiBH5Yxi895i7GLeTwMKQY8mIv1Z"
      "iLVoNcH5lpB3FOJFWtXiztpkQaLLVY/YQAGzwRnWQHcqRd6ybtf9q34ADYhq1gZb"
      "NC6GOnkets6mv2o7daTQ78Sr+GO2/4DpciXGIDB8QbbX4Qh0kaazEqx9HlGG7MC2"
      "TdyIjmMF0pzI9qjVDdkXvwFJLLyIDP4Y4DgGuVHi/+Zdi9YtxcWrKpb8Zv+32xgU"
      "Qvz8EQt03upcpxB0aVRkK1I6GYKYr3I0uhYhfBZdUonUkxaklcnrQZVsooo+xont"
      "MMyPbPM6HYf0KJZCxGa6AYrIiYlnj7giudVTJdvA1J3IOQEGjq0tRmH0id/Qv2F5"
      "Po5zMEPMtx/pcWcqEJEC7/phgboQ3vkZYf/lCqZ8T2JXAIE9ujQFTFE86v+pXhVf"
      "98/oY4n5PN9LYfaflkTOmWyfig/qQ7mCjxdaYnOko9hlUnaRGrG5d6Dfy16qFt64"
      "PYEseCN67yeWZz8r1NaZHckCAwEAAQ=="
    ```

    !!! tip Note
        If you have multiple keys, the above command will output all of the keys and selectors that was configured within amavis.

2. once dns is configured, you can test the DNS entries and amavis config with the following command `amavisd testkeys` if the tests pass, you have configured it properly.


## Changing DKIM Keys

To change your DKIM keys, generate new ones, ensuring you utilise a differently named selector and update `99-dkim-keys` with your new key details. You will also be required to update the DNS entries.

!!! alert Danger
    If you reconfigure amavis to sign your E-Mails with a new key before the DNS changes take effect (before cache expires), you run the risk of having your E-Mails fail the receiving servers DKIM checks.
    It is recommended that you do the following:
    
        1. generate the new key, add it to a new `dkim_key` section in file `99-dkim-keys`

        2. run `amavisd-new showkeys` to get your dns config. Reconfigure DNS with the new key

        3. wait 24 hours

        5. Prevent users from sending emails (or do after hours when the mail server would normally be quite)

        3. edit the `s` to match the new key selector and `d` value to match the domain name in the new key file in section `@dkim_signature_options_bysender_maps` in file `99-dkim-keys`

        6. restart amavis with `supervisorctl restart amavis`

        7. test the config with `amavisd testkeys`. if the tests pass, thumbs up.

        8. you are good to go.
