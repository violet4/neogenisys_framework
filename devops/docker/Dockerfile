# https://sourcery.ai/blog/python-docker/
# https://aka.ms/vscode-docker-python

FROM python:3.10-slim as base

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONFAULTHANDLER 1
# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

FROM base AS python-deps

# Install pip requirements
RUN pip install pipenv
RUN apt-get update && apt-get install -y --no-install-recommends gcc

# Install python dependencies in /.venv
COPY Pipfile .
COPY Pipfile.lock .
RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --deploy

FROM base AS runtime

# Copy virtual env from python-deps stage
COPY --from=python-deps /.venv /.venv
ENV PATH="/.venv/bin:$PATH"

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
#WORKDIR /home/appuser # necessary?
USER appuser

# Install application into container
COPY . .

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
EXPOSE 5002
ENTRYPOINT ["gunicorn", "--bind", "0.0.0.0:5002", "backend.neogenisys/flask_app/users:app"]
#CMD ["gunicorn", "--bind", "0.0.0.0:5002", "backend.neogenisys/flask_app/users:app"]
# docker run --rm name:tag arg1 arg2 - arg1 arg2 overrides CMD

