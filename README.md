ansible-role-osbs-remote-host
=============================

Setup remote host VMs as required by OSBS:


Requirements
------------

Provisioned remote host VMs with ssh access.

Dependencies
------------

None.

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

