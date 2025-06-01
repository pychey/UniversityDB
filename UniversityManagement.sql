-- =====================================================
-- 3. USER AND ROLE MANAGEMENT SYSTEM
-- =====================================================

-- =============================
-- 1. Create Users 
-- =============================
CREATE USER 'john'@'localhost' IDENTIFIED BY 'Admin_pass_2024!';
CREATE USER 'sophia'@'localhost' IDENTIFIED BY 'Faculty_pass_2024!';
CREATE USER 'emma'@'localhost' IDENTIFIED BY 'Student_pass_2024!';
CREATE USER 'michael'@'localhost' IDENTIFIED BY 'Staff_pass_2024!';
CREATE USER 'olivia'@'localhost' IDENTIFIED BY 'Library_pass_2024!';
CREATE USER 'liam'@'localhost' IDENTIFIED BY 'Finance_pass_2024!';
CREATE USER 'noah'@'localhost' IDENTIFIED BY 'Readonly_pass_2024!';

-- =============================
-- 2. Create Roles
-- =============================
CREATE ROLE 'admin_role';
CREATE ROLE 'faculty_role';
CREATE ROLE 'student_role';
CREATE ROLE 'staff_role';
CREATE ROLE 'librarian_role';
CREATE ROLE 'financial_role';
CREATE ROLE 'readonly_role';

-- =============================
-- 3. Grant Privileges to Roles
-- =============================

-- Admin Role (Full Access)
GRANT ALL PRIVILEGES ON UniversityDB.* TO 'admin_role';
GRANT CREATE USER ON *.* TO 'admin_role';
GRANT GRANT OPTION ON UniversityDB.* TO 'admin_role';

-- Faculty Role
GRANT SELECT ON UniversityDB.Students TO 'faculty_role';
GRANT SELECT ON UniversityDB.Courses TO 'faculty_role';
GRANT SELECT, INSERT, UPDATE ON UniversityDB.Enrollments TO 'faculty_role';
GRANT SELECT ON UniversityDB.Departments TO 'faculty_role';
GRANT SELECT ON UniversityDB.Faculty TO 'faculty_role';
GRANT SELECT ON UniversityDB.Library TO 'faculty_role';

-- Student Role
GRANT SELECT ON UniversityDB.Courses TO 'student_role';
GRANT SELECT ON UniversityDB.Faculty TO 'student_role';
GRANT SELECT ON UniversityDB.Departments TO 'student_role';
GRANT SELECT ON UniversityDB.Library TO 'student_role';
GRANT SELECT ON UniversityDB.Students TO 'student_role';
GRANT SELECT ON UniversityDB.Enrollments TO 'student_role';
GRANT SELECT ON UniversityDB.Financial_Records TO 'student_role';

-- Staff Role
GRANT SELECT, INSERT, UPDATE ON UniversityDB.Students TO 'staff_role';
GRANT SELECT, INSERT, UPDATE ON UniversityDB.Faculty TO 'staff_role';
GRANT SELECT, INSERT, UPDATE ON UniversityDB.Courses TO 'staff_role';
GRANT SELECT, INSERT, UPDATE ON UniversityDB.Departments TO 'staff_role';
GRANT SELECT ON UniversityDB.Enrollments TO 'staff_role';
GRANT SELECT ON UniversityDB.Financial_Records TO 'staff_role';

-- Librarian Role
GRANT SELECT, INSERT, UPDATE, DELETE ON UniversityDB.Library TO 'librarian_role';
GRANT SELECT ON UniversityDB.Students TO 'librarian_role';
GRANT SELECT ON UniversityDB.Faculty TO 'librarian_role';

-- Financial Role
GRANT SELECT, INSERT, UPDATE ON UniversityDB.Financial_Records TO 'financial_role';
GRANT SELECT ON UniversityDB.Students TO 'financial_role';
GRANT SELECT ON UniversityDB.Enrollments TO 'financial_role';

-- Read-only Role
GRANT SELECT ON UniversityDB.* TO 'readonly_role';

-- =============================
-- 4. Assign Roles to Users
-- =============================
GRANT 'admin_role' TO 'john'@'localhost';
GRANT 'faculty_role' TO 'sophia'@'localhost';
GRANT 'student_role' TO 'emma'@'localhost';
GRANT 'staff_role' TO 'michael'@'localhost';
GRANT 'librarian_role' TO 'olivia'@'localhost';
GRANT 'financial_role' TO 'liam'@'localhost';
GRANT 'readonly_role' TO 'noah'@'localhost';


