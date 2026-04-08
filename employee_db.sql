--Employee table
CREATE TABLE employees (
employee_id VARCHAR(20) PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
department VARCHAR(50) NOT NULL,
role VARCHAR(50) NOT NULL,
password VARCHAR(255) NOT NULL,
phone VARCHAR(15) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

--Login Table for ( for authentication )
CREATE TABLE login_history(
id SERIAL PRIMARY KEY,
employee_id VARCHAR(20) REFERENCES employees(employee_id),
login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ip_address VARCHAR(45)
);

INSERT INTO employees (employee_id, full_name, department, role, password, phone, email) 
VALUES 
('EMP001', 'Chris Tucker', 'IT', 'Software Developer', '2004105#', '0712345678', 'christucker@company.com'),
('EMP002', 'Lerato Baloyi', 'HR', 'HR Manager', '584#213', '0723456789', 'lbaloyi@company.com'),
('EMP003', 'Asiphe Sam', 'Marketing', 'SEM Manager', '200307#03', '0715445547', 'asiphe.sam@company.com'),
('EMP004', 'Terry Maloka', 'Finance', 'Audit Coordinator', '73541#', '0745437865', 'terry.maloka@company.com');
