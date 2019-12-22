
import multiprocessing

bind = '0.0.0.0:5000'
workers = multiprocessing.cpu_count()*2+1
errorlog = "/opt/app/log/gunicorn_error.log"
accesslog = "/opt/app/log/gunicorn_access.log"
timeout = 500