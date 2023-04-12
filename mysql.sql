-- @block
SHOW DATABASES;
-- @block
DROP DATABASE web_app;
-- @block
CREATE DATABASE web_app;
-- @block
USE web_app;
-- @block
CREATE TABLE `user` (
    `id` INT(3) AUTO_INCREMENT NOT NULL,
    `type` ENUM('admin', 'teacher', 'student'),
    `first_name` VARCHAR(40) DEFAULT NULL,
    `last_name` VARCHAR(40) DEFAULT NULL,
    `username` VARCHAR(20) NOT NULL UNIQUE,
    `password` VARCHAR(30) DEFAULT NULL,
    `address` VARCHAR(45) DEFAULT NULL,
    `contact` VARCHAR(45) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- @block
CREATE TABLE `course` (
    `id` VARCHAR(10) NOT NULL,
    `course_name` VARCHAR(10),
    `teacher_id` INT(3),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`teacher_id`)
        REFERENCES user(id)
        ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
CREATE TABLE `std_course` (
    `id` INT(3) AUTO_INCREMENT NOT NULL,
    `student_id` INT(3),
    `course_id` VARCHAR(10),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`student_id`)
        REFERENCES user(id)
        ON DELETE CASCADE,
    FOREIGN KEY (`course_id`)
        REFERENCES course(id)
        ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
CREATE TABLE `tch_course` (
    `id` INT(3) AUTO_INCREMENT NOT NULL,
    `teacher_id` INT(3) NOT NULL,
    `course_id` VARCHAR(10),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`teacher_id`)
        REFERENCES user(id)
        ON DELETE CASCADE,
    FOREIGN KEY (`course_id`)
        REFERENCES course(id)
        ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- @block
DROP TABLE web_app.std_course;
DROP TABLE web_app.tch_course;
DROP TABLE web_app.course;
-- DROP TABLE web_app.user;
-- @block
DESCRIBE web_app.std_course;
DESCRIBE web_app.tch_course;
DESCRIBE web_app.course;
DESCRIBE web_app.user;
-- @block
INSERT INTO `user` (
        `id`,
        `first_name`,
        `last_name`,
        `username`,
        `password`,
        `address`,
        `contact`
    )
VALUES (
        1,
        'John',
        'Doe',
        'jdoe',
        'pass',
        'address:VARCHAR',
        'contact:VARCHAR'
    );
-- @block
ALTER TABLE user MODIFY username VARCHAR(20) NOT NULL UNIQUE;
-- @block
ALTER TABLE course MODIFY `teacher_id` INT(3) NOT NULL;
-- @block
SELECT * FROM web_app.user WHERE type="teacher";
SELECT first_name, last_name FROM web_app.user WHERE type="teacher" AND id=4 LIMIT 1;