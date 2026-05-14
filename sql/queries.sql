
/*
	Produtos que geram maior prejuizo
*/
SELECT  product_id, 
		product_name, 
		SUM(sales) AS sales, 
		SUM(quantity) AS quantity, 
		SUM(profit)  profit_total
FROM superstore_table 
GROUP BY product_id, product_name
HAVING SUM(profit) < 0
ORDER BY profit_total


/* Descontos afetam o lucro?*/
SELECT 
    CASE 
        WHEN discount = 0 THEN 'Sem desconto'
        WHEN discount <= 0.2 THEN 'Baixo'
        WHEN discount <= 0.5 THEN 'Médio'
        ELSE 'Alto'
    END AS faixa_desconto,
    AVG(profit) AS lucro_medio,
    COUNT(*) AS pedidos
FROM superstore_table
GROUP BY 
    CASE 
        WHEN discount = 0 THEN 'Sem desconto'
        WHEN discount <= 0.2 THEN 'Baixo'
        WHEN discount <= 0.5 THEN 'Médio'
        ELSE 'Alto'
    END
ORDER BY lucro_medio;


/* Onde está perdendo dinheiro */
SELECT 
    category,
    [sub-category],
    SUM(profit) AS lucro_total
FROM superstore_table
GROUP BY category, [sub-category]
ORDER BY lucro_total ASC;


/* Top 10 melhores clientes */
SELECT TOP 10
    customer_name,
    SUM(sales) AS receita_total,
	SUM(quantity) AS quantidade,
    SUM(profit) AS lucro_total
FROM superstore_table
GROUP BY customer_name
ORDER BY lucro_total DESC;

/*
	Onde vendemos mais?
	Onde lucramos mais?
	Onde operamos melhor?
*/
SELECT  region,
		SUM(sales) receita_regiao,
		SUM(profit) lucro_regiao,
		SUM(profit) / ISNULL(SUM(sales), 0) AS margem_lucro,
		SUM(quantity) quantidade_vendas_regiao,
		avg(ship_time_days) media_dias_entrega 
FROM superstore_table
GROUP BY region


/* Evolução mensal de receita e lucro */
SELECT 
    order_year,
    order_month,
    SUM(sales) AS receita_total,
    SUM(profit) AS lucro_total,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 2) AS margem_lucro
FROM superstore_table
GROUP BY order_year, order_month
ORDER BY order_year, order_month;