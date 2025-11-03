End-to-End Azure Data Engineering Project (Real-Time Demo)

This repository demonstrates a **complete real-time Azure Data Engineering pipeline** — from on-premise SQL extraction to Power BI visualization — using modern lakehouse architecture principles.

---

Architecture Overview

SQL Server (On-Prem)

      │
      ▼
Azure Data Factory (ADF)  — Extraction & Orchestration

      │
      ▼
Azure Data Lake Gen2 — Bronze → Silver → Gold zones (Parquet & Delta)

      │
      ▼
Azure Databricks — PySpark Transformations

      │
      ▼
Azure Synapse Analytics (Serverless SQL) — Views & Analytics Layer

      │
      ▼
Power BI — Interactive Dashboards

      │
      ▼
Azure Key Vault + AAD + IAM — Governance & Security

