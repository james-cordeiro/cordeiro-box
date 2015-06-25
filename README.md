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
  $ cd /Users/sjoc20/
  $ mkdir vagrant
  $ cd vagrant
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

Webmin is installed and can be found on the Guest machine on port 10000. However, the firewall settings on the box will need to be adjusted to accept requests for that port. In addition to this, the configuration of webmin will need to be changed to run only https. You can find helpful documentation directly on the Webmin website (http://www.webmin.com/docs.html). 

### dev.local (not a direct IP address)

When you first turn on the **cordeiro-box** VM and directly 'punch' in the ip address to your box a holder page will appear stating that you should set up your hosts file to access the local web environment that has been deployed. 

You will first of all need to edit your hosts file (and possibly restart your machine) for changes to take effect. Here are two links with instructions to alter your host OS's hosts file.

http://www.rackspace.com/knowledge_center/article/how-do-i-modify-my-hosts-file
http://www.howtogeek.com/howto/27350/beginner-geek-how-to-edit-your-hosts-file/

You will then need to alter your host file to re-direct `dev.local` (current hostname setup with **cordeiro-box**) and point that to the listening local IP of the vm (details of IP below).

### Credentials & how to logon

The passwords and users can be found on the `puphpet/config.yaml` file. However, here are a quick set of details to get you up and running your box in next to no time.

The IP address in use is: **192.168.56.101**

| Service          | Username      | Passwd      |
| ---------------- |:-------------:| -----------:|
| ssh / main user  | vagrant       | vagrant     |
| mysql            | root          | 123         |

The vagrant user has full sudo privelleges. Please note that this is not an exhaustive list of user logins as there are password accounts to set-up for other packages (such as webmin, mongodb, postgreSQL, etc).



Extra Reading
=============

It is important that files are ignored from git when working with .box files as these files end up being extremely big and exceed the file limit restrictions for GitHub and git in general. 

Following the tips in the following link will guide you as to how to ignore local files from commiting upstream, these are normally configuration files that change often. It will guide you how to globally ignore files from all repos as perhaps your editor of choice generates automated configuration files that shouldn't be uploaded. Take a look to familirise yourself with your local git set-up. 

Please note that there will already be a local gitignore for ignoring files with .box extensions so that you can safely include the vagrant box files in the same directory as the git repo but without committing these large files upstream.

https://help.github.com/articles/ignoring-files



------


Windows Set-up
================

1. Install Git, Vagrant & Virtual Box pre-requsites for Windows.

2. Git clone (or pull request) the vagrant_boxes repository

3. Navigate Windows Command Prompt to the directory where your package.box you want to initlise is stored and copy the vagrantfile from the git folder to this directory. 

4. Run in cmd:
    ```Shell
        $ vagrant box add [box name] package.box [--force]
        $ vagrant up
    ```
    
- please note that you may need to use the --force command to overwrite/update a box of the same name (or one that has already been added) when doing the vagrant box add command.
- Please note that <b>vagrant init [box name]</b> was skipped in this process as the vagrantfile will have been already created with the neccessary configuration set-up for your box of choice; Performing a vagrant init command will reset your vagrantfile configuration (if forced to).

<b>Important Note</b>:

The package.box file is too BIG to be stored in git. You will need to obtain your package.box file from either the vagrant share cloud, downloaded by some other means or obtained from sharing with other developers e.g. stored on a USB.

Any configuration updates should be pushed upstream to the vagrantfile to keep other developers in sync when they pull the downstream from the repo.

The box you are using is more than likely to be set-up to respond to http://127.0.0.1:8080 (or http://localhost:8080) however, should you like to use any other domain such as http://mydomain.local then with windows 7 & 8 you may edit the windows hosts file (located here: <b>C:/Windows/System32/Drivers/etc</b>) and appending "http://127.0.0.1:8080 http://mydomain.local". You can call your domain anything you like, even just a singular word such as "domain". However, do remember this will stop you accessing a domain in the outside world from your machine with the same domain name that you choose to import into the hosts file so make you enter a unique name if you want to avoid this. Remember to restart your machine as this may be needed for the host file changes to take effect. You will finally need to configure your box to listen on http://mydomain.local as well (within the VM)

--

Among using 'vagrant ssh' or an ssh agent such as putty for windows you may want to use a program such as WinSCP to view the files and edit in GUI form. 

You will need to use the following credentials in order to connect (if using WinSCP - FileZilla may need different instruction):

* host: 127.0.0.1
* Port: 2222
* Username: root
* Password: vagrant
* Key File password: vagrant

However, this will not work until the RSA private key (.ppk file) is also supplied (before attempting to login). If the box pulled from git does not contain a 'vagrant_rsa_private.ppk' to use then you will need to create the private key (for use with WinSCP) yourself.

The following steps will help you:

- convert the %USERPROFILE%\.vagrant.d\insecure_private_key to .ppk using PuTTYGen (recommended to back up this key seperately first)
- use the .ppk key in your PuTTY session - configured in Connection > SSH > Auth > Private key file
- use 'vagrant' as the passphrase



------




Setting up the remainder of your environment
============================================

The following readme is designed to get you set-up and ready to within the shortest time possible. If working in a team please do take a moment to read through and apply this neccessary set-up steps.

Git
----

Some boxes (if not all) will have git installed. You will need to perform the following actions to personalise the git account in use for your box when working with git and development teams

Amend the git config like so with the following shell commands (substituting where neccessary):

```Shell
    $ git config --global user.name "Your Name"
    $ git config --global user.email "youremail@domain.com"
```

If you are using a service such as github or bitbucket then you will need to install the ssh keys neccessary to perform upstream pull/push requests to the online git repos. Instructions can be found here: https://help.github.com/articles/generating-ssh-keys

Node
----

If the box / app you will be developing within your box uses nodejs (a node app) then upstart is recomended as the starting command for the node app to run as a daemon like service.

Instructions for doing this can be followed here:

- http://kvz.io/blog/2009/12/15/run-nodejs-as-a-service-on-ubuntu-karmic/
- http://howtonode.org/deploying-node-upstart-monit
    
If the box you are 'vagrant up'-ing is/has a node app installed then it likely has a set-up for the upstart already installed too. It is liekly to called with the same name as the vagrant box name. More upstarts can be added of course (or deleted).

An example command for upstart would be:

```Shell
    $ start my_box_name
    $ stop my_box_name
```
