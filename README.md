# Index
- [Abstract Music Player](#abstract-music-player)
  * [English](#english)
    + [Server](#server)
      - [Instructions](#instructions)
    + [Aplication](#aplication)
      - [Video](#video)
      - [Images](#images)
  * [Euskera](#euskera)
    + [Zerbitzaria](#zerbitzaria)
      - [Argibideak](#argibideak)
    + [Aplikazioa](#aplikazioa)
      - [Bideoak](#bideoak)
      - [Irudiak](#irudiak)
- [License](#license)
- [Original Work](#original-work)

<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>


# Abstract Music Player
## English
Abstract Music Player is a project developed because we felt music aplications didn't recommend music which was really similar to the one you were listening to, recommending artists which were enclosed in a set genre similar to the one you were listening to. Nowadays, in a world which is ever changing, we feel that this kind of approach to recommending music is old fashioned, and something that could be improved uppon, as such, we tried to develop a project, consisting of server, web page and application which did this in a better way to what it was done before. 

This repository contains the configuration of the server, the web page, the application and the documentation of the project.

### Server

This was tested in a Debian server system, and, as such, all the commands and information apply to that system and its derivatives. The application should work in any distribution which had a web server and PHP in a version newer than 5.3.0, but it is not guaranteed.

**Dependencies**

* Apache or Nginx
* PHP 5.3.0 or higher
* MariaDB or MySQL

#### Instructions

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

After this, we clone the project, and place the files of abstract-web in the corresponding place

```bash
cd /var/www/html
git clone https://github.com/IurretaLHII-infor/2018_abstractmusicplayer.git
```

Once the web page is in our server, we have to move the MyDB.php file outside of the public access

```bash
mv /var/www/html/MyDB.php ..
```

Once all the necesary packages and files to run the web are installed, we need to install a library to parse JWT. For that, we will use [php-jwt](https://github.com/firebase/php-jwt), to install it, first we need to install composer

```bash
apt-get install composer
```

We then move to the root of the web page, and install [php-jwt](https://github.com/firebase/php-jwt) using composer

```bash
cd /var/www
composer require firebase/php-jwt 
composer install
```

Once all of this is done, the API should have everything necesary to run, for further configuration, go to abstract-doc inside abstract-server, where you can find our apache configuration

### Aplication

All the code of the aplication is hosted in this repository, and can be viewed, revised and edited by anyone, bare in mind that the code is an early proof of concept. Here are some screenshots and videos of the aplication

#### Video

Click the photo to go to the video

[![Click here to go to the video](https://img.youtube.com/vi/VsHyZxDR2iM/0.jpg)](https://www.youtube.com/watch?v=VsHyZxDR2iM)

#### Images

Register

</br><img src="https://gitlab.com/abstractmusic/AbstractMusicPlayer/blob/master/media/register.jpeg" width="500">

Login

</br><img src="https://gitlab.com/abstractmusic/AbstractMusicPlayer/blob/master/media/login.jpeg" width="500">

Menu

</br><img src="https://gitlab.com/abstractmusic/AbstractMusicPlayer/blob/master/media/menu.jpeg" width="500">

Player

</br><img src="https://gitlab.com/abstractmusic/AbstractMusicPlayer/blob/master/media/player.jpeg" width="500">

## Euskera

Abstract Music Player proiektua hasi genuen uste genuelako merkatuan dauden musika aplikazioek ez zutela lan on bat egiten musika gomendatzeko garaian, normalean entzuten ari zaren antzerako musika egiten duten artisten gomendioa egiten dute. Gaur egun, momenturo aldatzen den mundu honetan, uste genuen musika gomendatzeko modu hau oso zaharkitua dagoela, eta modu hobe batean egin ahal zela. Hau dela eta, proiektu hau sortzen hasi ginen, zerbitzari, web orri eta aplikazioa batera batzen zituena, musika modu hobeago batean gomendatzen saiatzen.

Repositorio honek zerbitzariaren konfigurazioa, web orria, aplikazioa eta dokumentazioa dauka barruan

### Zerbitzaria

Hemen dagoen guztia Debian server sistema batean frogatu zen, beraz, hemen dauden komando guztiak Debian sistema eta bere deribatuei dagokie. Aplikazioak beste distribuzioetan lan egin beharko luke, web zerbitzari bat eta PHP 5.3.0 bertsioa edo berriagoa badute, baina ez dugunez frogatu ezin dugu bermetu

**Dependentziak**

* Apache edo Nginx
* PHP 5.3.0 edo berriagoa
* MariaDB edo MySQL

#### Argibideak

Hasteko, beharrezko paketeak instalatu 

```bash
apt-get install apache2 libapache2-mod-php php php-mysql mariadb-server mariadb-client
```

MariaDB-k Debian-en arazo bat du, eta ez du baimentzen login-a root ez den erabiltzaileari, PHP-rekin arazoak emanik. Hau konpontzeko, hurrengoa egingo dugu

```
sudo mysql -u root;
use mysql;
update user set plugin='' where User='root';
flush privileges;
exit;
```

Hau egin ondoren, proiektua kopiatuko dugu, eta abstract-web karpetan dauden fitxategiak bere tokian kokatuko ditugu

```bash
cd /var/www/html
git clone https://github.com/IurretaLHII-infor/2018_abstractmusicplayer.git
```

Behin hau egin dugula, MyDB.php fitxategia erabilera publikotik aterako dugu

```bash
mv /var/www/html/MyDB.php ..
```

Behin web orria martxan jartzeko fitxategiak instalatuta daudela, JWT-a partseatzeko liburutegi bat instalatuko dugu. Horretarako, guk [php-jwt](https://github.com/firebase/php-jwt) erabiliko dugu. Hau instalatu ahal izateko, lehenik eta behin composer instalatu behar dugu

```bash
apt-get install composer
```

Ondoren, web orriaren errora mugituko gara, eta [php-jwt](https://github.com/firebase/php-jwt) instalatuko dugu composer erabiliz

```bash
cd /var/www
composer require firebase/php-jwt 
composer install
```

Guzti hau egin ondoren, API-ak behar duen guztia izan beharko luke martxan jartzeko, konfigurazio gehiagorako, joan abstract-web barruan dagoen abstract-doc karpetara, han dago, adibidez, apacheren konfigurazioa

### Aplikazioa

Aplikazioaren kode guztia repositorio honetan dago, eta edozeinek irakurri, berrikusi eta editatu dezake. Kontutan izan, kode hau oso berde dagoen bertsio batena dela. Hemen daude hainbat irudi eta bideo aplikazioa ikus dezazuen

#### Bideoak

Klikatu irudian bideoa ikusteko

[![Click here to go to the video](https://img.youtube.com/vi/VsHyZxDR2iM/0.jpg)](https://www.youtube.com/watch?v=VsHyZxDR2iM)

#### Irudiak

Erregistroa

</br><img src="https://gitlab.com/abstractmusic/AbstractMusicPlayer/blob/master/media/register.jpeg" width="500">

Login-a

</br><img src="https://gitlab.com/abstractmusic/AbstractMusicPlayer/blob/master/media/login.jpeg" width="500">

Menua

</br><img src="https://gitlab.com/abstractmusic/AbstractMusicPlayer/blob/master/media/menu.jpeg" width="500">

Erreproduktorea

</br><img src="https://gitlab.com/abstractmusic/AbstractMusicPlayer/blob/master/media/player.jpeg" width="500">


# License

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

# Original Work

This project has been developed by Ander Areitio, Leire Barainka and Borja Turiel in 2018.

This is the official home page for the project

