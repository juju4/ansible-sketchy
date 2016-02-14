# Sketchy ansible role

Ansible role to setup Netflix sketchy.
Sketchy is a task based API for taking screenshots and scraping text from websites. 

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9

### Operating systems

Tested with vagrant only on Ubuntu 14.04 for now but should work on 12.04 and similar debian based systems.
More work is needed for redhat-based distribution or other Unix.

### Dependencies

None

## Example Playbook

Just include this role in your list.
For example

```
- host: myhost
  roles:
    - sketchy
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

## Known issues

* No additional security is provided. Do your homework with hardening.
* Backup/Restore script
* Monitoring
check process, http page

## License

BSD 2-clause

