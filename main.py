from openai import OpenAI
import os
from dotenv import load_dotenv
import sqlite3

from sql_schema import get_schema

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

#once db connection is established, put read info into var below
setupSqlScript = {}
#set up sqlitecursor. Then run this to set up table and keys sqliteCursor.executescript(setupSqlScript)

#questionStrategies
sqlOnlyRequest = "Give me a sqlite select statement that answers the quesiton. Only respond with sqlite syntax. If there's an error, don't explain it."
#test select statement before moving on
questionStrategies = {
    "zero_shot": setupSqlScript + sqlOnlyRequest,
    "single_domain_double_shot": (setupSqlScript + 
                                  "What kind of art is displayed in the Spanish Art Through the Ages exhibit? " +
                                  "SELECT DISTINCT a.artist, a.art_name, a.country\nFROM exhibit e\nJOIN art_and_exhibit ae ON e.exhibit_id = ae.exhibit_id\nJOIN art a ON ae.art_id = a.art_id\nWHERE e.exhibit_name = 'Spanish Art Through the Ages';\n " +
                                  sqlOnlyRequest)
}

questions = [
    "What kind of art is displayed in the Spanish Art Through the Ages exhibit?",
    "What museum attracts the most 35 year old women?",
    "Which museum has the most art from France?",
    "Where is the largest museum located?",
    "Which museum has the longest running exhibit?",
    "List what art is in Rodin: Sculpting the Human Form.",
    "Which museum has the most male visitors under 40?",
    "Which museum has the oldest artwork?"
    "Are there any art pieces not currently in any exhibits?"
]


#Connect to database
con = sqlite3.connect("art_museum.db")
cur = con.cursor()

sql_query = """
            SELECT name, location, MAX(size) FROM museum;
            """
res = cur.execute(sql_query)
print(res.fetchall())