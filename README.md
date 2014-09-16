SshPortTunneling
==================

About
-----

This script create a tunneling with local port forwarding to a remote Windows machine accessible only through work pc/work ip
~~~
       _________          ________________          ________
      |         |        |                |        |        |
      | HOME PC | -----> | WORK PC TUNNEL | -----> | REMOTE |
      |_________|        |________________|        |________|
~~~

Require
-------
This require ssh and krdc or rdesktop installed on your local system and sshd installed running and accessible from home pc on your "work" pc
Windows machina must have rdp enable and an firewall rule to permit access (from work)

More info
---------
For more info about ssh tunneling please see [Buddhika Chamith's](http://chamibuddhika.wordpress.com/2012/03/21/ssh-tunnelling-explained/) post
or [this article on Revsys website](http://www.revsys.com/writings/quicktips/ssh-tunnel.html)

For a list of common ports please see [Wikipedia](http://it.wikipedia.org/wiki/Lista_di_porte_standard)
or 
```
cat /etc/services 
```
in a common linux box

How to use?
-----------

Save the file into your system ( "bin" path is prefeded )
```
chmod +x ./SshPortsTunneling
```

Now you can call the script from your CWD directory and answer the simple questions to setting the connection for your case.

When the script do a ssh connection the proces goes in foreground, you can monitor it with 
```ps - aux```
and/or kill by take note of pid.

RDP
---
Now the remote port 3389 is forwarded to your local port 3389, you can open kRDC (gui program) or rdesktop (cli program) to make a connection like this
```
rdesktop [options] server[:port]
```
in our case
```
rdesktop localhost
```
if you changed LPORT variable please specify it like
```
rdesktop localhost:9876
```

