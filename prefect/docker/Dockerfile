FROM python:3.12-slim

ENV APP_ROOT /opt/app
RUN pip3 install --upgrade pip && pip3 install \
    prefect
ENV PREFECT_HOME "/prefect"
ENV PYTHONPATH "${PYTHONPATH}:${APP_ROOT}"
WORKDIR ${APP_ROOT}
COPY app .