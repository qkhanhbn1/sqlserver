-------------------bai 1-----------------

--1--
create view SinhVien_HocBong_TPHCM as
select HoSV as 'Họ',TenSV as'Tên', MaKH as [Mã khoa],NoiSinh as [Nơi sinh],HocBong as [Học bổng] from SinhVien
where HocBong >100000 and NoiSinh =N'TP.HCM'
GO
--2--
create view DSSV_AV_T as 
select MaSV,MaKH,Phai from SinhVien
where MaKH in ('AV','TR');
GO
--3--
CREATE VIEW CAU3 AS 
SELECT MaSV,NgaySinh,NoiSinh,HocBong from SinhVien
where NgaySinh between '1986-01-01' and '1992-06-05'
go
--4--
create view cau4 as
select MaSV,NgaySinh,Phai,MaKH from SinhVien
where HocBong >=200000 and HocBong <= 800000
go
--5--
create view cau5 as
select MaMH,TenMH,Sotiet from MonHoc
where Sotiet >40 and Sotiet < 60
go
--6--
create view cau6 as
select MaSV,HoSV,TenSV,Phai from SinhVien
where Phai = 1 and MaKH = 'AV'
go
--7--
create view cau7 as
select HoSV,TenSV,NoiSinh,NgaySinh from SinhVien
where NoiSinh = N'Hà Nội' and NgaySinh > '1990-01-01'
go
--8--
create view cau8 as
select MaSV,HoSV,TenSV,Phai from SinhVien
where Phai = 0 and TenSV like '%N%'
go
--9--
create view cau9 as
select MaSV, HoSV,TenSV,Phai from SinhVien
where Phai =1 and NgaySinh > '1986-5-30'
go
--10
create view cau10 as
select HoSV,TenSV,
[Giới tính] = case 
when Phai = 1 then N'Nam'
when Phai = 0 then N'Nữ'
end
,NgaySinh from SinhVien
go
--11--
create view cau11 as
select MaSV,NoiSinh,MaKH,(YEAR(GETDATE())-YEAR(NgaySinh)) as'Tuổi' from SinhVien
go

--12--
create view cau12 as
select HoSV,TenSV,[Tuổi] = (YEAR(GETDATE())-YEAR(NgaySinh)),TenKH from SinhVien
join Khoa on KHoa.MaKH = SinhVien.MaKH
where (YEAR(GETDATE())-YEAR(NgaySinh)) >=20 and  (YEAR(GETDATE())-YEAR(NgaySinh)) <=30
go
--13--
create view cau13 as
select MaSV,Phai,MaKH,
[Mức học bổng]= case
when HocBong >500000 then N'Hoc bổng cao'
else N'Mức trung bình'
end
from SinhVien 
go
--14--
create view cau14 as
select HoSV,TenSV,[Giới tính] = case 
when Phai = 1 then N'Nam'
when Phai = 0 then N'Nữ'
end,TenKH from SinhVien 
join Khoa on Khoa.MaKH = SinhVien.MaKH
where TenKH =N'Anh Văn'
go
--15--
create view cau15 as
select TenKH,HoSV,TenSV,TenMH,Sotiet,Diem from SinhVien
join Ketqua on Ketqua.MaSV = SinhVien.MaSV
join Khoa on Khoa.MaKH =SinhVien.MaKH
join MonHoc on MonHoc.MaMH = Ketqua.MaMH
where TenKH = N'Tin học'
go
--16--
create view cau16 as
select HoSV,TenSV,MaKH,TenMH,Diem,[Loại] = case
	when Diem > 8 then N'Giỏi'
	when Diem >=6 and Diem <8 then N'Khá'
	when Diem < 6 then N'Trung bình'
	end
	from SinhVien
join Ketqua on Ketqua.MaSV = SinhVien.MaSV
join MonHoc on MonHoc.MaMH = Ketqua.MaMH
go
--17--
create view cau17 as
select Khoa.MaKH,TenKH,[Học bổng cao nhất] = MAX(HocBong) from Khoa
join SinhVien on SinhVien.MaKH = Khoa.MaKH
group by Khoa.MaKH,TenKH
go

--18--
create view cau18 as
select MonHoc.MaMH,TenMH,[Số sinh viên đang học] = COUNT(MaSV) from MonHoc
join Ketqua on Ketqua.MaMH = MonHoc.MaMH
group by MonHoc.MaMH,TenMH
go
--19--
create view cau19 as
select top 1 TenMH,Sotiet,TenSV,Max(Diem) as 'Điểm' from MonHoc
join Ketqua on Ketqua.MaMH = MonHoc.MaMH
join SinhVien on SinhVien.MaSV = Ketqua.MaSV
group by TenMH,Sotiet,TenSV,Diem
ORDER BY Diem DESC;
go
--20
create view cau20 as
select top 1 Khoa.MaKH,TenKH,[Tổng số sinh viên] = COUNT(MaSV) from Khoa
join SinhVien on SinhVien.MaKH = Khoa.MaKH
group by Khoa.MaKH,TenKH
order by COUNT(MaSV) desc
go
--21--
create view cau21 as
select top 1 TenKH,HoSV,TenSV,MAX(HocBong) as 'Hoc bổng' from SinhVien
join Khoa on Khoa.MaKH = SinhVien.MaKH
group by TenKH,HoSV,TenSV
order by MAX(HocBong) desc
go
--22--
create view cau22 as
select top 1 MaSV,HoSV,TenSV,TenKH,MAX(HocBong) as 'Hoc bổng'from SinhVien
join Khoa on Khoa.MaKH = SinhVien.MaKH
where TenKH = N'Tin học'
group by MaSV,HoSV,TenSV,TenKH,HocBong
order by HocBong desc
go
--23--
create view cau23 as
select top 1 HoSV,TenMH,MAX(Diem) as 'Điểm' from SinhVien
join Ketqua on Ketqua.MaSV = SinhVien.MaSV
join MonHoc on MonHoc.MaMH =Ketqua.MaMH
where Ketqua.MaMH = N'01'
group by HoSV,TenMH,Ketqua.Diem
order by Diem desc
go
--24
create view cau24 as
select top 3 HoSV,TenSV,TenKH,TenMH,MAX(Diem) as 'Điểm' from SinhVien
join Khoa on Khoa.MaKH = SinhVien.MaKH
join Ketqua on Ketqua.MaSV = SinhVien.MaSV
join MonHoc on MonHoc.MaMH =Ketqua.MaMH
where Ketqua.MaMH = N'04'
group by HoSV,TenSV,TenKH,TenMH,Ketqua.Diem
order by Diem asc
go
--25
create view cau25 as
select top 1 Khoa.MaKH,TenKH, COUNT(MaSV) as'Số sinh viên nữ' from Khoa
join SinhVien on SinhVien.MaKH = Khoa.MaKH
where Phai = 0
group by Khoa.MaKH,TenKH
order by COUNT(MaSV) desc
go
--26
create view cau26 as
select Khoa.MaKH,TenKH,[Tổng số sinh viên]=COUNT(MaSV),[Tổng số sinh viên nữ]=SUM(case when Phai = 1 then 1 else 0 end) from Khoa
join SinhVien on SinhVien.MaKH = Khoa.MaKH
group by Khoa.MaKH,TenKH
go
--27--
create view cau27 as
select HoSV,TenSV,TenKH,[Kết quả] = case	
when min(Diem) < 4 then N'Đậu'
end
from SinhVien
join Khoa on Khoa.MaKH = SinhVien.MaKH
join Ketqua on Ketqua.MaSV = SinhVien.MaSV
group by HoSV,TenSV,TenKH
go
--28--
create view cau28 as
select HoSV,TenSV,TenKH,Phai from SinhVien
join Khoa on Khoa.MaKH = SinhVien.MaKH
join Ketqua on Ketqua.MaSV = SinhVien.MaSV
group by HoSV,TenSV,TenKH,Phai
having Min(Diem) >= 4
go	
--29--
create view cau29 as
select MonHoc.MaMH,TenMH from MonHoc
join Ketqua on Ketqua.MaMH = MonHoc.MaMH
group by MonHoc.MaMH,TenMH
having Min(Diem) >= 4
go
--30--
create view cau30 as
select Khoa.MaKH,TenKH from Khoa
join SinhVien on SinhVien.MaKH = Khoa.MaKH
join Ketqua on Ketqua.MaSV =SinhVien.MaSV
group by Khoa.MaKH,TenKH
having Min(Diem) >= 5
go

--31--
create view cau31 as
select MonHoc.MaMH,TenMH,
[Số sinh viên đậu]= SUM(case when Diem >=5 then 1 else 0 end),
[Số sinh viên rớt] = SUM(case when Diem < 5 then 1 else 0 end)
	from MonHoc
	join Ketqua on Ketqua.MaMH = MonHoc.MaMH
group by MonHoc.MaMH,TenMH
go
--32--
create view cau32 as
select MonHoc.MaMH,TenMH from MonHoc join Ketqua on Ketqua.MaMH = MonHoc.MaMH
group by MonHoc.MaMH,TenMH
having Min(Diem) >= 5
go

--33--
create view cau33 as
select SinhVien.MaSV,HoSV,TenSV,MaKH from SinhVien
join Ketqua on Ketqua.MaSV = SinhVien.MaSV
group by SinhVien.MaSV,HoSV,TenSV,MaKH
having Min(Diem) >= 5
go
--34--
create view cau34 as
select SinhVien.MaSV,HoSV,TenSV,MaKH from SinhVien
join Ketqua on Ketqua.MaSV = SinhVien.MaSV
GROUP BY SinhVien.MaSV,HoSV,TenSV,MaKH
HAVING SUM(CASE WHEN Diem < 5 THEN 1 ELSE 0 END) > 2;
go
--35--
create view cau35 as
select Khoa.MaKH,TenKH,[Tổng số sinh viên của khoa] = COUNT(MaSV) from Khoa
join SinhVien on SinhVien.MaKH = Khoa.MaKH
group by Khoa.MaKH,TenKH
having COUNT(MaSV) > 10
go
--36--
create view cau36 as
select SinhVien.MaSV,HoSV,TenSV,[Số môn thi] = COUNT(MaMH) from SinhVien
join Ketqua on Ketqua.MaSV = SinhVien.MaSV
group by SinhVien.MaSV,HoSV,TenSV
having COUNT(MaMH) > 4
go
---37
create view cau37 as
select Khoa.MaKH,TenKH,[Tổng số sinh viên nam] =SUM(case when Phai = 0 then 1 else 0 end) from Khoa
join SinhVien on SinhVien.MaKH = Khoa.MaKH
group by Khoa.MaKH,TenKH
having SUM(case when Phai = 0 then 1 else 0 end) > 5
go
--38
create view cau38 as
select HoSV,TenSV,TenKH,Phai,DiemTrungBinh from SinhVien
join Khoa on Khoa.MaKH = SinhVien.MaKH
where DiemTrungBinh >4
go
--39---
create view cau39 as
select MonHoc.MaMH,TenMH,[Trung bình điểm]= AVG(Diem) from MonHoc
join Ketqua on Ketqua.MaMH = MonHoc.MaMH
group by MonHoc.MaMH,TenMH
having  AVG(Diem) > 6
go