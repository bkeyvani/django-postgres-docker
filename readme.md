# Django, Postgres, Docker

A multi-container Django and Postgres Docker Project.

## Run locally

1. Clone the repo and navigate into the cloned directory.

2. Create, and activate a `virtualenv`, e.g. using `virtualenvewrapper`.
```sh
$ mkvirtualenv venv
```

3. Install requirements
```sh
(venv) $ pip install -r requirements.txt
```

4. Create and customize a `.env/django_local.env` file, and move your Django `SECRET_KEY` into
   this file as a shell environment variable.
```sh
DJANGO_SECRET_KEY='move-your-Django-secret-to-this-file'
```

5. Source and export local environment settings.
```sh
(venv) $ source .env/django_local.env && export $(cut -d '=' -f 1 .env/django_local.env)
```

6. Run initial Django migration.
```sh
(venv) $ python manage.py migrate
```

7. Run a local server on a different port.
```sh
(venv) $ python manage.py runserver
```

8. Browse to [localhost:8000/][1] to verify that Django is running successfully from the
   containers.

## Create Super User and login to Django Admin

1. Stop the local server.

2. Create your Django super user
```sh
(venv) $ python manage.py createsuperuser
```

3. Run your local server and verify that you can login to the admin
   site by navigating to:
   **local server:** [localhost:8000/admin][1]

[1]: http://localhost:8000/
