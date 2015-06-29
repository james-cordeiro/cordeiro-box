# Environment

The environment and initial tech stack of the **cordeiro-box** is why it is an attractive set-up to get started quickly for developers. It provides out of the box initialisation of large plethora of components and packages to start going and getting to what is important, 'The CODE'. 

Here is an overview (below) of the initialised environment. 

**Please note: The version numbers are the versions installed when first creating this github repo and initialising `vagrant up` as of 23rd June 2015. However, specific versions for packages have not been stated so when you perform your own `vagrant up` the puppet configuration initialiser may actually install new versions of the packages**.

## System Set-up

Ubuntu Trusty 14.04 LTS i836 (32 bit edition)
  - Hostname = "dev.local"
  - Default Memory = 512
  - Default CPUs = 1
  - Default IP = "192.168.56.101"
  - Forwarded Ports (Host => Guest):
      
| Host | Guest | Service
-------|-------|--------
2121   | 21    | FTP
2222   | 22    | SSH
2323   | 23    | Telnet
2525   | 25    | SMTP
6971   | 3306  | MySQL
6131   | 5432  | PostgreSQL
8080   | 80    | HTTP
4443   | 443   | HTTP(s)
4655   | 465   | SMTP(s)
10021  | 10000 | Webmin
2701   | 27017 | MongoDB
16379  | 6379  | Redis

## Installed Packages

### Web Server

- Nginx v1.8.0
- PHP v5.6
- Python v2.7
- Ruby v1.9.3
- Nodejs v0.12.5

### Data

- MySQL v5.6
  - Username: dbuser, Password: 123
- PostgreSQL v9.3
  - Username: root, Password: 123
- MongoDB v2.4.14
  - Username: vagrant, password: 123
- Redis

### Package Managers

- Composer v1.0-dev
- Bower v1.4.1
- RVM v1.26.9
- NPM v2.11.2
- GEM v2.4.5

### Engines

- SQLite v3.8.2

## Installed Modules / Libraries / Programs

- Node.js
  - Express v4.12.4
  - Mongoose v4.0.6
  - Socket.io v1.3.5
  - Forever v0.14.1
  - Mocha v2.2.5
  - Sinon v1.15.0
  - Chai v2.1.0
  - Jasmine v2.3.1
  - Colors v1.1.2
  - Gulp v3.9.0
  - Grunt v0.1.13
  - React v0.13.3
  - Yo v1.4.7
  - Yeoman v0.9.6 _(deprecated)_
  - Mongodb
  - Underscore
  - Q v1.4.1
  - Browserify v10.2.4
  - Bcrypt v0.8.3 (You also may want to install Bcrypt Linux package - not just this .js package)
  - Gulp-scss 
  - Gulp-less
  - Gulp-imagemin
  - Angular v1.4.1
  - EJS v2.3.1
  - Handlebars v3.0.3
  - Cron v1.0.9
  - CSV v0.4.5
  - XLSX v0.8.0
  - D3 v3.5.5
  - Babel v5.6.4
  - Googleapis v2.0.5
  - Phonegap v0.9.4
  - SQueL v4.0.0
  - Nodemon v1.3.7
  - Browserify v10.2.4
  - Testling
- Git Core v1.9.1
- Git Flow v1.6.1 (AVH Edition)
