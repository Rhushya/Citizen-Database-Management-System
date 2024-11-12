create database citizenvault;
use citizenvault;

CREATE TABLE basic_info (
    unique_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    age INT
);

CREATE TABLE contact_info (
    unique_id INT PRIMARY KEY,
    mobile_number VARCHAR(15) NOT NULL UNIQUE,
    email_id VARCHAR(100) UNIQUE,
    alternate_contact VARCHAR(15),
    FOREIGN KEY (unique_id) REFERENCES basic_info(unique_id)
);

CREATE TABLE address_info (
    unique_id INT PRIMARY KEY,
    permanent_address VARCHAR(255) NOT NULL,
    temporary_address VARCHAR(255),
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    zipcode VARCHAR(20),
    FOREIGN KEY (unique_id) REFERENCES basic_info(unique_id)
);

CREATE TABLE biometric_data (
    unique_id INT PRIMARY KEY,
    eye_colour VARCHAR(20),
    fingerprint_id VARCHAR(100) UNIQUE,
    birth_mark VARCHAR(255),
    FOREIGN KEY (unique_id) REFERENCES basic_info(unique_id)
);

CREATE TABLE government_ids (
    unique_id INT PRIMARY KEY,
    passport_no VARCHAR(20) UNIQUE NOT NULL,
	driving_license_no VARCHAR(20) UNIQUE,
    voter_id_no VARCHAR(20) UNIQUE,
    FOREIGN KEY (unique_id) REFERENCES basic_info(unique_id)
);

CREATE TABLE passport_data (
    unique_id INT PRIMARY KEY,
    passport_no VARCHAR(20) UNIQUE NOT NULL,
    date_of_issue DATE NOT NULL,
    date_of_expiry DATE NOT NULL,
	FOREIGN KEY (passport_no) REFERENCES government_ids(passport_no),
    FOREIGN KEY (unique_id) REFERENCES basic_info(unique_id)
);

CREATE TABLE driving_license_data (
    unique_id INT PRIMARY KEY,
    driving_license_no VARCHAR(20) UNIQUE NOT NULL,
    date_of_issue DATE NOT NULL,
    date_of_expiry DATE NOT NULL,
    type_of_vehicle VARCHAR(50) NOT NULL,
    past_incidents BOOLEAN NOT NULL,
    FOREIGN KEY (unique_id) REFERENCES basic_info(unique_id),
    FOREIGN KEY (driving_license_no) REFERENCES government_ids(driving_license_no)
);

CREATE TABLE voter_data (
    unique_id INT PRIMARY KEY,
    voter_id_no VARCHAR(20) UNIQUE NOT NULL,
    date_of_issue DATE NOT NULL,
    origin_state VARCHAR(50) NOT NULL,
    FOREIGN KEY (unique_id) REFERENCES basic_info(unique_id),
    FOREIGN KEY (voter_id_no) REFERENCES government_ids(voter_id_no)
);

CREATE TABLE employment_info (
    unique_id INT PRIMARY KEY,
    employer_name VARCHAR(100),
    job_title VARCHAR(100),
    employee_id VARCHAR(20),
    FOREIGN KEY (unique_id) REFERENCES basic_info(unique_id)
);

CREATE TABLE health_info (
    unique_id INT PRIMARY KEY,
    blood_group VARCHAR(5),
    allergies VARCHAR(255),
    chronic_conditions VARCHAR(255),
    FOREIGN KEY (unique_id) REFERENCES basic_info(unique_id)
);

CREATE TABLE emergency_contacts (
    unique_id INT PRIMARY KEY,
    emergency_contact_name VARCHAR(100) NOT NULL,
    emergency_contact_number VARCHAR(15) NOT NULL,
    relationship VARCHAR(50) NOT NULL,
    FOREIGN KEY (unique_id) REFERENCES basic_info(unique_id)
);