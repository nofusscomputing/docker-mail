---
title: SPF configuration
Description: How to configure SPF for No Fuss Computings docker mail server.
---

Sender Policy Framework (SPF) is defined in [RFC7208, Sender Policy Framework (SPF) for Authorizing Use of Domains in Email](https://datatracker.ietf.org/doc/html/rfc7208).

DNS SPF text record example:

``` text
IN    TXT    "v=spf1 mx a ip4:192.168.0.100 ip6:2001:ef3:2911::/64"
                 " a:mail.example.org a:mail2.example.org -all"
```

1. `v=spf1` Version attribute. only v1 available.

2. `mx` `a` DNS record type. This indicated that `mx` and `a` records within the domain are authorized senders.

3. `ip4:192.168.0.100` indicates that an ipv4 address as specified is authorized as a sender.

4. `ip6:2001:ef3:2911::/64` Sepcifies that an ipv6 subnet is authorized as a sender

5. `-all` specifies a fail if the sender doesn't match what is specified in the record. other valid qualifiers are "+" pass, "-" fail, "~" softfail, "?" neutral

!!! tip
    To allow only specified MX DNS records to be the only specified senders, create a record as follows:

    ``` text
    IN    TXT    "v=spf1 mx -all"
    ```

    If your MX servers only receive mail, then this option is not suitable. you'll have to use the hostname of the receiving server.

    ``` text
    IN    TXT    "v=spf1 a:mail.example.org -all"
    ```
