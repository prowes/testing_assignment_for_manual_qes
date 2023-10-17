# remove leftovers from previous runs
# systemctl disable application_jenkins uncomment for 2nd launch etc
# systemctl stop application_jenkins
rm -rf /var/lib/jenkins/workspace/WebApp/flapp
rm -f /etc/systemd/system/application_jenkins.service

# prepare all the env and stuff...
mkdir flapp
cd flapp
python3 -m venv venv
source venv/bin/activate
git clone https://github.com/prowes/testing_assignment_for_manual_qes.git
pip install -r /var/lib/jenkins/workspace/WebApp/flapp/testing_assignment_for_manual_qes/requirements.txt
export FLASK_APP=/var/lib/jenkins/workspace/WebApp/flapp/testing_assignment_for_manual_qes/application.py
cd testing_assignment_for_manual_qes

# run the service
cp application_jenkins.service /etc/systemd/system/
sudo systemctl start application_jenkins
sudo systemctl enable application_jenkins
