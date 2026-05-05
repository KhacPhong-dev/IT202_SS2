/*
tóm tắt đề bài
+Bảng USERS hiện có ~2 triệu bản ghi
+Cột Phone ban đầu được thiết kế với kiểu dữ liệu là INT. Tuy nhiên, kiểu INT sẽ tự động cắt bỏ số 0 ở đầu
+Gây lỗi đăng nhập cho người dùng
yêu cầu 
+Đổi kiểu dữ liệu sang VARCHAR(15)
+Đưa ra 2 cách xử lý (DDL)
+So sánh ưu / nhược điểm
+Chọn giải pháp tốt nhất
+Viết SQL thực thi an toàn (không làm sập hệ thống)
*/


-- cách 1
alter table users
modify phone varchar(15);

-- ưu nhược điểm là:
-- ưu
-- +nhanh ngắn gọn
-- nhược
-- +lock bảng (Không cho:
-- thêm dữ liệu
-- sửa dữ liệu
-- đọc (tuỳ hệ))
-- +downtime hệ thống(dễ bị đứng )
-- +Rủi ro cao với bảng lớn

-- cách 2
alter table users add phone_new varchar(15);
update users set phone_new = phone;
alter table users drop column phone;
alter table users change phone_new phone varchar(15);

-- ưu nhược điểm là:
-- ưu
-- an toàn hơn
-- có thể chạy từng bước
-- giảm nguy cơ downtime
-- nhược
-- nhiều bước hơn
-- tốn thêm tạm thời bộ nhớ