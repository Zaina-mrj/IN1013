--1

CREATE VIEW samsBills AS
SELECT 
    w.first_name,
    w.surname,
    b.bill_date,
    c.cust_name,
    b.bill_total
FROM 
    bills b
JOIN 
    waiters w ON b.waiter_id = w.waiter_id
JOIN 
    customers c ON b.cust_id = c.cust_id
WHERE 
    w.first_name = 'Sam' AND w.surname = 'Pitt';


--2

SELECT 
    first_name, 
    surname, 
    bill_date, 
    cust_name, 
    bill_total
FROM 
    samsBills
WHERE 
    bill_total > 400;


--3

CREATE VIEW roomTotals AS
SELECT 
    r.room_name, 
    SUM(b.bill_total) AS total_sum
FROM 
    bills b
JOIN 
    rooms r ON b.room_id = r.room_id
GROUP BY 
    r.room_name;

--4

CREATE VIEW teamTotals AS
SELECT 
    CONCAT(w.first_name, ' ', w.surname) AS headwaiter_name,
    SUM(b.bill_total) AS total_sum
FROM 
    bills b
JOIN 
    waiters w ON b.waiter_id = w.waiter_id
GROUP BY 
    w.first_name, 
    w.surname;



