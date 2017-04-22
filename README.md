Arch-server
===========

These are my arch-server install files.
I use them as a base for my client machines too.

### Requirements
- Base packages group
- Sudo
- having a user with sudo rights

### How to use it
To install this base system, you just have to invoke restore.sh as the chosen user with sudo rights.
By default, it will only copy configuration files. If you want to install packages, use "--install".  
If you want to build a ssh server, use "--ssh".  
If you need docker, use "--docker".  
Finally, if you want everything, there is a "--full" option.

### Is it stable ?
Of course not. This code is not meant to be used in your production (it was made for me).
The best is to read it and use some parts here and there for your personal use if you want to.
