//Here is my SQL code that I used to manipulate data and gain insights.

select
    s.site,
    sum(weight)
from
    simple s
    left join distance d on s.customer = d.customer
    and s.site = d.site
group by
    s.site
order by
    s.site;
//
    
select
    customer,
    count(customer) as number_of_trips
from
    simple
group by
    customer
order by
    customer;
//

    
select
    *
from
    distance d
    left join simple s on s.customer = d.customer
    and s.site = d.site
order by
    d.customer;
//

    
SELECT
    Customer,
    MIN(Site) AS CustomerSite,
    Distance
FROM
    distance
GROUP BY
    Customer;
//

    
WITH RankedData AS (
        SELECT
            Customer,
            Site,
            Distance,
            RANK() OVER (
                PARTITION BY Customer
                ORDER BY
                    Distance
            ) AS rnk
        FROM
            distance
    )
SELECT
    Customer,
    Site,
    Distance
FROM
    RankedData
WHERE
    rnk = 1
order by
    customer;
//

    
select
    s.site,
    count(transport),
    sum(distance)
from
    simple s
    join distance d on s.customer = d.customer
    and s.site = d.site
group by
    s.site
order by
    s.site;
//

    
select
    s.site,
    sum(weight)
from
    simple s
    join rank d on s.customer = d.customer
group by
    s.site
order by
    s.site;
//

    
select
    s.site,
    s.customer,
    r.mindist,
    count(transport),
    sum(mindist)
from
    simple s
    join rank r on s.customer = r.customer
group by
    s.customer,
    s.site,
    r.mindist
order by
    s.customer,
    s.site;
//


select
    date,
    transport,
    s.customer,
    weight,
    r.site,
    r.mindist
from
    simple s
    join rank r on s.customer = r.customer
order by
    customer;
//

    
select
    r.site,
    sum(weight)
from
    simple s
    join rank r on s.customer = r.customer
group by
    r.site
order by
    r.site;
//
