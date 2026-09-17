-- 1. Группы
CREATE TABLE Groups (
    group_id    VARCHAR(10) PRIMARY KEY,
    group_name  VARCHAR(50) NOT NULL
);

-- 2. Студенты
CREATE TABLE Students (
    student_id    INT PRIMARY KEY,
    student_name  VARCHAR(100) NOT NULL,
    group_id      VARCHAR(10) NOT NULL,
    FOREIGN KEY (group_id) REFERENCES Groups(group_id)
);

-- 3. Преподаватели
CREATE TABLE Teachers (
    teacher_id    INT PRIMARY KEY,
    teacher_name  VARCHAR(100) NOT NULL
);

-- 4. Предметы
CREATE TABLE Subjects (
    subject_id    INT PRIMARY KEY,
    subject_name  VARCHAR(100) NOT NULL UNIQUE
);

-- 5. Оценки (журнал)
CREATE TABLE Grades (
    student_id  INT NOT NULL,
    subject_id  INT NOT NULL,
    teacher_id  INT NOT NULL,
    exam_date   DATE NOT NULL,
    grade       INT NOT NULL CHECK (grade BETWEEN 1 AND 5),
    
    PRIMARY KEY (student_id, subject_id, exam_date),
    
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);