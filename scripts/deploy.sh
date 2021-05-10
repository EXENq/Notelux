#!/usr/bin/env bash

mvn clean package

echo 'Copy files...'

scp -i ~/.ssh/notelux-london.pem \
    target/notelux-0.0.1-SNAPSHOT.jar \
     ssh -i ~/.ssh/notelux-london.pem ec2-user@ec2-18-132-48-162.eu-west-2.compute.amazonaws.com:/home/ec2-user/

echo 'Restart server...'

ssh -i ~/.ssh/notelux-london.pem ec2-user@ec2-18-132-48-162.eu-west-2.compute.amazonaws.com << EOF
pgrep java | xargs kill -9
nohup java -jar notelux-0.0.1-SNAPSHOT.jar > log.txt &
EOF

echo 'Bye'