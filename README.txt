HỆ THỐNG TRUYỀN THÔNG BAV PHÚ YÊN - PHIÊN BẢN WEB ONLINE

Mục tiêu:
- Dữ liệu nằm trên database online, không phụ thuộc máy tính/điện thoại.
- Máy A thêm/sửa dữ liệu -> máy B/C nhìn thấy dữ liệu chung.
- Có Realtime để các trình duyệt đang mở nhận thay đổi.
- Giữ nguyên các chức năng chính của file HTML gốc: sinh viên, hoạt động, minh chứng, điểm, khiếu nại, thông báo, tin nhắn, nhật ký, sao lưu/phục hồi.

CÁCH ĐƯA LÊN WEB
1. Tạo một project trên Supabase.
2. Vào SQL Editor, chạy toàn bộ file supabase.sql.
3. Lấy Project URL và anon/public key trong phần API của project.
4. Mở index.html và thay:
   YOUR_SUPABASE_URL       -> URL project
   YOUR_SUPABASE_ANON_KEY  -> anon/public key
5. Đưa thư mục bav-web lên một dịch vụ hosting web tĩnh (Vercel, Netlify, Cloudflare Pages hoặc GitHub Pages).
6. Sau khi deploy, dùng đúng URL website đó trên máy tính, điện thoại, máy tính bảng.

QUAN TRỌNG
- Không dùng service_role key trong index.html.
- anon/public key có thể xuất hiện trong frontend; quyền truy cập phải được kiểm soát bằng RLS/Auth.
- Phiên bản này mở quyền đọc/ghi bảng dữ liệu cho anon để tương thích với hệ thống đăng nhập tùy biến hiện tại. Vì vậy đây là bản chạy được để đồng bộ dữ liệu, nhưng chưa phải mô hình bảo mật production cao nhất.
- Nếu triển khai chính thức cho dữ liệu sinh viên, bước tiếp theo nên chuyển đăng nhập sang Supabase Auth và thiết kế RLS theo vai trò sinh viên/quản trị viên.
- Chức năng sao lưu JSON vẫn nên được dùng định kỳ.

ĐỒNG NHẤT DỮ LIỆU
Dữ liệu dùng chung nằm trong bảng bav_app_data trên PostgreSQL. IndexedDB/localStorage chỉ còn là bộ nhớ dự phòng trên máy hiện tại khi mạng/database tạm thời không truy cập được.

Nếu muốn đổi chức năng sau này:
- Giữ nguyên database và tên bảng/keys.
- Chỉ cập nhật mã giao diện/logic trong index.html.
- Không xóa bảng bav_app_data.
- Trước khi cập nhật lớn, xuất file JSON sao lưu.
