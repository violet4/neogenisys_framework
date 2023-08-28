# https://stackoverflow.com/a/1789616
# When invoking sub-makes, call $(MAKE) instead of make so that
# options will be passed on correctly.


build:
    docker build -t neogenisys .

test:
    pytest tests/ --cov=./backend/

git-hook:
    pre-commit run --all-files

run:
    cd devops/docker && docker-compose up -d

build:
    docker build ./devops/docker -t neogenisys:0.0.1

migrate:
    alembic upgrade head

kubernetes:
    kubectl apply -f devops/kubernetes/

run-backend:
    python backend/flask_app/app.py

run-frontend:
    cd frontend/react_app && npm start

build-react-native:
    cd frontend/react_native_app && react-native run-android
