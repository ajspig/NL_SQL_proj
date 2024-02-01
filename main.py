from openai import OpenAI
import os
from dotenv import load_dotenv
import sqlite3

from schema import get_schema

load_dotenv("./.env")

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))
# ***model**** (aka not important) for getting the schema for the prompt:

#questionStrategies
sqlOnlyRequest = "Give me a sqlite select statement that answers the quesiton. Only respond with sqlite syntax. If there's an error, don't explain it."
#test select statement before moving on
questionStrategies = {
    "zero_shot": {get_schema()} + sqlOnlyRequest,
    "single_domain_double_shot": ({get_schema()} + 
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
for questionStrategy in questionStrategies:
    questionResults = []
    print(questions[0])
    completion = client.chat.completions.create(
        model="gpt-3.5-turbo",
        messages=[
            {
                "role": "system",
                "content": "{questionStrategy}",
            },
        ],
    )

print(completion.choices[0].message)



#Connect to database
con = sqlite3.connect("art_museum.db")
cur = con.cursor()

sql_query = """
            SELECT name, location, MAX(size) FROM museum;
            """
res = cur.execute(sql_query)
print(res.fetchall())



cur.close()
con.close()


