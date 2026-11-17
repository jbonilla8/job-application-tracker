-- Job Application Tracker Database Schema

CREATE DATABASE IF NOT EXISTS job_tracker;

USE job_tracker;

-- Companies table
CREATE TABLE companies (
    company_id INT NOT NULL AUTO_INCREMENT,
    company_name VARCHAR(100) NOT NULL,
    industry VARCHAR(50) DEFAULT NULL,
    website VARCHAR(200) DEFAULT NULL,
    city VARCHAR(50) DEFAULT NULL,
    state VARCHAR(50) DEFAULT NULL,
    notes TEXT,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (company_id),
    KEY idx_company_industry (industry)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_0900_ai_ci;


-- Jobs table
CREATE TABLE jobs (
    job_id INT NOT NULL AUTO_INCREMENT,
    company_id INT NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    job_description TEXT,
    salary_min INT DEFAULT NULL,
    salary_max INT DEFAULT NULL,
    job_type ENUM('Full-time', 'Part-time', 'Contract', 'Internship') DEFAULT NULL,
    job_url VARCHAR(300) DEFAULT NULL,
    date_posted DATE DEFAULT NULL,
    is_active TINYINT(1) DEFAULT '1',
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    requirements JSON DEFAULT NULL,
    PRIMARY KEY (job_id),
    KEY idx_job_title (job_title),
    KEY idx_company_type (company_id, job_type),
    CONSTRAINT jobs_ibfk_1
        FOREIGN KEY (company_id)
        REFERENCES companies (company_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_0900_ai_ci;


-- Applications table
CREATE TABLE applications (
    application_id INT NOT NULL AUTO_INCREMENT,
    job_id INT NOT NULL,
    application_date DATE NOT NULL,
    status ENUM(
        'Applied',
        'Screening',
        'Interview',
        'Offer',
        'Rejected',
        'Withdrawn'
    ) DEFAULT 'Applied',
    resume_version VARCHAR(50) DEFAULT NULL,
    cover_letter_sent TINYINT(1) DEFAULT '0',
    response_date DATE DEFAULT NULL,
    interview_date DATETIME DEFAULT NULL,
    notes TEXT,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    interview_data JSON DEFAULT NULL,
    PRIMARY KEY (application_id),
    KEY job_id (job_id),
    KEY idx_app_status (status),
    CONSTRAINT applications_ibfk_1
        FOREIGN KEY (job_id)
        REFERENCES jobs (job_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_0900_ai_ci;


-- Contacts table
CREATE TABLE contacts (
    contact_id INT NOT NULL AUTO_INCREMENT,
    company_id INT NOT NULL,
    email VARCHAR(100) DEFAULT NULL,
    phone VARCHAR(20) DEFAULT NULL,
    title VARCHAR(100) DEFAULT NULL,
    linkedin_url VARCHAR(200) DEFAULT NULL,
    notes TEXT,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    contact_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (contact_id),
    KEY company_id (company_id),
    CONSTRAINT contacts_ibfk_1
        FOREIGN KEY (company_id)
        REFERENCES companies (company_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_0900_ai_ci;
