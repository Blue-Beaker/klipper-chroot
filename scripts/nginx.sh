#! /bin/bash
case $1 in
"start")
sudo /usr/sbin/nginx -t -q -g 'daemon on; master_process on;'
sudo /usr/sbin/nginx -g 'daemon on; master_process on;'
;;
"stop")
sudo /sbin/start-stop-daemon --quiet --stop --retry QUIT/5 --pidfile /run/nginx.pid
;;
"reload")
sudo /usr/sbin/nginx -g 'daemon on; master_process on;' -s reload
;;
*)
echo "Usage: nginx.sh start|stop|reload"
esac
