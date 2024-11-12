SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO basic_info (unique_id, first_name, last_name, dob, age)
VALUES
(101, 'John', 'Doe', '1995-05-15', TIMESTAMPDIFF(YEAR, '1995-05-15', CURDATE())),
(102, 'Jane', 'Smith', '1992-09-12', TIMESTAMPDIFF(YEAR, '1992-09-12', CURDATE())),
(103, 'Alice', 'Johnson', '1988-07-10', TIMESTAMPDIFF(YEAR, '1988-07-10', CURDATE())),
(104, 'Robert', 'Wilson', '1990-11-20', TIMESTAMPDIFF(YEAR, '1990-11-20', CURDATE())),
(105, 'Michael', 'Brown', '1985-02-14', TIMESTAMPDIFF(YEAR, '1985-02-14', CURDATE()));

INSERT INTO contact_info (unique_id, mobile_number, email_id, alternate_contact)
VALUES
(101, '9876543210', 'johndoe@example.com', '9123456789'),
(102, '8765432109', 'janesmith@example.com', '9988776655'),
(103, '7654321098', 'alicejohnson@example.com', '8877665544'),
(104, '6543210987', 'robertwilson@example.com', '7766554433'),
(105, '5432109876', 'michaelbrown@example.com', NULL);

INSERT INTO address_info (unique_id, permanent_address, temporary_address, city, state, country, zipcode)
VALUES
(101, '123, Elm Street', '456, Oak Avenue', 'Springfield', 'Illinois', 'USA', '62701'),
(102, '789, Maple Drive', '321, Pine Lane', 'Chicago', 'Illinois', 'USA', '60605'),
(103, '101, Birch Boulevard', NULL, 'New York', 'New York', 'USA', '10001'),
(104, '202, Cedar Court', '789, Willow Street', 'Los Angeles', 'California', 'USA', '90001'),
(105, '303, Redwood Road', NULL, 'Austin', 'Texas', 'USA', '73301');

INSERT INTO biometric_data (unique_id, eye_colour, fingerprint_id, birth_mark)
VALUES
(101, 'Brown', 'FPRINT001', 'Scar on right cheek'),
(102, 'Blue', 'FPRINT002', NULL),
(103, 'Green', 'FPRINT003', 'Birthmark on left arm'),
(104, 'Hazel', 'FPRINT004', 'Freckle near right eyebrow'),
(105, 'Brown', 'FPRINT005', NULL);

INSERT INTO government_ids (unique_id, passport_no, driving_license_no, voter_id_no)
VALUES
(101, 'P00123456', 'DL0012345', 'VOTER12345'),
(102, 'P00234567', 'DL0023456', 'VOTER23456'),
(103, 'P00345678', 'DL0034567', 'VOTER34567'),
(104, 'P00456789', 'DL0045678', 'VOTER45678'),
(105, 'P00567890', 'DL0056789', 'VOTER56789');

-- Insert into passport_data
INSERT INTO passport_data (unique_id, passport_no, date_of_issue, date_of_expiry)
VALUES
(101, 'P00123456', '2015-06-15', '2025-06-14'),
(102, 'P00234567', '2016-09-10', '2026-09-09'),
(103, 'P00345678', '2014-03-20', '2024-03-19'),
(104, 'P00456789', '2018-12-05', '2028-12-04'),
(105, 'P00567890', '2013-01-17', '2023-01-16');

-- Insert into driving_license_data
INSERT INTO driving_license_data (unique_id, driving_license_no, date_of_issue, date_of_expiry, type_of_vehicle, past_incidents)
VALUES
(101, 'DL0012345', '2016-05-20', '2026-05-19', 'Car', 0),
(102, 'DL0023456', '2017-07-15', '2027-07-14', 'Bike', 1),
(103, 'DL0034567', '2015-11-05', '2025-11-04', 'Car', 0),
(104, 'DL0045678', '2019-02-25', '2029-02-24', 'Car', 1),
(105, 'DL0056789', '2014-08-13', '2024-08-12', 'Car', 0);

-- Insert into voter_data
INSERT INTO voter_data (unique_id, voter_id_no, date_of_issue, origin_state)
VALUES
(101, 'VOTER12345', '2012-11-05', 'Illinois'),
(102, 'VOTER23456', '2013-08-15', 'Illinois'),
(103, 'VOTER34567', '2011-09-25', 'New York'),
(104, 'VOTER45678', '2016-04-10', 'California'),
(105, 'VOTER56789', '2010-12-20', 'Texas');

-- Insert into employment_info
INSERT INTO employment_info (unique_id, employer_name, job_title, employee_id)
VALUES
(101, 'Google', 'Software Engineer', 'EMP101'),
(102, 'Netflix', 'Graphic Designer', 'EMP102'),
(103, 'X', 'Project Manager', 'EMP103'),
(104, 'JP Morgan', 'Financial Analyst', 'EMP104'),
(105, 'Tesla', 'Mechanical Engineer', 'EMP105');

-- Insert into health_info
INSERT INTO health_info (unique_id, blood_group, allergies, chronic_conditions)
VALUES
(101, 'O+', 'Peanuts', NULL),
(102, 'A+', NULL, 'Asthma'),
(103, 'B+', 'Shellfish', NULL),
(104, 'AB+', NULL, 'Diabetes'),
(105, 'O-', 'Dust, Pollen', NULL);

-- Insert into emergency_contacts
INSERT INTO emergency_contacts (unique_id, emergency_contact_name, emergency_contact_number, relationship)
VALUES
(101, 'Emily Doe', '9988776655', 'Spouse'),
(102, 'David Smith', '8877665544', 'Brother'),
(103, 'Linda Johnson', '7766554433', 'Mother'),
(104, 'Mark Wilson', '6655443322', 'Father'),
(105, 'Sophia Brown', '5544332211', 'Spouse');

SET FOREIGN_KEY_CHECKS = 1;