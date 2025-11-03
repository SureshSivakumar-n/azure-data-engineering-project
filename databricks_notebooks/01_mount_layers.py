# Databricks mounting example
storage_account = "mystorageaccount"
key = dbutils.secrets.get("keyvault-scope", "storage-key")

layers = ["bronze", "silver", "gold"]

for layer in layers:
    dbutils.fs.mount(
        source=f"wasbs://{layer}@{storage_account}.blob.core.windows.net/",
        mount_point=f"/mnt/{layer}",
        extra_configs={f"fs.azure.account.key.{storage_account}.blob.core.windows.net": key}
    )

display(dbutils.fs.ls("/mnt/bronze"))