mkdir flapp
cd flapp
python3 -m venv venv
source venv/bin/activate
git clone https://github.com/prowes/testing_assignment_for_manual_qes.git
pip install -r /home/ec2-user/flapp/testing_assignment_for_manual_qes/requirements.txt
export FLASK_APP=/home/ec2-user/flapp/testing_assignment_for_manual_qes/application.py
cd testing_assignment_for_manual_qes
sudo cp application_ssh.service /etc/systemd/system/
sudo systemctl start application_ssh
sudo systemctl enable application_ssh
