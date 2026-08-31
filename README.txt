BAV PHÚ YÊN - WEBSITE ĐỒNG BỘ DỮ LIỆU NHIỀU THIẾT BỊ

MỤC TIÊU
Website dùng một database online chung. Dữ liệu được lưu trên Supabase,
không còn phụ thuộc dữ liệu riêng của từng máy.

CÁCH CÀI ĐẶT
1. Tạo một Project trên Supabase.
2. Mở SQL Editor và chạy toàn bộ file supabase.sql.
3. Vào Project Settings > API.
4. Mở config.js và thay:
   DAN_PROJECT_URL_CUA_BAN_VAO_DAY
   DAN_ANON_KEY_CUA_BAN_VAO_DAY
   bằng Project URL và Publishable/anon key của project.
5. Đưa cả index.html và config.js lên cùng một hosting.
   Có thể dùng Vercel, Netlify, GitHub Pages hoặc hosting riêng.
6. Mọi thiết bị phải truy cập ĐÚNG CÙNG MỘT WEBSITE.

ĐỒNG BỘ HOẠT ĐỘNG
- Máy A thêm/sửa dữ liệu -> ghi vào Supabase.
- Máy B mở website -> đọc dữ liệu từ Supabase.
- Nếu Máy A và B đang mở cùng lúc, Realtime sẽ cập nhật thay đổi cho các máy.
- Khi mạng tạm mất, trình duyệt vẫn giữ cache; khi có mạng website sẽ lấy lại dữ liệu cloud.
- Nếu cloud đã có dữ liệu, cloud là nguồn dữ liệu chính; dữ liệu trên máy khác không tự ghi đè cloud khi mở website.

LƯU Ý QUAN TRỌNG VỀ AN TOÀN
Bản này ưu tiên đáp ứng yêu cầu đồng bộ nhiều thiết bị với hệ thống HTML hiện có.
Do hệ thống đăng nhập hiện tại vẫn là logic phía trình duyệt, SQL đang cho anon
quyền đọc/ghi bảng app_state. Không nên dùng cấu hình này cho dữ liệu nhạy cảm
trong môi trường chính thức.

BẢN CHÍNH THỨC NÊN NÂNG CẤP
- Supabase Auth cho đăng nhập.
- RLS theo sinh viên/quản trị viên.
- Tách students, activities, evidences, complaints, auditlog thành các bảng riêng.
- Không lưu mật khẩu dạng rõ trong database.
- Phân quyền Super Admin/Admin/Student ở server.

ĐIỂM QUAN TRỌNG
Không mở file index.html bằng cách gửi file riêng cho từng người rồi mong dữ liệu
đồng bộ. Tất cả người dùng phải truy cập cùng một URL website đã deploy và website
phải kết nối cùng một Supabase project.
