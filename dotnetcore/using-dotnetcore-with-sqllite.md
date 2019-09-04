# Connection info for SqlLite

var connection = "Data source=prs.db";
services.AddDbContext<AppDbContext>(opt => opt.UseSqlite(connection));
