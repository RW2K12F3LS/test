create table user_1
	(
  user_id	varChar(10),
  username	VarChar(20),
  password	VarChar(32),
  portrait	VarChar(30),
  school	VarChar(40),
  identity_1	VarChar(30),
  primary key (user_id)
	);

create table post
	(
  post_id	Varchar(15),
  user_id	Varchar(10),
  time	Timestamp,
  title         Varchar(50),
  delete_flag	numeric(1),
  content	Varchar(200),
  forward_from_id	Varchar(15) ,
  primary key (post_id),
  foreign key (user_id) references user_1(user_id),
	);

create table picture
	(
  post_id	Varchar(15),
  picture_id    Varchar(40),
  primary key (picture_id),
  foreign key (post_id) references post(post_id)
	);

create table post_comment
	(
  comment_id	varchar(15),
  content	varchar(200),
  original_id	varchar(15),
  time	Date,
  actor_id	varchar(10),
  delete_flag	numeric(2),
  at_id	Varchar(10),
  primary key (comment_id),
  foreign key (original_id) references post(post_id),
  foreign key (actor_id) references user_1(user_id),
  foreign key (at_id) references user_1(user_id)
	);
  

create table user_relation
	(
  relation_ID	Varchar(15),
  actor_ID	Varchar(10),
  object_ID	Varchar(10),
  primary key (relation_ID),
  foreign key (actor_ID) references user_1(user_id),
  foreign key (object_ID) references user_1(user_id)
	);
  

create table verification
	(
  user_id	Varchar(10),
  code 	Char(6),
  time  TIMESTAMP,
  primary key (user_id, code),
  foreign key (user_id) references user_1(user_id)
	);

