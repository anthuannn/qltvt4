# Hệ thống Quản lý Thư viện
Ứng dụng Quản lý Thư viện bằng C# Windows Form

## Giới thiệu
Kho lưu trữ này chứa mã nguồn của **đồ án cuối kỳ môn Công nghệ .NET**. Dự án này mô phỏng một ứng dụng quản lý thư viện thực tế nhằm minh họa việc áp dụng lập trình hướng đối tượng (OOP) trong C#, kết nối cơ sở dữ liệu và kiến trúc hệ thống.
Tài liệu README.md này được sử dụng thay thế cho tài liệu Thiết kế Phần mềm (Software Design Document) truyền thống.

## Thành viên nhóm & Vai trò
- Vũ Ngọc An Thuận (Phân tích hệ thống, UI/UX, Phát triển Backend)
- Trần Nguyễn Hậu (Phát triển Frontend,P hát triển Backend, Thiết kế UI/UX)
- Vũ Huy Minh (Phát triển Backend, Thiết kế Cơ sở dữ liệu)
- Đặng Lê Hoàng Danh (Chuẩn bị tài liệu, Kiểm thử)

## 1. Mô tả
Tài liệu này mô tả phiên bản 1.0 của Hệ thống Quản lý Thư viện. Nội dung bao gồm các phần sau:
- Trong phần 2, cung cấp cái nhìn tổng quan về các yêu cầu hệ thống, bao gồm danh sách người dùng, các trường hợp sử dụng (use case), sơ đồ use case và sơ đồ hoạt động mô tả các kịch bản quan trọng nhất.
- Trong phần 3, trình bày chi tiết sơ đồ E-R (Sơ đồ quan hệ thực thể) và tất cả các bảng dữ liệu của hệ thống.
- Trong phần 4, trình bày các lớp (class) được tổ chức theo từng tầng (layer) và hành vi của chúng (sơ đồ tuần tự - sequence diagram) cho các trường hợp sử dụng phổ biến nhất.
- Trong phần 5, trình bày các mẫu thiết kế màn hình (prototype).

## 2. Tổng quan về Yêu cầu Phần mềm
### 2.1 Danh sách người dùng hệ thống
#### 2.1.1 Thủ thư
Thủ thư là người làm việc chuyên nghiệp trong thư viện, chịu trách nhiệm cung cấp quyền truy cập thông tin cho người dùng.

### 2.2 Danh sách các trường hợp sử dụng (Use Cases)
- UC-1: Mượn sách
- UC-2: Trả sách
- UC-3: Đặt chỗ sách
- UC-4: Đăng ký sách mới
- UC-5: Đăng ký người mượn
- UC-6: Gia hạn sách đã mượn

### 2.3 Sơ đồ Use Case
![Sơ đồ Use Case](https://i.imgur.com/5MIKUK9.png)

### 2.4 Sơ đồ hoạt động cho các kịch bản Use Case
#### 2.4.1 Sơ đồ hoạt động cho trường hợp "Mượn sách"
![Sơ đồ hoạt động Mượn sách](https://i.imgur.com/D042vwa.png)
#### 2.4.2 Sơ đồ hoạt động cho trường hợp "Trả sách"
![Sơ đồ hoạt động Trả sách](https://i.imgur.com/fzWe6wU.png)
#### 2.4.3 Sơ đồ hoạt động cho trường hợp "Đặt chỗ sách"
![Sơ đồ hoạt động Đặt chỗ](https://i.imgur.com/IR18Sb1.png)

## 3. Mô hình Dữ liệu
### 3.1 Sơ đồ Quan hệ Thực thể (ERD)
![ERD](https://i.imgur.com/UppeyPq.png)

### 3.2 Chi tiết các bảng dữ liệu
#### 3.2.1 Tên bảng: Member (Thành viên)
| Tên trường | Kiểu dữ liệu | Kích thước | Ghi chú |
| --- | --- | --- | --- |
| MemberNumber | số nguyên | 10 | KHÓA CHÍNH |
| Name | chuỗi | 150 | Không được NULL |
| Sex | boolean |  | Không được NULL |
| Address | chuỗi | 150 | Không được NULL |
| Telephone | chuỗi | 15 | Không được NULL |
| Email | chuỗi | 50 | Không được NULL |

#### 3.2.2 Tên bảng: Book (Sách)
| Tên trường | Kiểu dữ liệu | Kích thước | Ghi chú |
| --- | --- | --- | --- |
| BookNumber | số nguyên | 10 | KHÓA CHÍNH |
| Title | chuỗi | 150 | Không được NULL |
| Author | chuỗi | 150 | Không được NULL |
| Publisher | chuỗi | 150 | Không được NULL |

#### 3.2.3 Tên bảng: Copy (Bản sao sách)
| Tên trường | Kiểu dữ liệu | Kích thước | Ghi chú |
| --- | --- | --- | --- |
| CopyNumber | số nguyên | 10 | KHÓA CHÍNH |
| BookNumber | số nguyên | 10 | Khóa ngoại, tham chiếu đến Book |
| SequenceNumber | số nguyên | 10 | Số thứ tự cho mỗi bản sao của cùng một cuốn sách |
| Type | số nguyên | 10 | 0: Sẵn có, 1: Đã mượn, 2: Tham khảo |
| Price | số thực |  | Cho phép NULL |

#### 3.2.4 Tên bảng: Circulated Copy (Giao dịch lưu thông)
| Tên trường | Kiểu dữ liệu | Kích thước | Ghi chú |
| --- | --- | --- | --- |
| ID | số nguyên | 10 | KHÓA CHÍNH |
| MemberNumber | số nguyên | 10 | Khóa ngoại, tham chiếu đến Member |
| CopyNumber | số nguyên | 10 | Khóa ngoại, tham chiếu đến Copy |
| BorrowDate | ngày giờ |  | Không được NULL |
| DueDate | ngày giờ |  | Cho phép NULL |
| ReturnDate | ngày giờ |  | Cho phép NULL |
| FineAmount | số thực |  | Cho phép NULL |

#### 3.2.5 Tên bảng: Reservation (Đặt chỗ)
| Tên trường | Kiểu dữ liệu | Kích thước | Ghi chú |
| --- | --- | --- | --- |
| ID | số nguyên | 10 | KHÓA CHÍNH |
| MemberNumber | số nguyên | 10 | Khóa ngoại, tham chiếu đến Member |
| BookNumber | số nguyên | 10 | Khóa ngoại, tham chiếu đến Book |
| Date | ngày giờ |  | Không được NULL |
| Status | số nguyên | 10 | 0: Sẵn có, 1: Đã đặt chỗ |

## 4. Sơ đồ Lớp (Class Diagram)
### 4.1 Danh sách các lớp theo phân tầng
![Danh sách các lớp](https://i.imgur.com/nktMmqK.png)

### 4.2 Mô hình hóa hành vi các lớp
#### 4.2.1 Sơ đồ tuần tự cho trường hợp "Mượn bản sao sách"
![Tuần tự mượn](https://i.imgur.com/3meVeNV.png)
#### 4.2.2 Sơ đồ tuần tự cho trường hợp "Trả bản sao sách"
![Tuần tự trả](https://i.imgur.com/yPyz3Ob.png)
#### 4.2.3 Sơ đồ tuần tự cho trường hợp "Đặt chỗ sách"
![Tuần tự đặt chỗ](https://i.imgur.com/6gH2LoI.png)

## 5. Thiết kế Mô hình Giao diện Người dùng
### 5.1 Thiết kế các màn hình giao diện
#### 5.1.1 Màn hình "Đăng ký sách"
![Đăng ký sách](https://i.imgur.com/wHiSV8s.png)
#### 5.1.2 Màn hình "Đăng ký thành viên"
![Đăng ký thành viên](https://i.imgur.com/JICLlJG.png)
#### 5.1.3 Màn hình "Mượn sách"
![Mượn sách](https://i.imgur.com/okgkUX0.png)
#### 5.1.4 Màn hình "Trả sách"
![Trả sách](https://i.imgur.com/Wn8lc5r.png)
#### 5.1.5 Màn hình "Đặt chỗ sách"
![Đặt chỗ sách](https://i.imgur.com/3wAB9jS.png)
#### 5.1.6 Màn hình "Gia hạn mượn sách"
![Gia hạn](https://i.imgur.com/4Cct06S.png)

### 5.2 Sơ đồ luồng giao diện
![Sơ đồ luồng giao diện](https://i.imgur.com/1disQol.png)
