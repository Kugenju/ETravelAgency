-- rely on LineStats
CREATE VIEW MONTH_PANNAL
AS
SELECT FORMAT(LineStats.StartTime, 'yyyy-MM') [month], SUM(LineStats.TotalProfit) MonthProfit
FROM LineStats
GROUP BY FORMAT(LineStats.StartTime, 'yyyy-MM');

--ORDER BY子句在视图定义中是无效的

--查询时按月份排序：
--SELECT [month], TotalProfit
--FROM MONTH_PANNAL
--ORDER BY [month] DESC;
