
sql_create_table_art = """
	CREATE TABLE art (
		art_id INT,
		artist VARCHAR(100),
		art_name VARCHAR(100),
		year_created DATETIME,
		country VARCHAR(100),
		material VARCHAR(100),
		min_req_security_level INT,
		PRIMARY KEY(art_id)
	);
"""
sql_create_table_museum = """
	CREATE TABLE museum (
		museum_id INT,
		museum_name VARCHAR(100),
		location VARCHAR(100),
		date_opened DATETIME,
		size_of_museum INT,
		security_level INT,
		PRIMARY KEY(museum_id)
	);
"""

sql_create_table_visit = """
	CREATE TABLE visit (
		visit_id INT,
		time_entry DATETIME,
		time_exit DATETIME,
		visitor_name VARCHAR(100),
		visitor_age VARCHAR(100),
		visitor_gender VARCHAR(100),
		museum_id INT,
		PRIMARY KEY(visit_id)
	);
"""

sql_create_table_exhibit = """
	CREATE TABLE exhibit (
	exhibit_id INT,
	start_date DATETIME,
	end_date DATETIME,
	exhibit_name VARCHAR(100),
	max_num_pieces INT,
	size_of_exhibit INT,
	PRIMARY KEY(exhibit_id)
	);
"""

sql_create_table_museum_exhibit = """
	CREATE TABLE museum_exhibit (
		museum_id INT,
		exhibit_id INT,
		PRIMARY KEY(museum_id, exhibit_id),
		FOREIGN KEY(museum_id) REFERENCES museum(museum_id),
  		FOREIGN KEY(exhibit_id) REFERENCES exhibit(exhibit_id)
	);
"""

sql_create_table_art_exhibit = """
	CREATE TABLE art_exhibit (
		art_id INT,
		exhibit_id INT,
		PRIMARY KEY(exhibit_id, art_id),
		FOREIGN KEY(exhibit_id) REFERENCES exhibit(exhibit_id),
		FOREIGN KEY(art_id) REFERENCES art(art_id)
	);
"""

def get_schema():
	schema = f"{sql_create_table_art} {sql_create_table_museum} {sql_create_table_visit} {sql_create_table_exhibit} {sql_create_table_museum_exhibit} {sql_create_table_art_exhibit}"
	return schema