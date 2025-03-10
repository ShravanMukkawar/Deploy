FROM python:3.8.6-slim as app
WORKDIR collegepredictor
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN export FLASK_ENV=development
RUN export FLASK_APP=run.py
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "app:app"]