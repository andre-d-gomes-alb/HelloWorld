FROM python:3.6  
ENV PYTHONUNBUFFERED 1  
RUN mkdir /devo_adapter
ENV FLASK_APP endpoints.py
ENV FLASK_RUN_HOST 0.0.0.0
WORKDIR /devo_adapter
ADD requirements.pip ./
RUN pip3 install -r requirements.pip
ADD . .
CMD ["flask", "run"]
