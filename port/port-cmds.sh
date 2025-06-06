# WIN:
$ netstat -aon | findstr :8080
# TCP    0.0.0.0:8080     0.0.0.0:0     LISTENING     1234
$ taskkill /PID 1234 /F

# LINUX:
$ sudo lsof -i :8080
# COMMAND   PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
# java     5678 user   78u  IPv6 123456      0t0  TCP *:http-alt (LISTEN)
$ kill -9 5678




