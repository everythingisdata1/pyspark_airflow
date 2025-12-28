from time import sleep

from airflow.sdk import dag, task
from pendulum import datetime


@dag(
    start_date=datetime(2025, 1, 1),
    schedule=None,
    catchup=False,
    tags=['celery']
)
def celery():
    @task
    def a():
        print('A')
        sleep(15) 

    a()  


celery()