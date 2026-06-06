
# DAY 1 TASK 5
# IMPORT THE CSV FILES TO THE DATABASE


# import all project libraries


from sqlalchemy import text,create_engine,String, CHAR, Numeric, DateTime, func

import psycopg

import os

from dotenv import load_dotenv

import pandas as pd

import urllib.parse

from pathlib import Path

#==============================================

# load database connection details from .env file

load_dotenv()

class config:
    db_user = os.getenv("DB_USER")
    db_password = os.getenv("DB_PASSWORD")
    db_host = os.getenv("DB_HOST")
    db_port = os.getenv("DB_PORT")
    db_name = os.getenv("DB_NAME")

    @classmethod
    def connection_url(self):
        return f"postgresql+psycopg://{self.db_user}:{self.db_password}@{self.db_host}:{self.db_port}/{self.db_name}"
    

# create postgresql connection engine

engine = create_engine(config.connection_url())


# define raw datasets location path

folder_path = Path(r"datasets\raw_datasets")

# load all csv file in raw_dataset dir to the postgresql database using a for loop


for file in folder_path.glob("*.csv"):
    try:
        if file.stat().st_size == 0:
            print (f"skiped {file.name} it is empty")
            continue
        file_name = file.stem.lower()

        df = pd.read_csv(file)

        df.to_sql(name = file_name,
                  con = engine,
                  index=False,
                  if_exists="replace",
                  schema="challenge_50")
        print(f"{file.name} loaded")
    except Exception as error:
        print(f"failed to load {file.name} : {error}")
print("Import process completed")


