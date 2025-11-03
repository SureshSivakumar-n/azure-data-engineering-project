# Azure Key Vault Setup

1. Go to Azure Portal → Key Vault → Secrets.
2. Create secrets:
   - **sql-username**
   - **sql-password**
   - **databricks-token**
   - **storage-key**
3. In ADF, add a linked service referencing this Key Vault.
4. Use `@Microsoft.KeyVault(SecretName=...)` in ADF linked service configurations.
5. In Databricks, access the secret:
   ```python
   token = dbutils.secrets.get("keyvault-scope", "databricks-token")