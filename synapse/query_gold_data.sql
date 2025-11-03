SELECT TOP 10 CustomerID, TotalOrders, TotalAmount
FROM vw_SalesSummary
ORDER BY TotalAmount DESC;