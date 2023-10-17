sudo groupadd serviceadmins
sudo usermod --append --groups serviceadmins ec2-user
sudo usermod --append --groups serviceadmins jenkins