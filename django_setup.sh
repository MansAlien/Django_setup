sudo rm -r .git
python -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
nodeenv -p
npm install -g npm
django-admin startproject project .
echo .venv > .gitignore
echo .env >> .gitignore
echo django_setup.sh >> .gitignore
echo __pycache__/ >> .gitignore
echo db.sqlite3 >> .gitignore
rm -r project/settings.py
rm -r project/wsgi.py
rm -r project/urls.py
mv settings.py project/
mv wsgi.py project/
mv urls.py project/
git init
git add .
git commit -m "Initial commit"
git branch -M main

