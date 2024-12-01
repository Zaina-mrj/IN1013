--1
SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS num_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(b.bill_no) >= 2;

--2
SELECT r.room_name, COUNT(t.table_no) AS num_tables
FROM restRest_table t
JOIN restRoom_management r ON t.room_name = r.room_name
WHERE t.no_of_seats > 6

--3
SELECT r.room_name, SUM(b.bill_total) AS total_bills
FROM restBill b
JOIN restRest_table t ON b.table_no = t.table_no
JOIN restRoom_management r ON t.room_name = r.room_name
GROUP BY r.room_name;

--4
SELECT hw.first_name, hw.surname, SUM(b.bill_total) AS total_bills
FROM restStaff hw
JOIN restStaff w ON hw.staff_no = w.headwaiter
JOIN restBill b ON w.staff_no = b.waiter_no
GROUP BY hw.first_name, hw.surname
ORDER BY total_bills DESC;

--5
SELECT cust_name, AVG(bill_total) AS avg_spent
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;

--6
SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS num_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(b.bill_no) >= 3;