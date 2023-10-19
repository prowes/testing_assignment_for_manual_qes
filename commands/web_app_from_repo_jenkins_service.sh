# for removal leftovers from previous runs. please comment if it is a first launch
sudo systemctl disable application_jenkins
sudo systemctl stop application_jenkins
rm -f /etc/systemd/system/application_jenkins.service
sudo systemctl daemon-reload

# prepare all the env and stuff...
cd flapp
ls
pwd
python3 -m venv venv
pip install -r /var/lib/jenkins/workspace/WebApp/flapp/testing_assignment_for_manual_qes/requirements.txt
export FLASK_APP=/var/lib/jenkins/workspace/WebApp/flapp/testing_assignment_for_manual_qes/application.py
cd testing_assignment_for_manual_qes

# run the service
cp application_jenkins.service /etc/systemd/system/
sudo systemctl enable application_jenkins
sudo systemctl start application_jenkins