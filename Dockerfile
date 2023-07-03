FROM python:3.10-slim-buster

LABEL maintainer="Rudychuk Dmytro dmytrorudychuk@gmail.com"


ARG UID=1000
ARG GID=1000
ENV UID=${UID}
ENV GID=${GID}

RUN useradd -m -u $UID docker_user
USER docker_user

WORKDIR /home/docker_user/app

ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1

COPY requirement.txt ./
RUN pip install -r requirement.txt

COPY . .

CMD ["python3", "-m", "bot.main"]
