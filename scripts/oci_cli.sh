#!/usr/bin/expect -f 

spawn /tmp/install_oci_cli.sh

expect "===> In what directory would you like to place the install? (leave blank to use '/home/opc/lib/oracle-cli'): "
send "\n"
expect "===> In what directory would you like to place the 'oci' executable? (leave blank to use '/home/opc/bin'): "
send "\n"
expect "===> Modify profile to update your \$PATH and enable shell/tab completion now? (Y/n): "
send "\n"
expect "===> Enter a path to an rc file to update (leave blank to use '/home/opc/.bashrc'): " 
send "\n"
