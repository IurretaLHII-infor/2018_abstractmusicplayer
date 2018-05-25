# Abstract Music Player

Abstract Music Player is a project developed because we felt music aplications didn't recommend music which was really similar to the one you were listening to, recommending artists which were enclosed in a set genre similar to the one you were listening to. Nowadays, in a world which is ever changing, we feel that this kind of approach to recommending music is old fashioned, and something that could be improved uppon, as such, we tried to develop a project, consisting of server, web page and application which did this in a better way to what it was done before. 

This repository contains the configuration of the server, the web page, the application and the documentation of the project.

## Server

This was tested in a Debian server system, and, as such, all the commands and information apply to that system and its derivatives. The application should work in any distribution which had a web server and PHP in a version newer than 5.3.0, but it is not guaranteed.

**Dependencies**

* Apache or Nginx
* PHP 5.3.0 or higher
* MariaDB or MySQL

### Instructions

First, install all the necesary packages:

```bash
apt-get install apache2 libapache2-mod-php php php-mysql mariadb-server mariadb-client
```

MariaDB in Debian has a problem which affects login using PHP or using another user which is not root, to fix that we do the following:

```
sudo mysql -u root;
use mysql;
update user set plugin='' where User='root';
flush privileges;
exit;
```

## License

The MIT License

Copyright (C) 2018 Ander Areitio, Leire Barainka and Borja Turiel for the Abstract Music Project - All Rights Reserved  

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


