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
    `id` int(3) AUTO_INCREMENT NOT NULL,
    `type` ENUM('admin', 'teacher', 'student'),
    `first_name` varchar(40) DEFAULT NULL,
    `last_name` varchar(40) DEFAULT NULL,
    `username` varchar(20) DEFAULT NULL,
    `password` varchar(30) DEFAULT NULL,
    `address` varchar(45) DEFAULT NULL,
    `contact` varchar(45) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- @block
CREATE TABLE `course` (
    `id` VARCHAR(10) NOT NULL,
    `teacher_id` int(3),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`teacher_id`)
        REFERENCES user(id)
        ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- @block
CREATE TABLE `std_course` (
    `id` int(3) AUTO_INCREMENT NOT NULL,
    `student_id` int(3),
    `course_id` varchar(10),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`student_id`)
        REFERENCES user(id)
        ON DELETE CASCADE,
    FOREIGN KEY (`course_id`)
        REFERENCES course(id)
        ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- @block
CREATE TABLE `tch_course` (
    `id` int(3) AUTO_INCREMENT NOT NULL,
    `teacher_id` int(3) NOT NULL,
    `course_id` varchar(10),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`teacher_id`)
        REFERENCES user(id)
        ON DELETE CASCADE,
    FOREIGN KEY (`course_id`)
        REFERENCES course(id)
        ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- @block
-- DROP TABLE web_app.user;
-- DROP TABLE web_app.course;
DROP TABLE web_app.std_course;
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
        'address:varchar',
        'contact:varchar'
    );
-- @block
ALTER TABLE user
MODIFY id int(3) NOT NULL AUTO_INCREMENT;
-- @block
ALTER TABLE course
MODIFY `teacher_id` int(3) NOT NULL;
-- @block
SELECT *
FROM web_app.user WHERE type="student";