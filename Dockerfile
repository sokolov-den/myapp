FROM python:3.10.12

ENV PYTHONUNBUFFERED 1

WORKDIR /myapp
ADD myapp /myapp
ADD requirements.txt /myapp
ADD docker-entrypoint.sh /myapp
RUN pip install --upgrade pip
RUN pip install -r /myapp/requirements.txt

ADD myapp /myapp
RUN useradd -m -r user && chown user /myapp
RUN ["chmod", "+x", "/myapp/docker-entrypoint.sh"]
USER user

ENTRYPOINT ./docker-entrypoint.sh
