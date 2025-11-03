CREATE OR ALTER PROCEDURE sp_CreateGoldViews
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TableName NVARCHAR(255);
    DECLARE @Sql NVARCHAR(MAX);

    DECLARE cur CURSOR FOR
    SELECT TableName FROM dbo.GoldMetadata;

    OPEN cur;
    FETCH NEXT FROM cur INTO @TableName;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @Sql = '
            CREATE OR ALTER VIEW vw_' + @TableName + ' AS
            SELECT * FROM OPENROWSET(
                BULK ''' + @TableName + ''',
                DATA_SOURCE = ''gold_datalake'',
                FORMAT = ''DELTA''
            ) AS result;';
        EXEC(@Sql);
        FETCH NEXT FROM cur INTO @TableName;
    END;

    CLOSE cur;
    DEALLOCATE cur;
END;