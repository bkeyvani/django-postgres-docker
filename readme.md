# Django, Postgres, Docker

A multi-container Django and Postgres Docker Project.

## Run from Docker containers

1. Create and customize `.env/postgres.env` file.
```sh
POSTGRES_DB=your-db-name
POSTGRES_USER=your-db-username
POSTGRES_PASSWORD=choose-a-strong-password
POSTGRES_HOST=db
POSTGRES_PORT=5432
```

2. Build and start the containers.
```sh
$ docker-compose up
```

3. Browse to [localhost:8000/][1] to verify that Django is running successfully from the
   containers.

## Run locally

1. If you like to be able to run Django commands from your local machine as well, create and
   customize a `.env/django_local.env` file.
```sh
DJANGO_SECRET_KEY='move-your-Django-secret-to-this-file'
POSTGRES_DB=same-as-postgres.env
POSTGRES_USER=same-as-postgres.env
POSTGRES_PASSWORD=same-as-postgres.env
POSTGRES_HOST=localhost
POSTGRES_PORT=same-as-postgres.env
```

2. Source and export local environment settings.
```sh
$ source .env/django_local.env && export $(cut -d '=' -f 1 .env/django_local.env)
```

3. Create, Activate a `virtualenv`, e.g. using `virtualenvewrapper`.
```sh
$ mkvirtualenv venv
```

4. Install requirements
```sh
(venv) $ pip install -r requirements.txt
```

5. Run initial Django migration.
```sh
(venv) $ python manage.py migrate
```

6. Run a local server on a different port.
```sh
(venv) $ python manage.py runserver 8080
```

## Create Super User and login to Django Admin

1. Stop the local server and the docker containers.

2. Create your Django super user
```sh
(venv) $ python manage.py createsuperuser
```

3. Run your local server and/or docker containers and verify that you can login to the admin
   site by navigating to:
   **local server:** [localhost:8080/admin][2]
   **docker server:** [localhost:8000/admin][3]

[1]: http://localhost:8000/
[2]: http://localhost:8080/admin
[3]: http://localhost:8000/admin
