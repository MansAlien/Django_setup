sudo rm -r .git
python -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
django-admin startproject project .
git init
git add .
git commit -m "Initial commit"
git branch -M main
