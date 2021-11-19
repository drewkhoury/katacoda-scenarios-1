while [ ! -f /usr/local/bin/wait.sh ]
do
  sleep 0.2
done
wait.sh
cd java/student-tracking-application
pwd
ls -la