component {

function Where() {
	include "/Inc/newQuery.cfm";
	local.sql = "
	SELECT INFORMATION_SCHEMA.COLUMNS.TABLE_SCHEMA
	,INFORMATION_SCHEMA.COLUMNS.TABLE_NAME
	,COUNT(*) AS Columns
	FROM INFORMATION_SCHEMA.COLUMNS
	JOIN INFORMATION_SCHEMA.TABLES
	ON INFORMATION_SCHEMA.COLUMNS.TABLE_CATALOG = INFORMATION_SCHEMA.TABLES.TABLE_CATALOG
	AND INFORMATION_SCHEMA.COLUMNS.TABLE_SCHEMA = INFORMATION_SCHEMA.TABLES.TABLE_SCHEMA
	AND INFORMATION_SCHEMA.COLUMNS.TABLE_NAME = INFORMATION_SCHEMA.TABLES.TABLE_NAME
	WHERE TABLE_TYPE='BASE TABLE'
	GROUP BY INFORMATION_SCHEMA.COLUMNS.TABLE_SCHEMA,INFORMATION_SCHEMA.COLUMNS.TABLE_NAME
	ORDER BY INFORMATION_SCHEMA.COLUMNS.TABLE_SCHEMA,INFORMATION_SCHEMA.COLUMNS.TABLE_NAME
	";
	include "/Inc/execute.cfm";
	return local.result;
}
}
