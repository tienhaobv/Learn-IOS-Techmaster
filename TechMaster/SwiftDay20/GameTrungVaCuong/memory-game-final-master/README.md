#  Spec ứng dụng Memory card

Màn hình có nhiều quân bài, người chơi tap vào màn hình để lật các quân bài lên

## Chi tiết:
- Có data là mảng 1 chiều random các giá trị trong khoảng [1;n]
- Có 1 mảng 2 chiều để hiển thị các quân bài, mỗi quân bài sẽ gắn với 1 giá trị trong mảng data
- Mỗi quân bài gồm có:
    + giá trị kiểu Int để so sánh với các ô khác
    + trạng thái kiểu bool: được lật hay chưa (mặc định là chưa)
    + ảnh đại diện cho mỗi quân bài, mỗi giá trị interger sẽ ứng với 1 ảnh
    + mảng 1 chiều lưu tên các ảnh để dùng cho việc "text to speech"
- Bàn cờ gồm có:
    + biến hàng, cột
    + hàm xáo trộn mảng data
- 1 biến timer đếm lùi, khi về 0 thì thông báo hét giờ -> thua
- 1 label hiển thị số lần tap của người chơi
- 1 biến point để lưu điểm của người chơi, khi lật đúng thì point += 2, khi lật sai thì point += 0  ->  khi point = hàng * cột thì thắng

### Hàm shuffleData:
- Tạo mảng 1 chiều gồm count phần tử (count = row * col). Ban đầu các phần tử trong mảng đều giống nhau , chúng được random trong khoảng [1;n], với n tùy vào độ khó của game
    + ví dụ:    n = 5, count = 16, half = 8, row = 4, col = 4
        data = [3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3]
                    `var data = [Int](repeating: Int.random(in: 1...n), count: rows * cols)`
- Tạo vòng for chạy từ 1..<half (với half = 8 thì chạy 7 lần từ 1..<8):
                ```for i in 1..<halfCount {
                        let temp = (i <= n) ? i : Int.random(in: 1...n)
                        data[i] = temp
                        data[i+halfCount] = temp
                    }
            ```
    + tạo biến temp: nếu i <= n thì temp = i, ngược lại temp = random(1...n)
                    `let temp = (i <= n) ? i : Int.random(in: 1...n)`
    + gán data[i] = data[i + half] = temp
            ```data[i] = temp
                 data[i+halfCount] = temp
            ```
    + ví dụ:  i = 1 < n  => temp = 1, khi đó mảng sẽ trở thành: 3,1,3,3,3,3,3,3,/,3,1,3,3,3,3,3,3
    + ví dụ:  i = 2 < n => temp = 2, cập nhật mảng:                  3,1,2,3,3,3,3,3,/,3,1,2,3,3,3,3,3    
    + lần lượt thực hiện i = 3,4,5, cập nhật mảng:                    3,1,2,3,4,5,3,3,/,3,1,2,3,4,5,3,3
    + khi i = 6 > 5, i = random(1...5), cập nhật mảng:                3,1,2,3,4,5,2,3,/,3,1,2,3,4,5,2,3        (i random = 2)
    + khi i = 7 > 5, i = random(1...5), cập nhật mảng:                3,1,2,3,4,5,2,4,/,3,1,2,3,4,5,2,4        (i random =4)   
    + DỪNG VÒNG LẶP
- Xáo trộn:
    + tạo vòng lặp chạy từ 0...half:
    + tạo 2 biến i,j được random trong khoảng [0...count]
    + đổi chỗ phần tử trong mảng có chỉ số i,j
    ```  for _ in 0...halfCount {
        let i = Int.random(in: 0..<data.count)
        let j = Int.random(in: 0..<data.count)
        (data[i], data[j]) = (data[j], data[i])
      }
    ```
    

## Mở rộng;
- Ở HomeScreen tạo 1 enum định nghĩa độ khó: easy, medium, hard:
    + mỗi độ khó sẽ có khoảng random khác nhau: easy là [1;7], medium là [1;14], hard là [1;21]
- Trong mỗi độ khó sẽ chia ra các level nhỏ hơn:
    + mỗi level sẽ có số lượng hàng, cột, thời gian chơi khác nhau
- Thêm âm thanh trong các trường:
    + khi tap vào các button và các quân bài
    + khi tap vào 2 quân bài khác nhau
    + khi tap vào 2 quân bài giống nhau thì dùng "text to speech" phát lên tên của lá bài đó (ví dụ England, Vietnnam, ...)
- Viết extension để chỉnh cơ chữ phù hợp cho cả iPhone và iPad






































