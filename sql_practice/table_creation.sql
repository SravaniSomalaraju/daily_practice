USE StudentDB;

CREATE TABLE Students(
	s_id INT PRIMARY KEY IDENTITY(1, 1),
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR(15),
	dob DATE,
	city VARCHAR(50)
);


CREATE TABLE Courses(
	c_id INT PRIMARY KEY IDENTITY(100, 1),
	course_name VARCHAR(50),
	c_fees INT
);

	
CREATE TABLE Enrollments(
	enroll_id INT PRIMARY KEY IDENTITY (1, 1),
	s_id INT,
	c_id INT,
	enroll_date DATE


	FOREIGN KEY(s_id) REFERENCES Students(s_id),
	FOREIGN KEY(c_id) REFERENCES Courses(c_id)
);
