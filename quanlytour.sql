create database quanlytour;

drop database quanlytour;

create table quanlytour.diemden(
id_diemden int not null auto_increment,
tendiemden varchar(50) not null,
mota varchar(255),
giatrungbinh float,
id_thanhpho int not null,
primary key(id_diemden)
);

create table quanlytour.khachhang(
id_khachhang int not null auto_increment,
tenkhachhang varchar(50),
socancuoc varchar(50),
namsinh datetime,
id_thanhpho int not null,
primary key(id_khachhang)
);

create table quanlytour.thanhpho(
id_thanhpho int not null auto_increment,
tenthanhpho varchar(50),
primary key(id_thanhpho)
);

alter table quanlytour.diemden
add foreign key(id_thanhpho)references quanlytour.thanhpho(id_thanhpho);

alter table quanlytour.khachhang
add foreign key(id_thanhpho)references quanlytour.thanhpho(id_thanhpho);

create table quanlytour.tour(
id_tour int not null auto_increment,
loaitour varchar(50),
giadiemden float,
ngaybatdau datetime,
ngayketthuc datetime,
primary key(id_tour)
);

alter table quanlytour.tour
add id_loaitour int;

create table quanlytour.loaitour(
id_loaitour int not null auto_increment,
id_diemden int,
loaitour varchar(50),
primary key(id_loaitour)
);

alter table quanlytour.tour
add foreign key(id_loaitour)references quanlytour.loaitour(id_loaitour);

create table quanlytour.hoadon(
id_hoadon int not null auto_increment,
id_tour int,
id_khachang int,
trangthai varchar(50),
primary key(id_hoadon)
);

alter table quanlytour.hoadon
add foreign key(id_tour)references quanlytour.tour(id_tour);

alter table quanlytour.hoadon
add foreign key(id_khachang)references quanlytour.khachhang(id_khachhang);

insert into quanlytour.thanhpho values(01,'hn');
insert into quanlytour.thanhpho values(02,'hp');
insert into quanlytour.thanhpho values(03,'nt');

insert into quanlytour.diemden values(1,'hanoi','abc',20000,01);
insert into quanlytour.diemden values(2,'haiphong','xyz',25000,02);
insert into quanlytour.diemden values(3,'nhatrang','abv',22000,03);

insert into quanlytour.loaitour values(0001,1,'giare');
insert into quanlytour.loaitour values(0002,2,'giadat');
insert into quanlytour.loaitour values(0003,3,'giare');

insert into quanlytour.tour values(001,'giare',20000,'2020-03-18','2020-03-24',0001);
insert into quanlytour.tour values(002,'giadat',25000,'2020-03-16','2020-03-28',0002);
insert into quanlytour.tour values(003,'giare',20000,'2020-04-01','2020-04-24',0003);

insert into quanlytour.khachhang values(00001,'a','a123','1990-03-18',01);
insert into quanlytour.khachhang values(00002,'b','b123','1990-03-19',02);
insert into quanlytour.khachhang values(00003,'c','c123','1990-03-20',03);

insert into quanlytour.hoadon values(000001,001,0001,'daddad');
insert into quanlytour.hoadon values(000002,002,0002,'dadada');
insert into quanlytour.hoadon values(000003,003,0003,'dadadad');
 
 
 select tenthanhpho,count(tenthanhpho) as 'so luong tour' from quanlytour.tour
    join quanlytour.loaitour on tour.id_loaitour = loaitour.id_loaitour
    join quanlytour.diemden on loaitour.id_diemden = diemden.id_diemden
    join quanlytour.thanhpho on diemden.id_thanhpho= thanhpho.id_thanhpho group by tenthanhpho;
    
select count(ngaybatdau) as'so tour bat dau thang 3' from quanlytour.tour
where (month(ngaybatdau))='3';

select count(ngayketthuc) as'so tour ket thuc thang 4' from quanlytour.tour
where (month(ngayketthuc))='4';







