[![Build Status - Master](https://travis-ci.org/juju4/ansible-sketchy.svg?branch=master)](https://travis-ci.org/juju4/ansible-sketchy)
[![Build Status - Devel](https://travis-ci.org/juju4/ansible-sketchy.svg?branch=devel)](https://travis-ci.org/juju4/ansible-sketchy/branches)
# Sketchy ansible role

Ansible role to setup Netflix sketchy.
Sketchy is a task based API for taking screenshots and scraping text from websites. 

Please note
* project is based on [PhantomJS which is archived](https://github.com/ariya/phantomjs/issues/15344)
* migration to chrome headless is [pending](https://github.com/Netflix/sketchy/issues/40)

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0
 * 2.2
 * 2.5

### Operating systems

Tested on Ubuntu 14.04, 16.04 for now but should work on 12.04 and similar debian based systems.
Pre-support for 18.04 but phantomjs issue.
More work is needed for redhat-based distribution or other Unix.

### Dependencies

None

## Example Playbook

Just include this role in your list.
For example

```
- host: myhost
  roles:
    - juju4.sketchy
```

And connect at the end on https://IP/api/v1.0/capture.
It should return '[]'
Test with: https://IP/eager?url=http://google.com&type=sketch

To finish integration, you should review
https://github.com/Netflix/Sketchy/wiki

## Variables

List with default values
* sketchy_user: sketchy
* sketchy_home: /var/sketchy
* sketchy_root: /var/sketchy/git
* sketchy_host: 127.0.0.1
* sketchy_port: 8000
* sketchy_use_ssl: true
* sketchy_certinfo: '/C=US/ST=CA/L=San Francisco/O=Ansible'
* sketchy_certduration: 1095

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).
Default kitchen config (.kitchen.yml) is lxd-based, while (.kitchen.vagrant.yml) is vagrant/virtualbox based.

Once you ensured all necessary roles are present, You can test with:
```
$ gem install kitchen-ansible kitchen-lxd_cli kitchen-sync kitchen-vagrant
$ cd /path/to/roles/juju4.sketchy
$ kitchen verify
$ kitchen login
$ KITCHEN_YAML=".kitchen.vagrant.yml" kitchen verify
```
or
```
$ cd /path/to/roles/juju4.sketchy/test/vagrant
$ vagrant up
$ vagrant ssh
```

## Troubleshooting & Known issues

* No additional security is provided. Do your homework with hardening.
* Backup/Restore script
* Monitoring
check process, http page

## License

BSD 2-clause

