-- rely on view LineProfit

CREATE VIEW LineStats
AS 
SELECT LineProfit.LineID, LineProfit.StartTime, AVG(LineProfit.Profit) AvgProfit, COUNT(Orders.CustomerID) members, COUNT(Orders.CustomerID)*AVG(LineProfit.Profit) TotalProfit
FROM LineProfit JOIN Orders ON LineProfit.LineID = Orders.LineID
GROUP BY LineProfit.LineID,LineProfit.StartTime;