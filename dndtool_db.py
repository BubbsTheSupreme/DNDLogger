import sqlite3
from contextlib import closing

class DbHandler:

	def __init__(self, db_name):
		self.db_name = db_name
	
	def setup_db(self):
		with sqlite3.connect(self.db_name) as conn:
			with closing(conn.cursor()) as sql:
				sql.executescript("schema.sql")
