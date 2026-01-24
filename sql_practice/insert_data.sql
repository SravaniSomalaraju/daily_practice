USE StudentDB;

INSERT INTO Students(first_name, last_name, gender, dob, city)
VALUES 
	('Anu', 'Reddy', 'Female', '2002-05-10', 'Bangalore'),
	('Rahul', 'Sharma', 'Male', '2001-08-15', 'Delhi'),
	('Sita', 'Patel', 'Female', '2003-02-20', 'Mumbai'),
	('Arjun', 'Kumar', 'Male', '2002-11-05', 'Chennai'),
	('Meena', 'Iyer', 'Female', '2001-04-18', 'Hyderabad'),
	('Kiran', 'Verma', 'Male', '2000-09-12', 'Pune'),
	('Priya', 'Singh', 'Female', '2002-01-25', 'Jaipur'),
	('Rohit', 'Gupta', 'Male', '2003-06-30', 'Delhi'),
	('Neha', 'Malhotra', 'Female', '2001-12-14', 'Chandigarh'),
	('Amit', 'Joshi', 'Male', '2000-03-08', 'Indore'),
	('Pooja', 'Nair', 'Female', '2002-07-19', 'Kochi'),
	('Vikram', 'Shetty', 'Male', '2001-10-22', 'Mangalore'),
	('Sneha', 'Kulkarni', 'Female', '2003-04-02', 'Nagpur'),
	('Manoj', 'Yadav', 'Male', '2000-08-27', 'Lucknow'),
	('Divya', 'Rao', 'Female', '2002-09-16', 'Mysore');


INSERT INTO Courses (course_name, c_fees)
VALUES
	('SQL Basics', 3000),
	('Python for Data', 5000),
	('Web Development', 7000),
	('Data Science', 10000),
	('Machine Learning', 12000),
	('Cloud Computing', 9000),
	('Cyber Security', 8500),
	('DevOps', 9500),
	('Mobile App Development', 8000),
	('AI Fundamentals', 11000),
	('Big Data Analytics', 10500),
	('Power BI', 4000),
	('Tableau', 4500),
	('Software Testing', 6000),
	('Linux Administration', 5500);
	

INSERT INTO Enrollments (s_id, c_id, enroll_date)
VALUES
	(1, 101, '2024-01-10'),
	(1, 102, '2024-01-15'),
	(2, 101, '2024-02-01'),
	(3, 103, '2024-02-05'),
	(4, 104, '2024-03-10'),
	(5, 102, '2024-03-15'),
	(6, 105, '2024-04-01'),
	(7, 106, '2024-04-05'),
	(8, 107, '2024-04-10'),
	(9, 108, '2024-04-15'),
	(10, 109, '2024-05-01'),
	(11, 110, '2024-05-05'),
	(12, 111, '2024-05-10'),
	(13, 112, '2024-05-15'),
	(14, 113, '2024-05-20'),
	(15, 114, '2024-05-25'),
	(2, 115, '2024-06-01'),
	(3, 101, '2024-06-05'),
	(5, 104, '2024-06-10');
	