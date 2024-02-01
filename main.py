from openai import OpenAI
import os
from dotenv import load_dotenv

from schema import get_schema

load_dotenv("./.env")

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))
# ***model**** (aka not important) for getting the schema for the prompt:
prompt = f"""
given the following SQL schema:{get_schema()}
"""

completion = client.chat.completions.create(
    model="gpt-3.5-turbo",
    messages=[
        {
            "role": "system",
            "content": """
                Given the following schema:  , answer the
                CREATE TABLE Highschooler (
                ID int primary key ,
                name text ,
                grade int
                ) ;
                /*
                3 example rows :
                SELECT * FROM Highschooler LIMIT 3;
                ID name grade
                1510 Jordan 9
                1689 Gabriel 9
                1381 Tiffany 9 
                */
        """,
        },
        {
            "role": "user",
            "content": """
                Task Instruction
                -- Using valid SQLite , answer the following
                questions for the tables provided above .
                Demonstration
                Question : What is Kyle 's id?
                SELECT ID FROM Highschooler WHERE name = "
                Kyle ";
                Test Question
                Question : How many high schoolers are there ?
                SELECT        
    """,
        },
    ],
)

print(completion.choices[0].message)
