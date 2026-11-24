create table event
(
    id_event   int auto_increment
        primary key,
    event_name text                                                          not null,
    start_date datetime                                                      not null,
    end_date   datetime                                                      not null,
    estado     enum ('scheduled', 'ongoing', 'post-production', 'completed') not null
);

create table photo
(
    id_photo int auto_increment
        primary key,
    url      text not null,
    event_id int  null,
    constraint photo_event_id_event_fk
        foreign key (event_id) references event (id_event)
);

create table user
(
    id_user   int auto_increment
        primary key,
    id_google text                 null,
    email     text                 not null,
    name      text                 not null,
    role      enum ('adm', 'user') not null
);

create table notification
(
    id_user  int not null,
    id_event int not null,
    primary key (id_user, id_event),
    constraint notification_event_id_event_fk
        foreign key (id_event) references event (id_event),
    constraint notification_user_id_user_fk
        foreign key (id_user) references user (id_user)
);
