# for removal leftovers from previous runs. please comment if it is a first launch
sudo systemctl disable application_jenkins
sudo systemctl stop application_jenkins
rm -f /etc/systemd/system/application_jenkins.service
sudo systemctl daemon-reload

# prepare all the env and stuff...
cd flapp
python3 -m venv venv
source venv/bin/activate
pip3 install -r /var/lib/jenkins/workspace/WebApp/flapp/requirements.txt
export FLASK_APP=/var/lib/jenkins/workspace/WebApp/flapp/application.py

# run the service
cp /var/lib/jenkins/workspace/WebApp/flapp/application_jenkins.service /etc/systemd/system/
sudo systemctl enable application_jenkins
sudo systemctl start application_jenkins

# ... and verify it
systemctl status application_jenkins > file.txt
if grep -q "running" file.txt; then
    ADDRESS=$(curl https://checkip.amazonaws.com/)
    echo "service is up and running, go to http://$ADDRESS:8081"
else
    echo "service failed to run, please see file.txt for details"
    exit 1  # fail the Jenkins job
fi