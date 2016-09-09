-- SELECT SERVERPROPERTY('IsFullTextInstalled')

-- CREATE FULLTEXT CATALOG ft_ShoppingSite

--	CREATE FULLTEXT INDEX ON dbo.Product (
--		ProductName LANGUAGE 1033,
--		ProductDesc LANGUAGE 1033
--	)
--	KEY INDEX PK_Product_1
--	ON ft_ShoppingSite
--	WITH CHANGE_TRACKING AUTO

-- DECLARE @text VARCHAR
-- SET @text='hp'

SELECT * FROM dbo.Product WHERE CONTAINS(ProductName, 'fault stars')

SELECT * FROM dbo.Product WHERE FREETEXT(ProductName, 'fault stars')

SELECT * FROM FREETEXTTABLE( dbo.Product, ProductName, @text ) AS T
INNER JOIN dbo.Product P ON T.[Key] = P.[ProductId] ORDER BY T.[RANK] DESC
