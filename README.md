# cordeiro-box

Using Vagrant is a great tool to quickly and ultimately deploy a development and/or production environment so you (as a developer) can concentrate on the code more exclusively knowing the tech stack and the provisioning of it has been mostly taken care off. 

This is my ultimate development stack, which is a Vagrant Box provisioned and modified with PuPHPet. Whenever I need to provision a new development environment quickly and `headache-free` I quickly turn to my solution to deploy on VirtualBox an extensive development stack so that I can quickly start working on code.

**For the environment and tech stack details installed on this box, please refer to https://github.com/james-cordeiro/cordeiro-box/blob/master/ENVIRONMENT.md**

## It's easy (prerequisites)

The instructions for deploying a development box in no time is straight forward on easy. 

The prequistets before installing the box are the following:

1. Install Vagrant (https://www.vagrantup.com/downloads.html)
2. Install VirtualBox (https://www.virtualbox.org/wiki/Downloads) - download one of the platform packages
3. Install Git (https://git-scm.com/downloads) - Windows users may find this link useful: 

Simply download the packages above (relevant to your system) and follow the instructions. Windows users may find it useful to refer to this link here, ......... when installing Git. Any other issues is unfortunately beyond the scope of this readme but if you have made it this far without headache then the next step is the easiest. 

First of all, create a directory somewhere on your computer/system. Here is a command line example (run it in sequence) on a macbook pro but you can simply use traditional point and click methods of creating a folder (if that is your preference).

``` terminal
  $ cd /Users/sjoc20/
  $ mkdir vagrant
  $ cd vagrant
```

Once you have a folder created, open up your terminal/command prompt and navigate to the created folder. Something like, `cd DIR_PATH_HERE`. Once here, run the following in sequence:

``` shell
  $ git clone ....
  $ vagrant up
```

When you run the `vagrant up` command, make sure that the git cloned repo has put the vagrantfile file in the same directory as you run the `vagrant up` command.

....and, **that's it**, as easy as 1...2...and no 3. You will need to wait a while as the box is quite large (larger than most) due to being large in size as the initlisation contains many different installed packages to help the developer get started in a number of different diciplines. 

N.B. Please note, that upon running the vagrant up command there may be people struggling to pay. 

## Out of the box

**For the environment and tech stack details installed on this box, please refer to https://github.com/james-cordeiro/cordeiro-box/blob/master/ENVIRONMENT.md**

## You may want to know

### Provisionment & customizing your box

The `**cordeiro-box**` is initally provisioned using PuPHPet. A number of packages have been added on top since the initial build. If you would like to customize you box then you can either edit the `puphpet/config.yaml` or create a `puphpet/config-custom.yaml` file which overrides (higher-order priority) the config.yaml file to provision your custom required libraries. This file is also initally ignored by git so any customizations forked can keep your private customizations private. 

If you change anything (in the provisioning config files), you can have it take effect within your virtual machine by running `$ vagrant provision`. If you make changes before you actually spin up your `**cordeiro-box**`, the changes will be applied on your first `$ vagrant up`.

### Webmin

Webmin is installed and can be found on the Guest machine on port 10000. However, the firewall settings on the box will need to be adjusted to accept requests for that port. In addition to this, the configuration of webmin will need to be changed to run only https. You can find helpful documentation directly on the Webmin website (http://www.webmin.com/docs.html). 

### dev.local (not a direct IP address)

When you first turn on the `**cordeiro-box**` VM and directly 'punch' in the ip address to your box a holder page will appear stating that you should set up your hosts file to access the local web environment that has been deployed. 

You will first of all need to edit your hosts file (and possibly restart your machine) for changes to take effect. Here are two links with instructions to alter your host OS's hosts file.

http://www.rackspace.com/knowledge_center/article/how-do-i-modify-my-hosts-file
http://www.howtogeek.com/howto/27350/beginner-geek-how-to-edit-your-hosts-file/

You will then need to alter your host file to re-direct `dev.local` (current hostname setup with `**cordeiro-box**`) and point that to the listening local IP of the vm (details of IP below).

### Credentials & how to logon

The passwords and users can be found on the `puphpet/config.yaml` file. However, here are a quick set of details to get you up and running your box in next to no time.

The IP address in use is: **192.168.56.101**

| Service          | Username      | Passwd      |
| ---------------- |:-------------:| -----------:|
| ssh / main user  | vagrant       | vagrant     |
| mysql            | root          | 123         |

The vagrant user has full sudo privelleges. Please note that this is not an exhaustive list of user logins as there are password accounts to set-up for other packages (such as webmin, mongodb, postgreSQL, etc).
