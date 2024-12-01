--1
SELECT b.cust_name
FROM restBill b
JOIN restStaff w ON b.waiter_no = w.staff_no
JOIN restStaff hw ON w.headwaiter = hw.staff_no
WHERE hw.first_name = 'Charles' AND b.bill_total > 450.00;

--2
SELECT hw.first_name, hw.surname
FROM restBill b
JOIN restStaff w ON b.waiter_no = w.staff_no
JOIN restStaff hw ON w.headwaiter = hw.staff_no
WHERE b.cust_name = 'Nerida Smith' AND b.bill_date = 160111;

--3
SELECT cust_name
FROM restBill
WHERE bill_total = (SELECT MIN(bill_total) FROM restBill);

--4
SELECT s.first_name, s.surname
FROM restStaff s
LEFT JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.bill_no IS NULL;

--5
SELECT b.cust_name, hw.first_name AS headwaiter_first_name, hw.surname AS headwaiter_surname, rt.room_name
FROM restBill b
JOIN restRest_table t ON b.table_no = t.table_no
JOIN restRoom_management rt ON t.room_name = rt.room_name
JOIN restStaff w ON b.waiter_no = w.staff_no
JOIN restStaff hw ON w.headwaiter = hw.staff_no
WHERE b.bill_total = (SELECT MAX(bill_total) FROM restBill);