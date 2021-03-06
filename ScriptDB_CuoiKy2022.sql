	-----------------------------------------------------------
-- Bước 1 : TẠO BẢNG VÀ KHÓA CHÍNH
-----------------------------------------------------------
create table PHONGBAN 
(
	TENPHG 	nvarchar(30),
	MAPHG 	int NOT NULL,
	TRPHG 	char(9),
	NG_NHANCHUC 	datetime,
	primary key (MAPHG)
)

create table NHANVIEN 
(
	HONV 	nvarchar(30),
	TENLOT 	nvarchar(30),
	TENNV 	nvarchar(30),
	MANV 	char(9) NOT NULL,
	NGSINH 	datetime,
	DCHI 	nvarchar(50),
	PHAI 	nchar(6),
	LUONG 	float,
	MA_NQL 	char(9),
	PHG 	int,
	primary key (MANV)	
)

create table DIADIEM_PHG
(
	MAPHG 	int NOT NULL,
	DIADIEM nvarchar(30) NOT NULL,
	primary key (MAPHG, DIADIEM)
)
create table CONGVIEC
(
	MADA	int NOT NULL,
	STT	int NOT NULL,
	TEN_CONG_VIEC nvarchar(50),
	primary key (MADA, STT)
)

create table PHANCONG 
(
	MA_NVIEN	char(9) NOT NULL,
	MADA 	int NOT NULL,
	STT		int NOT NULL, 
	THOIGIAN	decimal(5,1),
	primary key (MA_NVIEN, MADA, STT)
)

create table THANNHAN 
(
	MA_NVIEN char(9) NOT NULL,
	TENTN 	nvarchar(30) NOT NULL,
	PHAI 	nchar(6),
	NGSINH 	datetime,
	QUANHE 	nvarchar(16),
	primary key (MA_NVIEN, TENTN)
)

create table DEAN 
(
	TENDA nvarchar(30),
	MADA int NOT NULL,
	DDIEM_DA nvarchar(30),
	PHONG int,
	primary key (MADA)
)

-----------------------------------------------------------
-- Bước 2 : TẠO RÀNG BUỘC KHÓA NGOẠI
-----------------------------------------------------------
alter table NHANVIEN add constraint FK_NHANVIEN_NHANVIEN foreign key (MA_NQL) references  NHANVIEN(MANV)

alter table NHANVIEN add constraint FK_NHANVIEN_PHONGBAN foreign key (PHG) references  PHONGBAN(MAPHG)
-----------------------------------------------------------
alter table PHONGBAN add constraint FK_PHONGBAN_NHANVIEN foreign key (TRPHG) references  NHANVIEN(MANV)
-----------------------------------------------------------
alter table DIADIEM_PHG add constraint FK_DIADIEM_PHG_PHONGBAN foreign key (MAPHG) references  PHONGBAN(MAPHG)
-----------------------------------------------------------
alter table PHANCONG add constraint FK_PHANCONG_NHANVIEN foreign key (MA_NVIEN) references  NHANVIEN(MANV)
alter table PHANCONG add constraint FK_PHANCONG_CONGVIEC foreign key (MADA, STT) references  CONGVIEC(MADA, STT)
-----------------------------------------------------------
alter table CONGVIEC add constraint FK_CONGVIEC_DEAN foreign key (MADA) references  DEAN(MADA)
-----------------------------------------------------------
alter table THANNHAN add constraint FK_THANNHAN_NHANVIEN foreign key (MA_NVIEN) references  NHANVIEN(MANV)
-----------------------------------------------------------
alter table DEAN add constraint FK_DEAN_PHONGBAN foreign key (PHONG) references  PHONGBAN(MAPHG)
----------------------------------------------------------

-----------------------------------------------------------
-- Bước 3 : INSERT DỮ LIỆU 
-----------------------------------------------------------
--------------------INSERT PHONGBAN----------------------

insert into PHONGBAN
values(N'Nghiên cứu', 5, null, '05/22/1988')

insert into PHONGBAN
values(N'Điều hành', 4, null, '01/01/1995')

insert into PHONGBAN
values(N'Quản lý', 1, null, '06/19/1981')
----------------- INSERT NHANVIEN--------------------
insert into NHANVIEN 
values (N'Đinh',N'Bá',N'Tiến','009','02/11/1960',
	N'119 Cống Quỳnh, Tp HCM',N'Nam',30000,null,5)

insert into NHANVIEN
values (N'Nguyễn',N'Thanh',N'Tùng','005','08/20/1962',
	N'222 Nguyễn Văn Cừ, Tp HCM',N'Nam',40000,null,5)
insert into NHANVIEN
values (N'Bùi',N'Ngọc',N'Hằng','007','3/11/1954',
	N'332 Nguyễn Thái Học, Tp HCM',N'Nam',25000,null,4)

insert into NHANVIEN
values (N'Lê',N'Quỳnh',N'Như','001','02/01/1967',
	N'291 Hồ Văn Huê,  Tp HCM',N'Nữ',43000,null,4)

insert into NHANVIEN
values (N'Nguyễn',N'Mạnh',N'Hùng','004','03/04/1967',N'95 Bà Rịa, Vũng Tàu',N'Nam',38000,null,5)

insert into NHANVIEN
values (N'Trần',N'Thanh',N'Tâm','003','05/04/1957',N'34 Mai Thị Lựu, Tp HCM',N'Nam',25000,null,5)

insert into NHANVIEN
values (N'Trần',N'Hồng',N'Quang','008','09/01/1967',N'80 Lê Hồng Phong, Tp HCM',N'Nam',25000,null,4)

insert into NHANVIEN
values (N'Phạm',N'Văn',N'Vinh','006','01/01/1965',N'45 Trưng Vương, Hà Nội',N'Nữ',55000, null,	1)
----------------- UPDATE PHONGBAN--------------------
update  PHONGBAN
set TRPHG=N'005'
where MAPHG=5

update  PHONGBAN
set TRPHG=N'008'
where MAPHG=4

update  PHONGBAN
set TRPHG=N'006'
where MAPHG=1

----------------- UPDATE NHANVIEN--------------------

update  NHANVIEN set MA_NQL='005' where MANV=N'009'

update  NHANVIEN set MA_NQL='006' where MANV=N'005'

update  NHANVIEN set MA_NQL='001' where MANV='007'

update  NHANVIEN set MA_NQL='006' where MANV='001'

update  NHANVIEN set MA_NQL='005' where MANV='004'

update  NHANVIEN set MA_NQL='005' where MANV='003'

update  NHANVIEN set MA_NQL='001' where MANV='008'
-----------------INSERT DIADIEM_PHG --------------------
insert into DIADIEM_PHG
values(1,N'TP HCM')

insert into DIADIEM_PHG
values(4,N'Hà Nội')

insert into DIADIEM_PHG
values(5,N'Vũng Tàu')

insert into DIADIEM_PHG
values(5,N'Nha Trang')

insert into DIADIEM_PHG
values(5,N'TP HCM')
----------------- INSERT THANNHAN--------------------
insert into THANNHAN
values('005', N'Trinh', N'Nam', '04/05/1976', N'Con gái')

insert into THANNHAN
values('005', N'Khang', N'Nam', '10/25/1973', N'Con trai')

insert into THANNHAN
values('005', N'Phương', N'Nữ', '05/03/1948', N'Vợ chồng')

insert into THANNHAN
values('001', N'Minh', N'Nam', '02/28/1932', N'Vợ chồng')

insert into THANNHAN
values('009', N'Tiến', N'Nam', '01/01/1978', N'Con trai')

insert into THANNHAN
values('009', N'Châu', N'Nam', '12/30/1978', N'Con trai')

insert into THANNHAN
values('009', N'Phương', N'Nữ', '05/05/1957', N'Vợ chồng')
----------------- INSERT DEAN--------------------
insert into DEAN
values(N'Sản phẩm X', 1, N'Vũng Tàu', 5)

insert into DEAN
values(N'Sản phẩm Y', 2, N'Nha Trang', 5)

insert into DEAN
values(N'Sản phẩm Z', 3, N'TP HCM', 5)

insert into DEAN
values(N'Tin học hóa', 10, N'Hà Nội', 4)

insert into DEAN
values(N'Cáp quang', 20, N'TP HCM', 1)

insert into DEAN
values(N'Đào tạo', 30, N'Hà Nội', 4)

----------------- INSERT CONGVIEC--------------------
insert into CONGVIEC (MADA, STT, TEN_CONG_VIEC) 
values (1, 	1, 	N'Thiết kế sản phầm X')

insert into CONGVIEC (MADA, STT, TEN_CONG_VIEC) 
values (1, 	2, 	N'Nghiệm thu sản phầm X')

insert into CONGVIEC (MADA, STT, TEN_CONG_VIEC) 
values (2, 	1, 	N'Sản xuất sản phẩm Y')

insert into CONGVIEC (MADA, STT, TEN_CONG_VIEC) 
values (2, 	2, 	N'Quảng cáo sản phẩm Y')

insert into CONGVIEC (MADA, STT, TEN_CONG_VIEC) 
values (3, 	1, 	N'Khuyến mãi sản phẩm Z')

insert into CONGVIEC (MADA, STT, TEN_CONG_VIEC) 
values (10, 	1, 	N'Tin học hóa nhân sự tiền lương')

insert into CONGVIEC (MADA, STT, TEN_CONG_VIEC) 
values (10, 	2, 	N'Tin học hóa phòng kinh doanh')

insert into CONGVIEC (MADA, STT, TEN_CONG_VIEC) 
values (20, 	1, 	N'Lắp đặt cáp quang')

insert into CONGVIEC (MADA, STT, TEN_CONG_VIEC) 
values (30, 	1, 	N'Đào tạo nhân viên Marketing')

insert into CONGVIEC (MADA, STT, TEN_CONG_VIEC) 
values (30, 	2,	N'Đào tạo chuyên viên thiết kế')

insert into PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) 
values ('009',	1,	1,	32)

insert into PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) 
values ('009',	2,	2,	8)

insert into PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) 
values ('004',	3,	1,	40)

insert into PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) 
values ('003',	1,	2,	20.0)

insert into PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) 
values ('003',	2,	1,	20.0)

insert into PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) 
values ('008',	10,	1,	35)
----------------- INSERT PHANCONG--------------------

insert into PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) 
values ('008',	30,	2,	5)

insert into PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) 
values ('001',	30,	1,	20)

insert into PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) 
values ('001',	20,	1,	15)

insert into PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) 
values ('006',	20,	1,	30)

insert into PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) 
values ('005',	3,	1,	10)

insert into PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) 
values ('005',	10,	2,	10)

insert into PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) 
values ('005',	20,	1,	10)

insert into PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) 
values ('007',	30,	2,	30)

insert into PHANCONG (MA_NVIEN,MADA,STT,THOIGIAN) 
values ('007',	10,	2,	10)

