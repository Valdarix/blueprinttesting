-- Foundation MDT Database Schema

CREATE TABLE IF NOT EXISTS `foundation_mdt_warrants` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `citizen_id` VARCHAR(50) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT,
    `charges` JSON,
    `issuing_officer` VARCHAR(100) NOT NULL,
    `issuing_department` VARCHAR(50) NOT NULL,
    `status` ENUM('active', 'served', 'expired', 'cancelled') DEFAULT 'active',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `served_at` TIMESTAMP NULL,
    `served_by` VARCHAR(100) NULL,
    INDEX `idx_citizen` (`citizen_id`),
    INDEX `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `foundation_mdt_reports` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT,
    `incident_type` VARCHAR(100),
    `location` VARCHAR(255),
    `citizens_involved` JSON,
    `charges` JSON,
    `evidence` JSON,
    `officer` VARCHAR(100) NOT NULL,
    `department` VARCHAR(50) NOT NULL,
    `status` ENUM('draft', 'filed', 'closed') DEFAULT 'draft',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX `idx_status` (`status`),
    INDEX `idx_officer` (`officer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `foundation_mdt_bolos` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `type` ENUM('person', 'vehicle') NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT,
    `citizen_id` VARCHAR(50) NULL,
    `plate` VARCHAR(20) NULL,
    `vehicle_model` VARCHAR(100) NULL,
    `vehicle_color` VARCHAR(50) NULL,
    `last_seen_location` VARCHAR(255) NULL,
    `issuing_officer` VARCHAR(100) NOT NULL,
    `department` VARCHAR(50) NOT NULL,
    `status` ENUM('active', 'resolved', 'expired') DEFAULT 'active',
    `priority` ENUM('low', 'medium', 'high', 'critical') DEFAULT 'medium',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX `idx_status` (`status`),
    INDEX `idx_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `foundation_mdt_evidence` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `report_id` INT NULL,
    `type` ENUM('mugshot', 'photo', 'document') NOT NULL,
    `url` VARCHAR(500) NOT NULL,
    `description` VARCHAR(255),
    `uploaded_by` VARCHAR(100) NOT NULL,
    `citizen_id` VARCHAR(50) NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX `idx_report` (`report_id`),
    INDEX `idx_citizen` (`citizen_id`),
    FOREIGN KEY (`report_id`) REFERENCES `foundation_mdt_reports`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `foundation_mdt_units` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `citizen_id` VARCHAR(50) NOT NULL UNIQUE,
    `callsign` VARCHAR(20),
    `status` ENUM('available', 'busy', 'enroute', 'on-scene', 'off-duty') DEFAULT 'off-duty',
    `department` VARCHAR(50) NOT NULL,
    `assigned_call` INT NULL,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX `idx_department` (`department`),
    INDEX `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `foundation_mdt_criminal_history` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `citizen_id` VARCHAR(50) NOT NULL,
    `charge_code` VARCHAR(20) NOT NULL,
    `charge_title` VARCHAR(255) NOT NULL,
    `fine` INT DEFAULT 0,
    `jail_time` INT DEFAULT 0,
    `officer` VARCHAR(100) NOT NULL,
    `department` VARCHAR(50) NOT NULL,
    `report_id` INT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX `idx_citizen` (`citizen_id`),
    FOREIGN KEY (`report_id`) REFERENCES `foundation_mdt_reports`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `foundation_mdt_activity_log` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `officer` VARCHAR(100) NOT NULL,
    `department` VARCHAR(50) NOT NULL,
    `action` VARCHAR(100) NOT NULL,
    `details` JSON,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX `idx_officer` (`officer`),
    INDEX `idx_action` (`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
