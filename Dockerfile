FROM python:3-alpine

RUN pip install --index-url http://nexus:8081/repository/mypypi-all/simple --trusted-host nexus --no-cache-dir --upgrade pip
RUN pip install --index-url http://nexus:8081/repository/mypypi-all/simple --trusted-host nexus --no-cache-dir setuptools==36.5.0
RUN pip install --index-url http://nexus:8081/repository/mypypi-all/simple --trusted-host nexus --no-cache-dir 8ball
RUN pip install --index-url http://nexus:8081/repository/mypypi-all/simple --trusted-host nexus --no-cache-dir gunicorn==19.7

EXPOSE 80

ENTRYPOINT [ \
    "/usr/local/bin/gunicorn", \
    "--bind", "0.0.0.0:80", \
    "8ball.app:APP" \
]