-- =====================================================
-- POSTGRESQL USER AND ROLE MANAGEMENT SYSTEM
-- University Database Implementation
-- =====================================================

-- =============================
-- 1. Create Group Roles 
-- =============================
CREATE ROLE admin_role;
CREATE ROLE faculty_role;
CREATE ROLE student_role;
CREATE ROLE staff_role;
CREATE ROLE librarian_role;
CREATE ROLE financial_role;
CREATE ROLE reporter_role;

-- =============================
-- 2. Create Login Roles 
-- =============================
CREATE ROLE john WITH LOGIN PASSWORD 'Admin_pass_2024!';
CREATE ROLE sophia WITH LOGIN PASSWORD 'Faculty_pass_2024!';
CREATE ROLE emma WITH LOGIN PASSWORD 'Student_pass_2024!';
CREATE ROLE michael WITH LOGIN PASSWORD 'Staff_pass_2024!';
CREATE ROLE olivia WITH LOGIN PASSWORD 'Library_pass_2024!';
CREATE ROLE liam WITH LOGIN PASSWORD 'Finance_pass_2024!';
CREATE ROLE noah WITH LOGIN PASSWORD 'Reporter_pass_2024!';

-- =============================
-- 3. Grant Privileges to Group Roles
-- =============================

-- Admin Role (Full Access)
GRANT ALL PRIVILEGES ON DATABASE universitydb TO admin_role;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin_role;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO admin_role;
GRANT USAGE, CREATE ON SCHEMA public TO admin_role;

-- Faculty Role
GRANT USAGE ON SCHEMA public TO faculty_role;
GRANT SELECT ON students, courses, departments, faculty, library TO faculty_role;
GRANT SELECT, INSERT, UPDATE ON enrollments TO faculty_role;

-- Student Role
GRANT USAGE ON SCHEMA public TO student_role;
GRANT SELECT ON courses, faculty, departments, library, students, enrollments, financial_records TO student_role;

-- Staff Role
GRANT USAGE ON SCHEMA public TO staff_role;
GRANT SELECT, INSERT, UPDATE ON students, faculty, courses, departments TO staff_role;
GRANT SELECT ON enrollments, financial_records TO staff_role;

-- Librarian Role
GRANT USAGE ON SCHEMA public TO librarian_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON library TO librarian_role;
GRANT SELECT ON students, faculty TO librarian_role;

-- Financial Role
GRANT USAGE ON SCHEMA public TO financial_role;
GRANT SELECT, INSERT, UPDATE ON financial_records TO financial_role;
GRANT SELECT ON students, enrollments TO financial_role;

-- Reporter Role
GRANT USAGE ON SCHEMA public TO reporter_role;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO reporter_role;

-- =============================
-- 4. Assign Group Roles to Login Roles
-- =============================
GRANT admin_role TO john;
GRANT faculty_role TO sophia;
GRANT student_role TO emma;
GRANT staff_role TO michael;
GRANT librarian_role TO olivia;
GRANT financial_role TO liam;
GRANT reporter_role TO noah;