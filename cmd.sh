chmod o+x /home /home/bob
chmod o+rx /home/bob/public_html

find /home/bob/public_html -type f | xargs chmod 644


mysqladmin create apache_log
mysql apache_log < access_log.sql
mysql apache_log
grant insert,create on apaceh_log.* to webserver@localhost identified by 'wwwpw';

//
cd ServerRoot
mv logs/access_log logs/access_log.old
bin/apachectl graceful
cd logs
../bin/split-logfile < access_log.old

//
man -M ServerRoot/man/logresolve.8

//
man -M ServerRoot/man rotatelogs.8

/path/to/apache/bin/apxs -cia module.c

cd mod dav-1.0.3-1.3.6
./configure --with-apxs=/usr/local/apache/bin/apxs
make 
make install

cd /usr/local/apache
mkdir var
chgrp nobody var
chmod g+w var

cd /usr/local/apache
mkdir htdocs/dav-test
chgrp nobody htdocs/dav-test
chmod g+w htdocs/dav-test

cd /tmp
echo "txt" > dav-test.txt
cadaver
open http://localhost/dav-test
put dav-test.txt
propset dav-test.txt MyProp 1023
propget dav-test.txt MyProp
propdel dav-test.txt MyProp
close
exit
rm dav-test.txt


cd mod_dav-1.0.3-dev
copy mod_dav.dll C:\Apache\modules
cd \Apache

mkdir var
mkdir htdocs\dav-test

perl Makefile.PL \
	  USE APKS=1
	  WITH_APXS=/usr/local/apache/bin/apxs \
	  EVERTHING=1 \
	  PERL_USELARGEFILES=0
make
make install

perl Makefile.PL MP_APXS=/usr/local/apache2/bin/apxs

cd ServerRoot
mkdir lib lib/perl lib/perl/Apache

cd php-5.2.3
./configure \
	--with-apxs2=/usr/local/apache/bin/apxs
make
make install

copy php.ini-dist %SYSTEMROOT%\php.ini
copy php4ts.dll %SYSTEMROOT%

cd mod_ssl-2.8.14-1.3.27
./configure \
	--with-apache=../apache_1.3.27 \
	--with-ssl=SYSTEM \
	--perfix=/usr/local/apache
cd ../apache_1.3.27
make
make certificate


cd /usr/local/build
tar xzf /tmp/modsecurity-apache_2.1.1.tar.gz

cd /usr/local/build/modsecurity-apache_2.1.1/apache2
make top_dir=/usr/local/apache2
make top_dir=/usr/local/apache2 install

cd /usr/local/apache2/conf
mkdir mod_security
cd mod_security
tar xzf /tmp/modsecurity-core-rules_2.1-1.4.tar.gz

perl -MCPAN -e shell
install Apache::AuthExpire

htpasswd -c user.pass waldo
htpasswd user.pass ralph
htpasswd -b user.pass ralph mydogspot


htpasswd -D user.pass waldo
egrep -v '^waldo:' user.pass >!user.pass


htdigest -c "By invitation only" rbowen
htdigest "By invitation only" krietz

//
CFLAGS="$CFLAGS -DSECURITY_HOLE_PASS_AHTORIZATION"

//
PerlLongHandler Apache::BruteWatch
PerlSetVar BruteDatabase DBI:mysql:brutelog
PerlSetVar BruteDataUser username
PerlSetVar BruteDataPassword password

PerlSetVar BruteMaxTries 5
PerlSetVar BruteMaxTime 120
PerlSetVar BruteNotify rbowen@example.com

//Digetst Basic

//URL

//WebDAV

<Directory "/www/htdocs/dav-test">
  Order Allow,Deny
  Deny from all
  AuthDigestFile "/www/acl/.htpasswd-dav-test"
  #AuthDigestProvider file
  # AuthUserFile "/www/acl/.htpasswd-dav-test"
  AuthDigestDomain "/dav-test/"
  AuthName "DAV access"
  Require valid-user
  Satisfy Any
</Directory>

//WebDAV
User dav
Group dav

//URL proxy
ProxyBlock .rm .ra .mp3

<Directory proxy:http://other-host.org/path>
  Order Allow,Deny
  Deny from all
  Satisfy All
</Directory>

<Directory proxy:*>
  RewriteEngine On
  RewriteRule "\.(rm|ra)$" "-" [F,NC]
  RewriteRule "^[a-z]+;//[-.a-z0-9]*\.mil($|/)" "-" [F,NC]
</Directory>


ProxyBlock .mil

//
RewriteEngine On
RewriteRule "\.(dll|zip|exe)$" protect.php [NC]
RewriteCond %{REMOTE_ADDR} "|^servers.ip"
RewriteRule "\.cgi$" protect.php [NC]

find / -user nobody
find / -group nobody

./configure --disable-module-all --enable-module=dir \
	--enable-module=mime --enable=log_config \

./configure --disable-access \
	--disable-auth --disable-charset-lite \
	--disable-include --disable-log-config --disable-env --disable-setenvif \
	--disable-mime --disable-status --disable-autoindex --disable-asis \
	--disable-cgid --disable-cig --disable-negotiation --disable-dir \
	--disable-imap --disable-actions --disable-alias --disable-userdir

//
openssl genrsa -out server.key 1024
openssl req -new -key server.key -out server.csr
cp server.key server.key.org
openssl rsa -in server.key.org -out server.key
openssl x509 -req -days 365 -in server.csr -signkey server.key server.crt

SSLCertificateFile "/www/conf/server.crt"
SSL CertificateKeyFile "/www/conf/server.key"

EX
CO
Example City
Institude of Examples
Demonstration Services
www.example.com
big-cheese@example.com

CA.pl -newca
CA.pl -newreq
CA.pl -signreq
CA.pl -pkcs12

openssl x509 -in demoCA/cacert.pen -out cacert.crt -outform DER


chmod a+x /usr/local/apache/cgi-bin/example.cgi
which perl
perl -pl.bak -le 's/\r$//;' example.cgi

