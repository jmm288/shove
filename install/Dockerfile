FROM ubuntu:18.04

ENV PROJECT_FULL_NAME App
ENV PROJECT_NAME app
ENV PROJECT_BASE /opt/app
ENV PROJECT_USER app
ENV VENV_BASE /opt/venv
ENV VENV_PROJECT_BASE ${VENV_BASE}/${PROJECT_NAME}
ENV VENV_PIP ${VENV_BASE}/${PROJECT_NAME}/bin/pip

# Update packages
RUN apt-get update && apt-get upgrade -y

# Install packages
RUN apt-get -y install software-properties-common python3 python3-pip python3-dev libmysqlclient-dev wget \
nano unzip python3-setuptools python3-venv

# Add python3.6 and update packages
RUN add-apt-repository ppa:deadsnakes/ppa && \
  apt-get update && \
  apt-get install -y python-virtualenv && \
  apt-get install -y python3.6

# Make gunicorn logging directory
RUN mkdir ${PROJECT_BASE}
RUN mkdir ${PROJECT_BASE}/log/
RUN touch ${PROJECT_BASE}/log/gunicorn_access.log
RUN touch ${PROJECT_BASE}/log/gunicorn_error.log

# Make virtual environment and project location
RUN mkdir -p ${VENV_BASE} && \
  virtualenv --python=python3.6 ${VENV_PROJECT_BASE} && \
  mkdir -p ${PROJECT_BASE}

# Add app build
RUN ls -l ${PROJECT_BASE}/
ADD . ${PROJECT_BASE}/
RUN ls -l ${PROJECT_BASE}/

# Updating virtual environment libraries
RUN ${VENV_PIP} install --upgrade pip
RUN ${VENV_PIP} install -r ${PROJECT_BASE}/install/requirements.txt

# Move run script
RUN cp $PROJECT_BASE/shove/run.sh /root/run.sh && \
    chmod 0744 /root/run.sh

# Set working dir
WORKDIR $PROJECT_BASE/shove/

ENTRYPOINT ["/root/run.sh"]