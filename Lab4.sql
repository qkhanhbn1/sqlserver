/*1. Cho biết danh sách các môn học,
gồm các thông tin sau: Mã môn học, Tên môn  học, Số tiết.  
*/
Select *From Monhoc
GO
Select MaMH as [Mã môn học], TenMH as [Tên môn học], SoTiet [Số tiết]
FROM MonHoc
GO

/*
2. Liệt kê danh sách sinh viên, gồm các thông tin sau:
Mã sinh viên, Họ sinh viên,  Tên sinh viên, Học bổng.
Danh sách sẽ được sắp xếp theo thứ tự Mã sinh viên  tăng dần.
*/
Select MaSV as 'Mã sinh viên', HoSV as [Họ sinh viên]
    , TenSV as [Tên sinh viên], HocBong [Học bổng]
From SinhVien
Order by MaSV ASC
GO

/*
3. Danh sách các sinh viên, gồm các thông tin sau:
Mã sinh viên, Tên sinh viên,  Phái, Ngày sinh.
Danh sách sẽ được sắp xếp theo thứ tự của tên.  
*/
Select MaSV,TenSV,Phai, NgaySinh
From SinhVien
Order By TenSV ASC

/*
4. Thông tin các sinh viên gồm:
Họ tên sinh viên, Ngày sinh, Học bổng.
Thông tin  sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.
*/
Select  HoSV + ' ' + TenSV as [Họ tên sinh viên]
        , NgaySinh as [Ngày sinh]
        , HocBong as [Học bổng]
From SinhVien
Order By NgaySinh asc, 3 DESC

/*
5. Danh sách các môn học có tên bắt đầu bằng chữ T,  
gồm các thông tin: Mã môn,  Tên môn, Số tiết.  
*/ -- So sánh tương đối
Select MaMH, TenMH, Sotiet
From MonHoc
Where TenMH Like N'T%'
GO
/*
6. Liệt kê danh sách những sinh viên
có chữ cái cuối cùng trong tên là i,
gồm các  thông tin: Họ tên sinh viên, Ngày sinh, Phái  
*/
Select [HoSV],[TenSV],[Phai],[NgaySinh]
From SinhVien
Where TenSV Like N'%i'
GO

/*
7. Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N,
gồm các  thông tin: Mã khoa, Tên khoa.  
*/
Select MaKH, TenKH
From Khoa
Where TenKH Like N'_N%'
GO

/*
8. Liệt kê những sinh viên mà họ có chứa chữ Thị.
*/
Select *
From  SinhVien
Where HoSV like N'%thị%'
GO

/*
9. Cho biết danh sách những sinh viên ký tự đầu tiên của tên nằm trong khoảng
từ a đến m, gồm các thông tin: Mã sinh viên,Họ tên sinh viên,Phái, Học bổng.
*/
Select MaSV, HoSV, TenSV, Phai, HocBong
From SinhVien
Where TenSV like N'[a-m]%'
GO

/*
10. Cho biết danh sách những sinh viên mà tên có chứa ký tự nằm trong khoảng từ
a đến m, gồm các thông tin: Họ tên sinh viên, Ngày sinh, Nơi sinh, Học bổng.
Danh sách được sắp xếp tăng dần theo họ tên sinh viên.
*/
Select MaSV, HoSV+ ' ' + TenSV as [Họ tên sinh viên],NgaySinh, NoiSinh, HocBong
From SinhVien
Where TenSV like N'%[a-m]%'
Order By 2 ASC
GO
/*
11. Cho biết danh sách các sinh viên của khoa Anh văn, gồm các thông tin sau: Mã
sinh viên, Họ tên sinh viên, Ngày sinh, Mã khoa.
*/
Select MaSV, HoSV+ ' ' + TenSV as [Họ tên sinh viên], NgaySinh, MaKH
From SinhVien
Where MaKH = 'AV'

/*
12. Liệt kê danh sách sinh viên của khoa Vật Lý, gồm các thông tin sau: Mã sinh viên,
Họ tên sinh viên, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Ngày sinh
giảm dần.
*/
Select MaSV, HoSV+ ' ' + TenSV as [Họ tên sinh viên]
    ,Convert(Char(10),NgaySinh,103) as [Ngày sinh]
    , MaKH
From SinhVien
Where MaKH = 'TH'
Order By NgaySinh DESC
GO
Select * from Khoa
/*
13. Cho biết danh sách các sinh viên có học bổng lớn hơn 500,000, gồm các thông
tin: Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ được sắp
xếp theo thứ tự Mã khoa giảm dần.
*/
Select MaSV, HoSV, TenSV, MaKH, HocBong
From SinhVien
Where HocBong > 50000
Order By MaKH DESC
GO

/*
14. Liệt kê danh sách sinh viên sinh vào ngày 20/12/1987, gồm các thông tin: Họ
tên sinh viên, Mã khoa, Học bổng.
*/
Select HoSV+ ' ' + TenSV as [Họ tên sinh viên], MaKH, HocBong
        , Convert(Char(10),NgaySinh,103) as [Ngày sinh]
From SinhVien
Where Convert(Char(10),NgaySinh,103) = '20/12/1987'
GO
Select HoSV+ ' ' + TenSV as [Họ tên sinh viên], MaKH, HocBong
        , Convert(Char(10),NgaySinh,103) as [Ngày sinh]
From SinhVien
Where Day(ngaysinh) = 20 and Month(Ngaysinh)=12 and Year(NgaySinh)=1987
GO

/*
15. Cho biết các sinh viên sinh sau ngày 20/12/1977, gồm các thông tin: Họ tên sinh
viên, Ngày sinh, Nơi sinh, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự
ngày sinh giảm dần.
*/
Select HoSV+ ' ' + TenSV as [Họ tên sinh viên], MaKH, HocBong
        , Convert(Char(10),NgaySinh,103) as [Ngày sinh]
From SinhVien
Where Convert(Char(10),NgaySinh,103) > '20/12/1987'
Order by NgaySinh DESC
GO
/*
16. Liệt kê các sinh viên có học bổng lớn hơn 100,000 và sinh ở Tp HCM, gồm các
thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.
*/
Select *
From SinhVien
Where HocBong > 100000 and NoiSinh Like N'%Tp. HCM%'
GO
/*
17. Danh sách các sinh viên của khoa Anh văn và khoa Triết, gồm các thông tin: Mã
sinh viên, Mã khoa, Phái.
*/
Select *
From SinhVien
Where  MaKH = 'AV' Or MaKH = 'TR'
GO
Select *
From SinhVien
Where  MaKH IN ('AV','TR')
GO
--18
select MaSV as'Mã Sinh Viên', NgaySinh as 'Ngày Sinh',NoiSinh as 'Nơi sinh',HocBong as 'Học Bổng' from SinhVien
where NgaySinh between '1986-01-01' and '1992-06-05'
go
--19
select MaSV as'Mã Sinh Viên', NgaySinh as 'Ngày Sinh',Phai as 'Phái',MaKH as'Mã Khoa' from SinhVien
where HocBong between 200000 and 800000 ;
go
--20
select MaMH as'Mã Môn học',TenMH as 'Tên MH',Sotiet as 'Số tiết' from MonHoc
where Sotiet > 40 and Sotiet < 60
go
--21
select MaSV as 'Mã SV',HoSV as 'Họ',TenSV as 'Tên',Phai as 'Phái' from SinhVien 
where Phai = 'False' and MaKH ='AV'
go
--22
select HoSV,TenSV,NoiSinh,NgaySinh from SinhVien
where NoiSinh like '%Hà%' and NgaySinh >'1990-01-01'
go
--23
select *from SinhVien
where Phai =1 and TenSV like '%n%'
go
--24
select * from SinhVien
where Phai = 0 and MaKH ='TH' and NgaySinh >'1990-01-01'
go
--25
select HoSV as 'Họ' ,TenSV as 'Tên',
[Giới Tính] = case
when Phai =1 then N'Nữ'
when Phai =0 then N'Nam'
end
,NgaySinh as 'Ngày Sinh' from SinhVien
go
--26
select MaSV,[Tuổi]=YEAR(GETDATE())-YEAR(NgaySinh),NoiSinh,TenKH as 'Tên Khoa' from SinhVien join Khoa on Khoa.MaKH =SinhVien.MaKH
go
--27
select HoSV as 'Họ',TenSV as 'Tên',[Tuổi]=YEAR(GETDATE())-YEAR(NgaySinh), HocBong as 'Học Bổng' from SinhVien 
where YEAR(GETDATE())-YEAR(NgaySinh) > 20 
go
--28
select HoSV as 'Họ', TenSV as 'Tên',[Tuổi]=YEAR(GETDATE())-YEAR(NgaySinh),TenKH as 'Tên Khoa' from SinhVien join Khoa on Khoa.MaKH =SinhVien.MaKH
where YEAR(GETDATE())-YEAR(NgaySinh) between 20 and 30
go

---------------------p2--------------------------


--1--
select HoSV as 'Họ',TenSV as 'Tên',
	[Giới tính] = case 
	when Phai = 1 then N'Nữ'
	when Phai = 0 then N'Nam'
		end
,[Tuổi]=YEAR(GETDATE())-YEAR(NgaySinh) from SinhVien
order by YEAR(GETDATE())-YEAR(NgaySinh) desc
go
--2
select HoSV as 'Họ',TenSV as 'Tên',Phai as 'Phái',DAY(NgaySinh) as 'Ngày Sinh' from SinhVien
where MONTH(NgaySinh) =2 and YEAR(NgaySinh)=1994
go
--3
select * from SinhVien
order by NgaySinh desc
go
--4
select MaSV as 'Mã sinh viên',Phai as 'Phái',MaKH as 'Mã Khoa',
[Mức học bổng]= case 
	when HocBong >500000 then N'Học bổng cao'
	else N'Mức trung bình'
	end
from SinhVien
go
--5
select HoSV as 'Họ',TenSV as 'Tên',MaMH as 'Mã môn học',Diem as 'Điểm' from Ketqua join SinhVien on SinhVien.MaSV = Ketqua.MaSV
order by HoSV,TenSV,MaMH asc
go
--6
select HoSV as 'Họ',TenSV as 'Tên',
[Giới Tính] = case
	when Phai =1 then N'Nữ'
	when Phai =0 then N'Nam'
		end
,TenKH as 'Tên Khoa' from SinhVien join Khoa on Khoa.MaKH = SinhVien.MaKH
where Khoa.MaKH ='AV'
go
--7--
select TenKH as 'Tên khoa',HoSV as 'Họ',TenSV as 'Tên',TenMH as 'Tên môn học',Sotiet as 'Số tiết',Diem as 'Điểm' from SinhVien 
join Ketqua on Ketqua.MaSV = SinhVien.MaSV join MonHoc on MonHoc.MaMH = Ketqua.MaMH join Khoa on Khoa.MaKH = SinhVien.MaKH
where Khoa.MaKH = 'TH'
go
--8
select HoSV as 'Họ',TenSV as 'Tên',TenMH as 'Tên môn học',Diem as 'Điểm',
	[Loại] = case 
		when Diem >8 then N'Giỏi'
		when Diem between 6 and 8 then N'Khá'
		when Diem < 6 then N'Trung bình'
			end
from SinhVien join Ketqua on Ketqua.MaSV = SinhVien.MaSV 
join MonHoc on MonHoc.MaMH = Ketqua.MaMH
go

---------------p3-----------------------

--1--
select MonHoc.MaMH as 'Mã môn học',TenMH as'Tên môn học',AVG(Diem) as 'Trung bình điểm thi' from SinhVien
join Ketqua on Ketqua.MaSV = SinhVien.MaSV join MonHoc on MonHoc.MaMH = Ketqua.MaMH
group by MonHoc.MaMH,TenMH,Diem
go
--2
select HoSV as 'Họ',TenSV as 'Tên',TenKH as 'Tên khoa',[Tổng môn thi] =COUNT(Ketqua.MaMH) from SinhVien
join Ketqua on Ketqua.MaSV = SinhVien.MaSV join MonHoc on MonHoc.MaMH = Ketqua.MaMH
join Khoa on Khoa.MaKH = SinhVien.MaKH
group by HoSV,TenSV,TenKH 
go
--3
select TenSV as 'Tên',TenKH as 'Tên khoa',[Giới Tính] = case
	when Phai =1 then N'Nữ'
	when Phai =0 then N'Nam'
		end,[Tổng điểm thi] = SUM(Ketqua.Diem) from SinhVien
join Khoa on Khoa.MaKH = SinhVien.MaKH
join Ketqua on Ketqua.MaSV = SinhVien.MaSV
group by TenSV, TenKH,Phai
go
--4
select TenKH as 'Tên khoa' ,[Tổng số sinh viên] = COUNT(MaSV) from Khoa
join SinhVien on SinhVien.MaKH = Khoa.MaKH 
group by TenKH
go
--5--
select HoSV as 'Họ',TenSV as 'Tên',[Điểm cao nhất] = MAX(Diem) from SinhVien
join Ketqua on Ketqua.MaSV = SinhVien.MaSV
group by HoSV,TenSV
go
--6--
select TenMH as 'Tên môn học', Sotiet from MonHoc
WHERE Sotiet = (SELECT MAX(Sotiet) FROM MonHoc);
go
--7--
select Khoa.MaKH,TenKh,MAX(HocBong) as 'Học bổng cao nhất' from SinhVien join Khoa on Khoa.MaKH = SinhVien.MaKH
group by Khoa.MaKH,TenKH
go
--8--
select TenMH as 'Tên môn học',[Điểm cao nhất]=MAX(Diem) from MonHoc
join Ketqua on MonHoc.MaMH = Ketqua.MaMH
group by TenMH
go
--9--
select MonHoc.MaMH as 'Mã môn học',TenMH as 'Tên môn học',[Số sinh viên đang học]=COUNT(SinhVien.MaSV) from SinhVien
join Ketqua on Ketqua.MaSV = SinhVien.MaSV join MonHoc on MonHoc.MaMH = Ketqua.MaMH
group by MonHoc.MaMH,TenMH
go
--10--
select top 1 TenMH as 'Tên môn',Sotiet as 'Số tiết',TenSV as 'Tên sinh viên',Diem as 'Điểm' from MonHoc
join Ketqua on Ketqua.MaMH = MonHoc.MaMH
join SinhVien on SinhVien.MaSV = Ketqua.MaSV
order by Diem desc
go
--11--
select top 1 Khoa.MaKH as 'Mã khoa',TenKH as 'Tên khoa',[Tổng số sinh viên]=COUNT(SinhVien.MaSV) from Khoa
join SinhVien on SinhVien.MaKH = Khoa.MaKH
group by Khoa.MaKH,TenKH
go
--12
select top 1 TenKH as 'Tên khoa',HoSV as 'Họ',TenSV as 'Tên',HocBong from SinhVien
join Khoa on Khoa.MaKH = SinhVien.MaKH
order by HocBong desc
go
--13
select top 1 MaSV as 'Mã sinh viên',HoSV as 'Họ',TenSV as 'Tên',TenKH as 'Tên khoa',HocBong as ' Học bổng' from SinhVien
join Khoa on Khoa.MaKH = SinhVien.MaKH
where TenKH like '%Tin%' 
order by HocBong desc
go
--14
select top 1 HoSV as 'Họ',TenSV as 'Tên',TenMH as 'Tên môn',Diem as 'Điểm' from SinhVien
join Ketqua on Ketqua.MaSV = SinhVien.MaSV join MonHoc on MonHoc.MaMH = Ketqua.MaMH
where TenMH like N'%sở%'
order by Diem desc
go
--15
select top 3 HoSV as 'Họ',TenSV as 'Tên',TenMH as 'Tên môn',TenKH as 'Tên khoa',Diem as 'Điểm' from SinhVien
join Ketqua on Ketqua.MaSV = SinhVien.MaSV join MonHoc on MonHoc.MaMH = Ketqua.MaMH join Khoa on Khoa.MaKH = SinhVien.MaKH
where TenMH like N'%đồ%'
order by Diem asc
go
--16
select top 1 Khoa.MaKH as 'Mã khoa',TenKH as 'Tên khoa' ,'Số lượng nữ'=COUNT(SinhVien.MaSV) from Khoa
join SinhVien on SinhVien.MaKH = Khoa.MaKH
where Phai = 1
group by Khoa.MaKH,TenKH 
go
--17
select Khoa.MaKH as 'Mã khoa',TenKH as 'Tên khoa' , 'Tổng số sinh viên'=COUNT(SinhVien.MaSV) ,
'Tổng số sinh viên nữ'=SUM(CASE WHEN SinhVien.Phai = 1 then 1 ELSE 0 END) from Khoa
join SinhVien on SinhVien.MaKH = Khoa.MaKH
group by Khoa.MaKH,TenKH 
go
--18
select HoSV as 'Họ',TenSV as 'Tên', TenKH as'Tên khoa',[Kết quả] = case
		when Diem >=4 then N'Đậu'
			end
			from SinhVien join Khoa on Khoa.MaKH = SinhVien.MaKH
			join Ketqua on Ketqua.MaSV = SinhVien.MaSV
group by HoSV,TenSV,TenKH,Diem
go

