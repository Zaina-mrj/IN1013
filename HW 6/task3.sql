--1
SELECT DISTINCT s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE b.cust_name = 'Tanya Singh';

--2
SELECT r.room_date
FROM restRoom_management r
JOIN restStaff hw ON r.headwaiter = hw.staff_no
WHERE hw.first_name = 'Charles' AND r.room_name = 'Green'
AND r.room_date BETWEEN 160201 AND 160229;

--3
SELECT s.first_name, s.surname
FROM restStaff s
JOIN restStaff hw ON s.headwaiter = hw.staff_no
WHERE hw.first_name = 'Alphonso' AND hw.surname = 'Moss';

--4
SELECT b.cust_name, b.bill_total, s.first_name AS waiter_first_name, s.surname AS waiter_surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

--5
SELECT DISTINCT s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE b.table_no IN (SELECT table_no FROM restBill WHERE bill_no IN (00014, 00017);

--6
SELECT DISTINCT s.first_name, s.surname
FROM restRoom_management r
JOIN restStaff hw ON r.headwaiter = hw.staff_no
JOIN restRest_table t ON r.room_name = t.room_name
JOIN restBill b ON t.table_no = b.table_no
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE r.room_name = 'Blue' AND r.room_date = 160312;