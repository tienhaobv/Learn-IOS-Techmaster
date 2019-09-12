# Chủ đề hôm nay sẽ về:

## 1- Build REST Web service
## 2- Kết nối từ iOS client đến REST Web service

### REST Web service là gì:
+ REST là viết tắt của Representational State Transfer.
+ Dịch vụ trả về dữ liệu có định dạng kiểu JSON  và XML.
+ Hoạt động trên nền HTTP protocol (http hoặc https đã mã hóa)
+ JSON là JavaScript Object Notation, khác với XML có openning tag đi cùng với closing tag. JSON có {key: value} hoặc mảng []

### Tại sao JSON, REST lại phổ biến?
+ JSON là chuẩn mô tả dữ liệu được sử dụng cho web app có thể mở rộng cho nhiều loại ứng dụng khác nhau ví dụ
iOS, Android, Flutter, React Native kết nối lên REST.

### Đặc điểm của REST Service đó là:
+ Mô hình request - response (hỏi - đáp) sau này chúng ta sẽ học tiếp đến mô hình subscribe - publish (đăng ký - gửi tin)
+ Server chỉ trả về khi có client request.

### REST khác và giống gì với Web Application?
- Giống nhau:
+ Có thể hoạt động trên cùng một web server
+ Dùng chung http hoặc https protocol
+ Cùng cơ chế request, response

- Khác nhau:
+ Web Application có giao diện thực chất trả về HTML, CSS, Javascript.
+ REST chỉ trả về dữ liệu không có giao diện.

### REST thì có các verb, method đi cùng
+ GET: gửi request thuần qua URL (chứa query string) và nhận về phẩn
+ POST: gửi request, dữ liệu nằm trong body của request.
+ PUT
+ DELETE

https://techmaster.vn/posts/35497/tai-sao-flutter-lai-su-dung-dart

https:// nếu là unsecured http://
techmaster.vn là domain name
/posts/35497/tai-sao-flutter-lai-su-dung-dart
?param1=value1&param2=value2 là query string có cấu trúc giống với dictionary dạng key-value

### Cần thêm công cụ gì để lập trình REST

1. Cài tool PostMan dùng để debug REST tạo request giả lập
  Nếu muốn xem JSON trả về trên browser thì cài JSONViewer extension
2. Giả lập REST bằng server
3. Tự code bằng bất kỳ web application server nào:

- Node.js : Express, Sails, Mean.js
- Java: JavaSpring
- PHP: Laravel, CakePHP, Phalcon
- Golang: Iris, Echo, Gin..
- Python: Flask, Sanic<*>
- Swift: Vapor, IBM Kituria


### Tại sao thầy Cường dùng Sanic?
1. Python giờ rất là hot. Hầu như công ty nào cũng cần để xử lý dữ liệu và làm AI.
2. Sanic có cộng đồng lớn, liên tục cập nhật
3. Tốc độ tốt hơn Flask
4. Nhiều ví dụ để tự học


### Về phía client IOS, cần dùng thư viện gì?
- Dùng vanilla library (thư viện chuẩn của chính hãng) NSURLSession

- Dùng 3rd parties libraries: Alamorefire có nhiều plugins bổ xung, cũng dễ học.

### Về ngôn ngữ Swift thì mình cần phải học thêm gì?
- Closure: hàm anonymous, dùng để hứng sự kiện xuất hiện trong tương lai.
- Callback

----------------------------