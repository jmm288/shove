#!/usr/bin/env bash
/opt/venv/app/bin/gunicorn -b 0.0.0.0:5000 shove.wsgi