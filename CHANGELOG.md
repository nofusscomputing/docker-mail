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
