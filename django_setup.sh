sudo rm -r .git
python -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
django-admin startproject project .
python manage.py startapp accounts
echo .venv > .gitignore
echo django_setup.sh >> .gitignore
git init
git add .
git commit -m "Initial commit"
git branch -M main

