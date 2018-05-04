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



