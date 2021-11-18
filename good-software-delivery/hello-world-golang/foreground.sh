while [ ! -f /usr/local/bin/wait.sh ]
do
  sleep 0.2
done
wait.sh
make
pwd
ls -la
