/*SQL Queries that i used to get answers for questions.*/

/* 1.	Na jaké kategorii produktů máme největší obrat? A zajímalo by mě i jestli se to v jednotlivých měsících mění. */

select
    category,
    sum(quantity),
    sum(price),
    monthname(date)
from
    transactions t
    join prod p on p.product = t.product
where
    category = 'Televize'
group by
    category,
    monthname(date)
order by
    category,
    monthname(date);

/* 2.	Který den v týdnu je nejsilnější na počet objednávek? */


select
    sum(quantity),
    sum(price),
    dayname(date)
from
    transactions t
    join prod p on p.product = t.product
group by
    dayname(date);


/*
select
    transaction_id,
    count(category)
from
    transactions t
    join prod p on t.product = p.product
where
    category = 'Televize'
group by
    transaction_id;
*/

/* 3.	Která kategorie se prodává nejčastěji spolu s produkty z kategorie Televize (resp. jsou spolu v jedné objednávce)? */

SELECT
    top 1 p.category AS top_nejprodavanejsi
FROM
    prod p
    JOIN transactions t ON p.product = t.product
WHERE
    p.category = 'Televize'
    AND p.category <> 'Televize'
GROUP BY
    p.category
ORDER BY
    COUNT(DISTINCT t.transaction_id) DESC;
SELECT
    top 1 p1.category AS top_nejprodavanejsi
FROM
    prod p
    JOIN transactions t ON p.product = t.product
    JOIN transactions t1 ON t.transaction_id = t1.transaction_id
    JOIN prod p1 ON t1.product = p1.product
WHERE
    p.category = 'Televize'
    AND p1.category <> 'Televize'
GROUP BY
    p1.category
ORDER BY
    COUNT(DISTINCT t1.transaction_id) DESC;


/* 4.	Od 18. 3. 2022 jsem klukům z marketingu navýšil budget na online marketingových platformách (Google Ads, Sklik, Facebook). Dokážeš mi říct, jestli to vedlo k nějaké změně v prodeji? */

SELECT
    CASE
        WHEN DATE(date) < '2022-03-18' THEN 'Before 18.3.2022'
        ELSE 'After 18.3.2022'
    END AS Period,
    SUM(t.quantity) AS TotalSales
FROM
    transactions t
WHERE
    DATE(date) >= '2022-03-18'
group by
    period
ORDER BY
    Period;



SELECT
    category,
    SUM(quantity) AS TotalSalesAfter18thMarch,
    sum(price)
FROM
    transactions t
    join prod p on t.product = p.product
WHERE
    DATE(date) < '2022-03-18'
group by
    category;
//

