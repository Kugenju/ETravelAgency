-- rely on LineStats
CREATE VIEW MONTH_PANNAL
AS
SELECT FORMAT(LineStats.StartTime, 'yyyy-MM') [month], SUM(LineStats.TotalProfit) MonthProfit
FROM LineStats
GROUP BY FORMAT(LineStats.StartTime, 'yyyy-MM');

--ORDER BY�Ӿ�����ͼ����������Ч��

--��ѯʱ���·�����
--SELECT [month], TotalProfit
--FROM MONTH_PANNAL
--ORDER BY [month] DESC;
