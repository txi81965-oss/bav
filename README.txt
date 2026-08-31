# BAV Phú Yên – bản cập nhật

## Các file
- `he-thong-truyen-thong.html`: website đã cập nhật tính năng. Đổi tên thành `index.html` khi đưa lên GitHub nếu repository đang dùng tên `index.html`.
- `config.example.js`: file mẫu cấu hình Supabase. Tạo `config.js` thật từ file này và điền Publishable key. Không đưa secret/service_role key vào website.
- `supabase-realtime-migration.sql`: chạy một lần để bật Realtime cho `bav_app_state`.

## Kết nối Supabase
1. Giữ bảng `public.bav_app_state` hiện tại.
2. Chạy `supabase-realtime-migration.sql` trong SQL Editor.
3. Tạo `config.js` cùng thư mục với `index.html`:

```js
window.BAV_CONFIG = {
  SUPABASE_URL: "https://pcwqbenixcqznwghjdxv.supabase.co",
  SUPABASE_ANON_KEY: "PUBLISHABLE_KEY_CUA_BAN"
};
```

4. Commit `index.html` + `config.js` lên GitHub. Cloudflare Pages sẽ deploy lại.

## Cập nhật code mà không mất dữ liệu
Code website nằm ở GitHub; dữ liệu nằm ở Supabase. Sửa `index.html`/các file giao diện không xóa dữ liệu Supabase. Không chạy `DROP TABLE`, `TRUNCATE` hoặc SQL xóa dữ liệu nếu không có sao lưu.

## Tính năng đã thêm trong bản này
- Trò chuyện có bộ icon/emoji phong phú.
- Quay/chụp: không còn yêu cầu ngày thực hiện; tự quay/chụp phải nhập tên minh chứng/video; tham gia CLB phải nhập tên thành viên CLB đã mời.
- Share bài: dùng link Facebook cá nhân, không gọi là link minh chứng.
- Hỗ trợ video minh chứng bổ sung trong các loại hoạt động phù hợp.
- Thêm chú ý đầy đủ về video tối thiểu 30 giây.
- Sau khi quản trị viên chọn Đạt, hệ thống mới tính hoạt động và điểm.
- Xuất danh sách có bảng xem trước, cho phép chỉnh sửa bản nháp trước khi xuất Excel/Word/PDF.
- Bảng chốt điểm có các hoạt động do Ban Truyền thông tổ chức; các nhóm Tự quay/chụp, CLB, Share chỉ xuất hiện khi thực sự có dữ liệu Đạt.
- Có mục Hướng dẫn sử dụng cho sinh viên và quản trị viên, có thể mở lại bất cứ lúc nào.
- Kết nối Supabase online + Realtime; có local fallback và cơ chế đưa dữ liệu local lên online nếu bảng online chưa có dữ liệu cho khóa đó.
