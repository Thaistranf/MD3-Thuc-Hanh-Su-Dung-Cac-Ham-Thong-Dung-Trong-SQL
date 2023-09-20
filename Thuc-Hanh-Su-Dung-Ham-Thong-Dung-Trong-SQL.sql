use quanlysinhvien;
-- Hiển thị số lượng sinh viên ở từng nơi
select Address, count(studentID) as So_luong_sinh_vien
from student
group by Address;
-- Tính điểm trung bình các môn học của mỗi học viên
select student.StudentID, student.StudentName, avg(Mark)
from student join mark on student.StudentID = mark.StudentID
group by student.StudentID, student.StudentName;
-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
select student.StudentID, student.StudentName, avg(Mark)
from student join mark on student.StudentID = mark.StudentID
group by student.StudentID, student.StudentName
having avg(Mark) > 15;
-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
select student.StudentID, student.StudentName, avg(Mark)
from student join mark on student.StudentID = mark.StudentID
group by student.StudentID, student.StudentName
having avg(Mark) >= all (select avg(Mark) from mark group by mark.StudentID);