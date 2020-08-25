CREATE DATABASE IF NOT EXISTS laravel_master;

USE laravel_master;

CREATE TABLE users (
id              int(255) auto_increment not null,
role            varchar(20),
name            varchar(100),
surname         varchar(200),
nick            varchar(200),
email           varchar(255),
password        varchar(255),
image           varchar(255),
create_at       datetime,
update_at       datetime,
remember_token  varchar(255),
CONSTRAINT pk_users PRIMARY KEY(id)

)ENGINE=InnoDB;


INSERT INTO users VALUES(NULL, 'user', 'Pipe', 'Raddatz', 'pipe', 'pipe.raddatz@gmail.com', 'password', null, curtime(),curtime(), null);
INSERT INTO users VALUES(NULL, 'user', 'Nico', 'Radd', 'Nico', 'nico.raddatz@gmail.com', 'password', null, curtime(),curtime(), null);
INSERT INTO users VALUES(NULL, 'user', 'martin', 'Raddatz', 'Genio', 'martin.raddatz@gmail.com', 'password', null, curtime(),curtime(), null);





CREATE TABLE IF NOT EXISTS images (
id              int(255) auto_increment not null,
user_id         int(255),
image_path      varchar(255),
description     text,
created_at      datetime,
updated_at      datetime,
CONSTRAINT pk_images PRIMARY KEY(id),
CONSTRAINT fk_images_users FOREIGN KEY(user_id) REFERENCES users(id)
) ENGINE = InnoDB;



INSERT INTO images VALUES(NULL, '1', 'test.png', 'foto 1', curtime(),curtime());
INSERT INTO images VALUES(NULL, '2', 'test2.png', 'foto 2', curtime(),curtime());
INSERT INTO images VALUES(NULL, '3', 'test3.png', 'foto 3', curtime(),curtime());

CREATE TABLE IF NOT EXISTS comments (
id              int(255) auto_increment not null,
user_id         int(255),
image_id        int(255),
content         text,
created_at      datetime,
updated_at      datetime,
CONSTRAINT pk_comments PRIMARY KEY(id),
CONSTRAINT fk_comments_users FOREIGN KEY(user_id) REFERENCES users(id),
CONSTRAINT fk_comments_images FOREIGN KEY(image_id) REFERENCES images(id)
)ENGINE = InnoDB;

INSERT INTO comments VALUES(NULL, 1, 1, 'Comentario 1', curtime(),curtime());
INSERT INTO comments VALUES(NULL, 2, 2, 'Comentario 2', curtime(),curtime());
INSERT INTO comments VALUES(NULL, 3, 3, 'Comentario 3', curtime(),curtime());



CREATE TABLE IF NOT EXISTS likes (
id              int(255) auto_increment not null,
user_id         int(255),
image_id        int(255),
created_at      datetime,
updated_at      datetime,
CONSTRAINT pk_likes PRIMARY KEY(id),
CONSTRAINT fk_likes_users FOREIGN KEY(user_id) REFERENCES users(id),
CONSTRAINT fk_likes_images FOREIGN KEY(image_id) REFERENCES images(id)
)ENGINE = InnoDB;

INSERT INTO likes VALUES(NULL, 1, 1, curtime(),curtime());
INSERT INTO likes VALUES(NULL, 2, 2, curtime(),curtime());
INSERT INTO likes VALUES(NULL, 3, 3, curtime(),curtime());
INSERT INTO likes VALUES(NULL, 2, 3, curtime(),curtime());