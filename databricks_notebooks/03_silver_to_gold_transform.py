from pyspark.sql import functions as F

sales_header = spark.read.format("delta").load("/mnt/silver/Sales/SalesOrderHeader")
sales_detail = spark.read.format("delta").load("/mnt/silver/Sales/SalesOrderDetail")

gold_df = (
    sales_header.join(sales_detail, "SalesOrderID")
    .groupBy("CustomerID")
    .agg(
        F.sum("LineTotal").alias("TotalAmount"),
        F.countDistinct("SalesOrderID").alias("TotalOrders")
    )
)

gold_df.write.format("delta").mode("overwrite").save("/mnt/gold/Sales/SalesSummary")
print("Silver → Gold aggregation complete.")