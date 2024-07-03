#!/bin/bash
# 1
echo "Be careful!" > /etc/skel/readme.txt
# 2
useradd u1 -p $(openssl passwd -crypt 12345678)
# 3
groupadd g1
# 4
usermod -a -G g1 u1
# 5
id u1 >> work.log
# 6
cat /etc/group | awk -F":" '{print $1, $4}' | grep "g1" >> work.log
# 7
usermod -s /usr/bin/mc u1
# 8
useradd u2 -p $(openssl passwd -crypt 87654321)
# 9
mkdir /home/test1
cd /home/test1

for (( i=1 ; i<=6 ; i++ )); 
do
    touch file$i
done
# 10
chown -R u1:u2 /home/test1
chmod 640 -R /home/test1
chmod 550 /home/test1
# 11
mkdir /home/test2
chmod +t /home/test2
chown u1:u1 /home/test2
# 12
cp /bin/nano /home/test3/nano
chown u1:u1 /home/test3/nano
chmod u+s /home/test3/nano
# 13
mkdir test4
touch test4/secret_file
chmod a=x test4
chmod a=r test4/secret_file
