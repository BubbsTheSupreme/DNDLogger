using DNDLogger.DbHandler.Sqlite;

namespace DNDLogger;

class Program
{
    static void Main(string[] args)
    {
		Logger.Init();
        SqliteDbHandler db = new("test.db");
		db.DbSetup();
		db.Close();
    }
}
