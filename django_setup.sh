python -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install Django
pip install psycopg2-binary
django-admin startproject project .