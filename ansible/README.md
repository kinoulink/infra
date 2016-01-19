## Host management with Ansible

We use Ansible http://www.ansible.com/services to manage hosts.
 
### Commands

#### Ping

````ansible all -m ping -s -k -u vagrant````

Let's cover these commands:

- **all** Use all defined servers from the inventory file
- **-m ping** Use the "ping" module, which simply runs the ping command and returns the results
- **-s** Use "sudo" to run the commands
- **-k** Ask for a password rather than use key-based authentication
- **-u vagrant** Log into servers using user vagrant