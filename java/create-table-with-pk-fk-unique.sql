drop table orders;
create table orders (
	id int not null,
    code char(4) not null unique,
    primary key (id),
    cid int not null,
    foreign key (cid) references customer(id)
		on update restrict on delete restrict
);