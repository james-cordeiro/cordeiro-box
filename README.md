# cordeiro-box

Using Vagrant is a great tool to quickly and ultimately deploy a development and/or production environment so you (as a developer) can concentrate on the code more exclusively knowing the tech stack and the provisioning of it has been mostly taken care off. 

This is my ultimate development stack, which is a Vagrant Box provisioned and modified with PuPHPet. Whenever I need to provision a new development environment quickly and `headache-free` I quickly turn to my solution to deploy on VirtualBox an extensive development stack so that I can quickly start working on code.

**For the environment and tech stack details installed on this box, please refer to https://github.com/james-cordeiro/cordeiro-box/blob/master/ENVIRONMENT.md**

## It's easy (prerequisites)

The instructions for deploying a development box in no time is straight forward and easy. 

The prerequisites before installing the box are the following:

1. Install Git (don't forget to add the public key to your account if using github or bitbucket etc)
    - http://git-scm.com/download/win (Windows)
    - http://git-scm.com/download/mac (Mac)
    - http://git-scm.com/download/linux (linux)
2. Install Vagrant
    - https://www.vagrantup.com/downloads.html
3. Install a VM emulator
    - https://www.virtualbox.org/
    - http://www.vbox.me/ (Portable Virtual box)

This link may be useful to you if working with a Windows machine (http://cygwin.com/install.html) 

Simply download the packages above (relevant to your system) and follow the instructions. Windows users may find it useful to refer to http://cygwin.com/install.html for help installing Git. Any other issues is unfortunately beyond the scope of this readme but if you have made it this far without headache then the next step is the easiest. 

First of all, create a directory somewhere on your computer/system. Here is a command line example (run it in sequence) on a macbook pro but you can simply use traditional point and click methods of creating a folder (if that is your preference).

``` terminal
  $ cd /%USERPROFILE%/%DIR%
  $ mkdir vagrant_boxes
  $ cd vagrant_boxes
```

Once you have a folder created, open up your terminal/command prompt and navigate to the created folder. Something like, `cd DIR_PATH_HERE`. Once here, run the following in sequence:

``` shell
  $ git clone git@github.com:james-cordeiro/cordeiro-box.git
  $ cd cordeiro-box
  $ vagrant up
  $ sh /vagrant/puphpet/files/startup-always/run.sh
```

When you run the `vagrant up` command, make sure that the git cloned repo has put the vagrantfile file in the same directory as you run the `vagrant up` command.

....and, **that's it**, as easy as 1...2...and no 3. You will need to wait a while as the box is quite large (larger than most) due to being large in size as the initlisation contains many different installed packages to help the developer get started in a number of different diciplines. 

N.B. Please note, that upon running the vagrant up command there may be people struggling to pay. 

## Out of the box

**For the environment and tech stack details installed on this box, please refer to https://github.com/james-cordeiro/cordeiro-box/blob/master/ENVIRONMENT.md**

## You may want to know

### Provisionment & customizing your box

The **cordeiro-box** is initally provisioned using PuPHPet. A number of packages have been added on top since the initial build. If you would like to customize you box then you can either edit the `puphpet/config.yaml` or create a `puphpet/config-custom.yaml` file which overrides (higher-order priority) the config.yaml file to provision your custom required libraries. This file is also initally ignored by git so any customizations forked can keep your private customizations private. 

If you change anything (in the provisioning config files), you can have it take effect within your virtual machine by running `$ vagrant provision`. If you make changes before you actually spin up your **cordeiro-box**, the changes will be applied on your first `$ vagrant up`.

### Webmin

Webmin is installed and can be found on the Guest machine on port 10000 (from the host). The firewall settings and ports have already been opended but you may want to install the Nginx module to be available from within the interface. Instructions and module for Nginx can be found here: http://www.webmin.com/cgi-bin/search_third.cgi?search=nginx

In addition to this, the configuration of webmin will need to be changed to run only on https (you can just leave it as it's a development build but good to know). You can find helpful documentation directly on the Webmin website (http://www.webmin.com/docs.html). 

### dev.local (not a direct IP address)

When you first turn on the **cordeiro-box** VM and directly 'punch' in the ip address to your box a holder page will appear stating that you should set up your hosts file to access the local web environment that has been deployed through a domain name input. 
`cordeiro-box` has already been configured to accept `dev.local` as the default route into a Nginx PHP-fpm services web envrionment and `node.local` which routes requests to a Nodejs service.

You will first of all need to edit your hosts file (and possibly restart your machine) for changes to take effect. Here are two links with instructions to alter your host OS's hosts file.

http://www.rackspace.com/knowledge_center/article/how-do-i-modify-my-hosts-file
http://www.howtogeek.com/howto/27350/beginner-geek-how-to-edit-your-hosts-file/

You will then need to alter your host file to re-direct `dev.local` & `node.local` (current hostname setup with **cordeiro-box**) and point that to the listening local IP of the vm (details of IP below).

### Credentials & how to logon

The passwords and users can be found on the `puphpet/config.yaml` file. However, here are a quick set of details to get you up and running into your box in next to no time.

The IP address in use is: ###**192.168.56.101**

| Service          | Username      | Passwd      |
| ---------------- |:-------------:| -----------:|
| ssh / main user  | vagrant       | vagrant     |
| mysql            | root          | 123         |
| webmin	       | root	       | vagrant     |

The vagrant user has full sudo privileges. Please note that this is not an exhaustive list of user logins as there are password accounts to set-up for other packages (such as mongodb, postgreSQL, etc).







Extra Reading
=============

It is important that files are ignored from git when working with .box files as these files end up being extremely big and exceed the file limit restrictions for GitHub and git in general. There is a newer service from GitHub that allows for versioning larger files. It is recommened that box files (or larger files in general) are uploaded through that service if you wish to version packed vagrant boxes (outside of the vagrant cloud service)

Please note that there will already be a local .gitignore for ignoring files with .box extensions so that you can safely include the vagrant box files in the same directory as the git repo but without committing these large files upstream.

https://help.github.com/articles/ignoring-files


--

Among using 'vagrant ssh' or an ssh agent such as putty for windows you may want to use a program such as WinSCP to view the files and edit in GUI form. 

You will need to use the following credentials in order to connect (if using WinSCP - FileZilla may need different instructions):

* host: 192.168.56.101
* Port: 22
* Username: vagrant
* Password: vagrant
* Created SSH Key File

However, this will not work until the RSA private key (.ppk file) is also supplied (before attempting to login). To create the private key (for use with WinSCP) you can follow the following steps. Please refer to you OS and User Agent of chose to know how to create SSH Key Files.

The following steps will help you:

- convert the %USERPROFILE%\.vagrant.d\insecure_private_key to .ppk using PuTTYGen (recommended to back up this key seperately first)
- use the .ppk key in your PuTTY session - configured in Connection > SSH > Auth > Private key file
- use 'vagrant' as the passphrase or leave empty 



------




Setting up the remainder of your environment
============================================

The following readme is designed to get you set-up and ready to within the shortest time possible with Git and Windows environment. If working in a team please do take a moment to read through and apply these neccessary set-up steps.

Git
----

Some boxes (if not all) will have git installed. You will need to perform the following actions to personalise the git account in use for your box when working with git and development teams

Amend the git config like so with the following shell commands (substituting where neccessary):

```Shell
    $ git config --global user.name "Your Name"
    $ git config --global user.email "youremail@domain.com"
```

If you are using a service such as github or bitbucket then you will need to install the ssh keys neccessary to perform pull/push requests to the online git repos. Instructions can be found here: https://help.github.com/articles/generating-ssh-keys


Node
----

If the box / app you will be developing within your box uses nodejs (a node app) then upstart is recomended as the starting command for the node app to run as a daemon like service.

Instructions for doing this can be followed here:

- http://kvz.io/blog/2009/12/15/run-nodejs-as-a-service-on-ubuntu-karmic/
- http://howtonode.org/deploying-node-upstart-monit
    
If the box you are 'vagrant up'-ing is/has a node app installed then it likely has a set-up for the upstart already installed too. It is likely to be called with the same name as the vagrant box name. More upstarts can be added of course (or deleted).

An example command for upstart would be:

```Shell
    $ start my_box_name
    $ stop my_box_name
```

**This repo doesn't use upstart but instead uses pm2 to start the node daemon service. It then manages it along with Nginx serving the static files.
