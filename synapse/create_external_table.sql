CREATE EXTERNAL DATA SOURCE gold_datalake
WITH (
    LOCATION = 'abfss://gold@mydatalake.dfs.core.windows.net/'
);

CREATE EXTERNAL FILE FORMAT delta_format
WITH (FORMAT_TYPE = DELTA);

CREATE EXTERNAL TABLE gold_sales_summary
WITH (
    LOCATION = 'SalesSummary',
    DATA_SOURCE = gold_datalake,
    FILE_FORMAT = delta_format
)
AS SELECT * FROM OPENROWSET(
    BULK 'SalesSummary',
    DATA_SOURCE = 'gold_datalake',
    FORMAT = 'DELTA'
) AS result;