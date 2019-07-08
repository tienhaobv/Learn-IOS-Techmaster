#  Game Word Search
1.Giới thiệu
    Tìm các từ tiếng anh có nghĩa theo danh sách
    
2. Phân tích
    + Tải danh sách từ có sẵn
    + Tạo lưới với hàng và cột là mảng 2 chiều 
    
    + Bước 1: Sắp xếp tất cả các từ theo chiều dài , giảm dần 
    
    + Bước 2: Lấy từ đầu tiên , đặt nó lên bảng 
    
    + Bước 3: Lấy từ tiếp theo 
    
    + Bước 4: Thông qua các từ đã có trên bảng ,kiểm tra xem có bất kì giao điểm nào có thể với từ này ko
    
    + Bước 5 :Nếu có 1 vị trí khả     cho từ này ,lặp qua với các từ trên bảng và xem từ mới có can thiệp ko
    
    + Bước 6: Nếu từ này không phá vỡ bảng ,đặt nó ở đó và chuyển sang bước 3 . Nếu ko thì tiếp tục tìm kiếm 1 địa điểm (bước 4)
    
    + Bước 7:Tiếp tục vòng lặp này cho đến khi các từ đc đặt hoặc ko thể đặt
    
    Khi các từ đã đc đặt , điền vào các ô không sử dụng với các chữ cái ngẫu nhiên
    Note:Triển khai lưới dưới dạng mảng 1 chiểu để có thể biểu thị mỗi vị trí dưới dạng 1 số nguyên tố 
    3.Color hightlight
     Đường dẫn hiện đc chọn sẽ phát sáng 
     Khi 1 từ chính xác đc tìm thấy thì nó sẽ đc tô sáng
     Khi tìm thấy 1 từ màu hoạt động sẽ chuyển sang màu tiếp theo trong chuỗi 
     Các giao điểm sẽ là màu trộn 
     
     
    
    
    
