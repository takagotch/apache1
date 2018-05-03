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



