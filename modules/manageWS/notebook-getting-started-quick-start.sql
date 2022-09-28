-- Databricks notebook source
-- MAGIC %python
-- MAGIC diamonds = (spark.read
-- MAGIC   .format("csv")
-- MAGIC   .option("header", "true")
-- MAGIC   .option("inferSchema", "true")
-- MAGIC   .load("/databricks-datasets/Rdatasets/data-001/csv/ggplot2/diamonds.csv")
-- MAGIC )
-- MAGIC 
-- MAGIC diamonds.write.format("delta").save("/mnt/delta/diamonds")

-- COMMAND ----------

DROP TABLE IF EXISTS diamonds;

CREATE TABLE diamonds USING DELTA LOCATION '/mnt/delta/diamonds/'

-- COMMAND ----------

SELECT color, avg(price) AS price FROM diamonds GROUP BY color ORDER BY COLOR