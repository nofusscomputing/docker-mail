## 0.1.0rc3 (2023-05-23)

### Bug Fixes

- **docs**: [e872534a](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/e872534aec12c0905a7713532f36f6fde63b4730) - use docs path instead of pages [ [!10](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/10) [!26](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/26) ]
- **mkdocs**: [9acc37ec](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/9acc37ec4f2286c06debbbfda0acb8a3bf04c998) - use correct edit path [ [!10](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/10) ]
- **website**: [c2902063](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/c290206392836642af5a3b6ca1dad67abe799b42) - correct repo name [ [!10](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/10) ]
- **docs**: [bfcb3469](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/bfcb346924b12411102fc58bec13aa7e0820a0ce) - add base files for navigation [ [!10](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/10) ]
- **ci**: [235aa8d7](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/235aa8d7ccd19dcee44f56a27367113f2e4f5354) - must have index.md file for linting to start [ [!10](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/10) ]
- **build**: [88689c87](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/88689c87ac84ba493652cbf22da934d5873c55b3) - ensure dovecot downloaded and installed [ [!10](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/10) ]
- **build**: [9a0df52c](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/9a0df52cd9d2d0f8574801ca73e6b0a525531b30) - fix build logic [ [!10](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/10) ]
- **publish**: [c30efc8b](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/c30efc8bd64f7d7702b71e3fed2acab915821f2c) - must specify docker publish details [ [!3](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/3) ]
- [29c6d6f7](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/29c6d6f7304c6bca751d3904e37d2561ac9f01a1) - lock debian base image [ [!3](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/3) ]
- **versions**: [840e2ad5](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/840e2ad5aead5effdb925dd640ce483782a11ca5) - update postfix [ [!3](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/3) ]
- **repo**: [d6b2b5b4](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/d6b2b5b40ef2643005078807da7ca7dcce82505a) - lock dovecot repo to specified version [ [!3](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/3) ]

### Code Refactor

- **image**: [4c106025](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/4c106025d545d89cadef0bf019a86cbaf7dca00a) - reduce the number of layers [ [!10](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/10) ]
- **dockerfile**: [1c6b3a36](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/1c6b3a3617cfcd0a781391c96d0265c2fb7eef3b) - use global var [ [!10](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/10) ]
- **dockerfile**: [88bfc649](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/88bfc64940e7a2b7073c8ebe644afd06a4e2149c) - use args for apt software versions [ [!10](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/10) ]
- **ci**: [300961aa](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/300961aaff303b1b4a6ea2f70b9c13fbf1831260) - update template path [ [!10](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/10) ]

### Continious Integration

- **gitlab**: [aa461590](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/aa461590a83065e81b3743e791975ebcad916874) - update to latest HEAD [ [!10](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/10) ]
- **compile**: [808ca861](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/808ca861edc1080844cbfd61bd962020146cdcf0) - add dovecot compile job [ [!10](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/10) ]
- **gitlab-ci**: [e2e704c5](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/e2e704c54588c6bddccfcd38c18f21a5bc863c78) - use dev branch and type docker container [ [!3](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/3) ]

### Documentaton / Guides

- **build**: [f22931e6](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/f22931e6f079657acc94f21e7e2d5c61410a150b) - added navigation for project [ [!10](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/10) ]

### Features

- **ci**: [80ccaaa6](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/80ccaaa6e7d875283770baff1b090b8807a65947) - trigger downstream website to build [ [!10](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/10) [!27](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/27) ]
- **docs**: [6409627d](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/6409627daeb7ce6a131bd7205409c3f8c07f9986) - add website static page building [ [!10](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/10) [!25](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/25) ]
- **build**: [7261769a](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/7261769a95a985b95a5f16142c0e461d0984174e) - dockerfile for compiling dovecot [ [!10](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/10) ]
- **arm64**: [a866bd82](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/a866bd82b82ae6ec45a1121bed1a6dfd9f59f114) - build arm64 image using compiled bins [ [!10](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/10) ]
- **amd64**: [676546f7](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/676546f71c13dcc8ddf7db7128b003b8f2416721) - use dovecot apt repo to install [ [!10](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/10) ]
- **build**: [2b497fd2](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/2b497fd2cf7678e17f544ad38187486cc4efeaf3) - specify architecture [ [!10](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/10) ]

## v0.1.0rc2 (2022-02-19)

### Bug Fixes

- **backup.sh**: [e8eb6f90](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/e8eb6f906f07b5044ec873327117dbf87e357797) - exclude unix sockets from backup [ [!9](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/9) ]
- **backup**: [acccf247](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/acccf24774e100f0cda38941549099adc52b7b58) - ssl dir renamed to certs [ [!9](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/9) ]
- **backup**: [93378dee](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/93378dee86abe5f1ee86e824f2543656e1826e64) - /var/spool/postfix needs to be backed up [ [!9](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/9) ]
- **sa-learn**: [43f6a356](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/43f6a356bd7f458ee33955151ff5609c2b599a70) - amavis can't do bayes check if not mask 777 [ [!9](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/9) ]
- **dovecot**: [e9fb4123](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/e9fb4123e9c6aad6d0793f4de0d21da46ba332fd) - sieve extensions debug error. [ [!9](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/9) ]
- **cron**: [e9718c97](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/e9718c97a678223257c2450cede863757e376b90) - sa-learn must run as spamd user [ [!9](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/9) ]
- **bayes_learn**: [967fd04f](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/967fd04fe7af6c3d5330357e18c1a76583163ede) - ensure journal is synced after scan [ [!9](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/9) ]
- **file_permission**: [fbdf6efa](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/fbdf6efab73324aceebfc49ab37190adb9bc0af5) - set spamd to own spamassassin folder [ [!9](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/9) ]
- **local_group**: [7f7a259a](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/7f7a259a820bdbb6025dfee93cfb8df5ad8dba0a) - amavis and opendkim added to vmail [ [!9](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/9) ]
- **build**: [db03fc2e](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/db03fc2efaa418b28267fe532a0cc9c09d2e09ab) - corrected syntax error in dockerfile
- **postfix**: [5f7095f2](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/5f7095f274e6fe3cf61d8b55e14eaa47f1d2ae4d) - only use the servers order of tls ciphers [ [!7](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/7) ]
- **logrotate**: [3120ecf2](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/3120ecf2f5cb61011c321f6e41936e6a77c0686c) - ensure log rotate runs [ [!7](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/7) ]
- **logrotate**: [6625d72a](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/6625d72a48bad7a6a50bc7e93d14470fbc6eacc6) - don't specify log extension [ [!7](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/7) ]
- **dovecot**: [edadc477](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/edadc4779e445ff7036de05fc55607a035a53eb0) - ensure quota syntax is correct [ [!7](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/7) ]
- **mailbox_quota**: [b3d80b41](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/b3d80b41ca7bd6a9b6c15f9d6ea09bbc206f4664) - ensure user quota visible. [ [!7](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/7) ]

### Continious Integration

- **docker_hub**: [3741b926](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/3741b92606281ddabfa9df50186818d54c0602e1) - fix rc release must be tagged 'dev' [ [!9](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/9) ]
- [3bca896c](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/3bca896c29fdbe3d79cc12ef56785ef7c02394ca) - Add dockerhub url to environment [ [!7](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/7) ]

### Features

- **docker_container**: [22a987a5](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/22a987a5133e8e878f8c79e016e218ea5a8b76d1) - Ensure amavis data is a volume [ [!9](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/9) ]
- **amavis**: [9f7ccabf](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/9f7ccabfa52dc71f14fa690ef9e7f0e3184f14c9) - don't allow user to send banned email [ [!9](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/9) ]
- **amavis**: [c3739c4f](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/c3739c4f1964e4e315cd9eaa2a67e787aa121688) - Don't allow user to send spam/virus [ [!9](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/9) ]
- **amavis**: [f6b7bae3](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/f6b7bae3eba7398ad6de11b9cb2b36594df6f891) - move policy bank to own config file [ [!9](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/9) ]
- **amavis**: [7ec97502](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/7ec975021659fee5ebaa78332fef0d9533ee769d) - Add received header to message [ [!9](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/9) ]
- **ssl_tls**: [2a222df7](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/2a222df7784e85f13a477c3859ca10709734c199) - updated dovecot and postfix accepted ciphers [ [!9](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/9) ]
- **dovecot**: [396cb15a](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/396cb15addc8fd6de038da3a66d16891226b0363) - Disable SSL/TLS protocol logging [ [!9](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/9) ]
- **postfix**: [24f10af6](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/24f10af6d6e16b75fc77cf4538033839058748ec) - prevent anonymous users on submission [ [!9](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/9) ]
- **dovecot**: [274ade2d](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/274ade2d8407ff91e448bff4c838a67f53074dde) - log SSL/TLS porotocol errors [ [!9](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/9) ]
- **dovecot**: [478336ca](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/478336ca686c7d6fdbd040d012126f3ad906f44b) - log failed authentication attempts [ [!9](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/9) ]
- **postfix**: [4554e9e6](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/4554e9e66d688c417a06f1a808403f985e4a2a22) - specify my_networks as localhost ONLY [ [!7](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/7) ]
- **postfix**: [41e03936](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/41e03936cc6e36473d0c962361d822d95ae69e86) - no compression or renegotiation [ [!7](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/7) ]
- **submission**: [4c37932b](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/4c37932bf78fbc0af2e4c354fec0a1af037e5e77) - check user quota recipient restriction [ [!7](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/7) ]
- **postfix**: [f90daea4](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/f90daea454fac0ccec781129128bbf40e43378a3) - enforce only reaying mail for auth destination [ [!7](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/7) ]
- **postfix**: [1b168f07](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/1b168f07d56c89cf8e5635aa3d00429342914f15) - enforce SMTPD recipient restrictions [ [!7](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/7) ]
- **postfix**: [58f42a79](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/58f42a7913625afda9550ce99328af9e8ede2df7) - Enforce SMTPD sender restrictions [ [!7](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/7) ]
- **postfix**: [8c68163e](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/8c68163e9d6dd2edf94bba6159156dde115cc8f8) - introduce smtpd helo restrictions [ [!7](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/7) ]
- **postfix**: [64258f2c](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/64258f2cd8b0a8febd63d585e9b3aa1fe5d88bd4) - enforce smtpd client restrictions [ [!7](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/7) ]
- **quota_status**: [8f938bd3](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/8f938bd3ce1a5f432a97a2aae75592f39e82d28e) - use a unix socket for postfix [ [!7](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/7) ]

## v0.1.0rc1 (2022-02-17)

### Code Refactor

- [bde6c054](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/bde6c054bbe4bea0a14509070fed9328138dbb1d) - conf config values updated [ [!6](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/6) ]
- **amavis**: [53e0cdd1](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/53e0cdd17139bdd3e6df079edec3c88ef12a5c1a) - move dkim key config to own file [ [!4](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/4) ]
- [3e30b278](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/3e30b2780ef53ef12d036d0e009bff19b96dd8e2) - ci code review suggestions [ [!2](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/2) ]
- **amavis**: [d8e51085](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/d8e51085a1e0598e564030790b1d0fcf5dd8fb17) - seperate config for socket [ [!2](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/2) ]
- **ssl**: [09aabeb6](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/09aabeb68aae478bd125e48b4bfaecaa7a97b1ae) - Moved /ssl to /certs [ [!2](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/2) ]

### Continious Integration

- **docker_hub**: [27ad07ea](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/27ad07ead345bbf7b0c929adbfd24947ef977e40) - fix dev push [ [!5](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/5) ]
- **docker_hub**: [aafd9acc](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/aafd9acca9fe98bad1710a4af2f1b0eabadd6944) - ensure build and DH push works on merge [ [!4](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/4) ]
- **docker_hub**: [36808960](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/36808960ce9a1369eebcaf0fe878d85bdbd37ced) - push a dev and latest tag to docker hub [ [!2](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/2) ]
- **docker_hub**: [76c899e2](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/76c899e285f7ea816d6fc4c7e78644302b5921b3) - removed duplicate rules section [ [!2](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/2) ]
- **docker_container**: [23830c85](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/23830c85510c5cff6da80fa6ab617b8580e29739) - set to allow failure [ [!2](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/2) ]

### Documentaton / Guides

- **spf**: [a71e7691](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/a71e7691a2188fb9372c2e7c9b32cb39adb4e8ce) - added basic spf guide [ [!6](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/6) ]
- [be42d0ad](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/be42d0ad3ba83717a9c4e907a48fd087539e720f) - Addied initial documentation for dkim [ [!4](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/4) ]

### Features

- **amavis**: [92e4e4b2](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/92e4e4b2d55ab538eda937bc698d7a11961c47b6) - added DKIM verification [ [!6](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/6) ]
- **spf**: [245aa724](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/245aa724d2d8121c7a758da6e086fe0a59c751d8) - conduct spf check for inbound smtp [ [!6](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/6) ]
- **posfix**: [b795fe5b](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/b795fe5b67ecdfaa9390d2028478fd0b6570cfcc) - configure submission to dkim sign [ [!2](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/2) ]
- **amavis**: [b9b2527a](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/b9b2527a42586843faea3ad074c1d34392b5d1d8) - Configured dkim [ [!2](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/2) ]
- **dkim**: [72ee475b](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/72ee475be7c459531762d489dd649d696a6f47be) - Added OpenDKIM to image [ [!2](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/2) ]

## v0.1.0rc0 (2022-02-14)

### Bug Fixes

- **fetchmail**: [1fe3598a](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/1fe3598a545044327026f44038be53eeb5f06182) - fix cron job so it runs [ [!1](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/1) ]
- **script**: [3601d90a](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/3601d90aefd42219c32fe5792d39839f52c5c2af) - group-mailbox script must be executable [ [!1](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/1) ]

### Code Refactor

- [b01bab03](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/b01bab033fc73866084ea583f416bea57f18d880) - readme linting errors [ [!1](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/1) ]
- [eb43442b](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/eb43442bb7a61bf1dc84f4a6e547375825db7e62) - cron out to /dev/null [ [!1](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/1) ]

### Continious Integration

- **detached_pipeline**: [99e61d0f](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/99e61d0f11736b8f8078fedc5569182a8e93a6a3) - stop MR jobs
- **build**: [f80c02ba](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/f80c02ba1530c51e34e2f41b59f91edf7a5d00a9) - Added docker container build job [ [!1](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/1) ]
- **gitlab-ci**: [b536a5e4](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/b536a5e4b4d0522377e093eec2a0dffb771e6a01) - updated to current dev commit [ [!1](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/1) ]
- **markdown_lint**: [38a25272](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/38a252727d103bdd2ccc18f09f74ba4337e8422c) - added linting rule file [ [!1](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/1) ]

### Documentaton / Guides

- **README**: [6a61efe2](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/6a61efe229a2a31703f5539e03cc8910e0feba3e) - updated readme [ [!1](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/1) ]

### Features

- **spam-learn**: [3a3f2098](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/3a3f2098c7d81ae85ee42751fa8aef4bbec6a624) - add duration to email [ [!1](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/1) ]
- **vscode**: [1d73c6eb](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/1d73c6eb8c1f67accaa9c310ad0dc76458c3d2bd) - recommended extensions added [ [!1](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/1) ]
- **shared_mailbox**: [d8ad253f](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/d8ad253f98b81b747dea101748cf2687d148bdd0) - added helper script to share mailbox. [ [!1](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/1) ]
- **sa-learn**: [5ec218da](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/5ec218dad9865a38f5846c90fd6ccc5c30721d81) - Added cron script to learn spam/ham [ [!1](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/1) ]
- **fetchmail**: [ace2493f](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/ace2493f66a6cc39ea406180ab7d7f8aa21ade88) - added fetchmail [ [!1](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/1) ]
- **backup**: [a7c1ae05](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/a7c1ae052cb441d7445610b2ac5a7caf8e66d9d1) - Added backup cron and helper script. [ [!1](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/1) ]
- **amavis**: [4db1b34d](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/4db1b34d386456fcc3c2ac562cfe5330b61af847) - added amavis and configured spam [ [!1](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/1) ]
- [df8997f0](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/df8997f07de834dc8ffd3c3e58ff82b0da87c806) - Added Dovecot and Postfix to container [ [!1](https://gitlab.com/nofusscomputing/projects/docker-mail/-/merge_requests/1) ]

## v0.0.2 (2022-02-11)

### Documentaton / Guides

- **README**: [bbd2f146](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/bbd2f14662a05d58fd6e5a7062b0d1cc51268489) - added initial repo readme [ [#1](https://gitlab.com/nofusscomputing/projects/docker-mail/-/issues/1) ]

## v0.0.1 (2022-02-11)

### Continious Integration

- **gitlab-ci**: [4a6f36d0](https://gitlab.com/nofusscomputing/projects/docker-mail/-/commit/4a6f36d07835cbc7076833de129ed668cf1002ce) - added gitlab CI v0.6.1rc0 [ [#1](https://gitlab.com/nofusscomputing/projects/docker-mail/-/issues/1) ]
