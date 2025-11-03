from pyspark.sql import functions as F

df = spark.read.parquet("/mnt/bronze/Sales/SalesOrderHeader.parquet")

df_clean = (
    df.withColumnRenamed("OrderDate", "order_date")
      .withColumn("order_year", F.year("order_date"))
      .dropDuplicates()
)

df_clean.write.format("delta").mode("overwrite").save("/mnt/silver/Sales/SalesOrderHeader")
print("Bronze → Silver transformation complete.")