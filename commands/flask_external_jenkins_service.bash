# remove leftovers from previous runs
systemctl disable application_ssh
systemctl stop application_ssh
rm -rf /var/lib/jenkins/workspace/WebApp/flapp
rm -f /etc/systemd/system/application_ssh.service

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
cp application_ssh.service /etc/systemd/system/
systemctl start /etc/systemd/system/application_ssh.service
systemctl enable application_ssh
