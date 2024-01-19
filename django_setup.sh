sudo rm -r .git
python -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
django-admin startproject project .
echo .venv > .gitignore
echo django_setup.sh >> .gitignore
rm -r project/settings.py
rm -r project/wsgi.py
rm -r project/urls.py
mv settings.py proejct/
mv wsgi.py proejct/
mv urls.py proejct/
git init
git add .
git commit -m "Initial commit"
git branch -M main

