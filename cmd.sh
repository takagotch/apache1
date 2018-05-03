chmod o+x /home /home/bob
chmod o+rx /home/bob/public_html

find /home/bob/public_html -type f | xargs chmod 644


