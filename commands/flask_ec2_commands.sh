python3 -m venv venv
source venv/bin/activate
git clone https://github.com/prowes/testing_assignment_for_manual_qes.git
pip install -r /home/ec2-user/testing_assignment_for_manual_qes/flapp/requirements.txt
export FLASK_APP=/home/ec2-user/testing_assignment_for_manual_qes/flapp/application.py
flask run