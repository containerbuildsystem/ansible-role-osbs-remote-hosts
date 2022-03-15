ansible-role-osbs-remote-host
=============================

Setup remote host VMs as required by OSBS:


Requirements
------------

Provisioned remote host VMs with ssh access.

Dependencies
------------

None.

Role Variables
------------

### Input

* `podman_user_group_name` - group name of the user running rootless podman backend. Default: osbs-podman.
* `podman_user_group_gid` - gid of the group. Default: 2022.
* `podman_user_name` - name of the user running rootless podman backend. Default: osbs-podman.
* `podman_user_uid` - uid of the user running rootless podman backend. Default: 2022.
* `podman_user_subordinate_uid_start` - subordinate uid starts from. Default: 10000000.
* `podman_user_subordinate_uid_count` - subordinate uid count. Default: 1878948191.
* `podman_user_subordinate_gid_start` - subordinate gid starts from. Default: 10000000.
* `podman_user_subordinate_gid_count` - subordinate gid count. Default: 1878948191.
* `podman_ssh_user_name` - ssh user login name for connecting remote podman backend.
* `podman_ssh_user_public_key` - ssh public key for user which is used to connect remote podman backend.
* `podman_pruning_interval_minutes` - minutes interval for podman pruning job
* `podman_pruning_until` - until for podman pruning command

Example Playbook
----------------

    - name: Setup remote hosts
      hosts: remote-hosts
      roles:
      - role: ansible-role-osbs-remote-host

License
-------

BSD

Author Information
------------------

Ladislav Kolacek <lkolacek@redhat.com>

