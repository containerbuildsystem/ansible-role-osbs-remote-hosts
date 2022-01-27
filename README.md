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

* `podman_user_group_name` - group name of the user running rootless podman. Default: osbs-podman.
* `podman_user_group_gid` - gid of the group. Default: 2022.
* `podman_user_name` - name of the user running rootless podman. Default: osbs-podman.
* `podman_user_uid` - uid of the user running rootless podman. Default: 2022.

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

