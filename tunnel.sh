#!/bin/sh
#
#####################################################
#
# autor: naitso
# date: 2014/09/16
#
# required: ssh
#
# description:
# This script create a Tunneling with Local port forwarding 
# to connect in rdp to a Windows machine from home pc through work pc
#
#     -----------        ------------------        ----------
#     | HOME PC | -----> | WORK PC TUNNEL | -----> | REMOTE |
#     -----------        ------------------        ----------
#
# For more info about ssh tunneling please see Buddhika Chamith's post at
#
# http://chamibuddhika.wordpress.com/2012/03/21/ssh-tunnelling-explained/
#
# Or this article on Revsys website
# http://www.revsys.com/writings/quicktips/ssh-tunnel.html
#
# For a list of common ports please see
# http://it.wikipedia.org/wiki/Lista_di_porte_standard 
# or /etc/services in a common linux box

#####################################################

#
# Set local port, 3389 is default port for windows rdp
LPORT=3389
# Set remote port, 3389 is default port for rdp
RPORT=3389

clear
echo ""
echo "This script perform a ssh local port tunneling for rdp port 3389"
echo ""
echo ""
echo "Write remote ssh server's IP or hostname to connect"
echo "(like www.example.com or  111.222.333.444)"
echo "this server permit the tunnel"
echo ""
read RHOST

clear
echo ""
echo "Write the user to use for ssh login"
echo ""
read RUSER


clear
echo ""
echo "Write remote host to connect to, like IP address or www.example.com"
echo "this host is the remote pc/server to connect to"
echo ""
read REMOTE

# -f put ssh in foreground
# -N flag does not promt shell
# echo "ssh -f $RUSER@$RHOST -L $LPORT:$REMOTE:$RPORT -N"
# this command opend a ssh connection and map remote port 3389 to local port 3389
# after connection use rdesktop or krdc to connect with rdp protocol to localhost
ssh -f $RUSER@$RHOST -L $LPORT:$REMOTE:$RPORT -N 
SSHPID=`ps aux | grep "ssh -f $RUSER@$RHOST -L $LPORT:$REMOTE:$RPORT -N" | grep -v grep| cut -d " " -f4`
echo "SSH PID $SSHPID"

