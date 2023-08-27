using System;
using System.IO;
using System.Data.SQLite;
using DNDLogger.Logging;

namespace DNDLogger.DbHandler.Sqlite;

public class SqliteDbHandler
{
	SQLiteConnection Connection;

	public SqliteDbHandler(string databaseName)
	{
		string connString = String.Format("Data Source={0}", databaseName);
		Connection = new(connString);
		Connection.Open();
	}
	
	public void DbSetup()
	{
		try
		{
			string createNewDb = File.ReadAllText("./SQL/sqlite_schema.sql");
			using (SQLiteCommand command = new(createNewDb, Connection))
			{
				command.ExecuteNonQuery();
			}
		}
		catch (Exception e)
		{
			Console.WriteLine("Error has occurred. See DNDLogger.log for more information.");
			Logger.Error(e);
			Connection.Close();
			Connection.Dispose();
		}
	}

	public void Close()
	{
		Connection.Close();
		Connection.Dispose();
	}
}