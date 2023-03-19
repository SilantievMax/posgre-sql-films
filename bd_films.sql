-- CREATE DATABASE films;

DROP TABLE IF EXISTS genre, audience, person, personduplicated, film_person, film, film_genre, film_audience;

CREATE TABLE genre
(
	id serial PRIMARY KEY,
	title text NOT NULL
);

CREATE TABLE audience 
(
	id serial PRIMARY KEY,
	date_ text NOT NULL,
    country text NOT NULL,
    number_people bigint
);

CREATE TABLE person
(
	id serial PRIMARY KEY,
	fullname text NOT NULL,
    role_user text,
    url_img text
);

CREATE TABLE personduplicated
(
	id serial PRIMARY KEY,
	fullname text NOT NULL,
    role_user text,
    url_img text
);

CREATE TABLE film_person
(
	person_id integer REFERENCES person(id),
	personduplicated_id integer REFERENCES personduplicated(id),
	CONSTRAINT film_person_pk PRIMARY KEY (person_id, personduplicated_id)
);

CREATE TABLE film
(
	id serial PRIMARY KEY,
    title text NOT NULL,
    url_img text NOT NULL,
    description text,
    estimation text,
    year_production text NOT NULL,
    country text NOT NULL,
    slogan text NOT NULL,
    age text NOT NULL,
    budget int NOT NULL,
    genre_id integer REFERENCES person(id),
    audience_id integer REFERENCES person(id),
    mounting_id integer REFERENCES person(id) NOT NULL,
    director_id integer REFERENCES person(id) NOT NULL,
    composer_id integer REFERENCES person(id) NOT NULL,
    operator_id integer REFERENCES person(id) NOT NULL,
    producer_id integer REFERENCES person(id) NOT NULL,
    scenario_id integer REFERENCES person(id) NOT NULL
);

CREATE TABLE film_genre
(
	film_id integer REFERENCES film(id),
	genre_id integer REFERENCES genre(id),
	CONSTRAINT film_genre_pk PRIMARY KEY (film_id, genre_id)
);

CREATE TABLE film_audience 
(
	film_id integer REFERENCES film(id),
	audience_id integer REFERENCES audience(id),
	CONSTRAINT film_audience_pk PRIMARY KEY (film_id, audience_id)
);

INSERT INTO genre (title) VALUES
('Аниме'), ('Биографии'), ('Боевики'), ('Вестерны'), 
('Военные'), ('Детские'), ('Драмы'), ('Игры'), 
('Исторические'), ('Комедии'), ('Концерты'), ('Короткометражки'), 
('Криминал'), ('Мелодрамы'), ('Музыкальные'), ('Мультфильмы'), 
('Мюзиклы'), ('Новости'), ('Приключения'), ('Реальное ТВ'), 
('Семейные'), ('Спортивные'), ('Ток -шоу'), ('Триллеры'), 
('Ужасы'), ('Фантастика'), ('Фильмы - нуар'), ('Фэнтези'), 
('Церемонии');


INSERT INTO audience (date_, country, number_people) VALUES
('6 декабря 1999', 'США', NULL), 
('8 декабря 1999', 'США', NULL), 
('10 декабря 1999', 'Канада', NULL), 
('10 декабря 1999', 'Мексика', NULL), 
('10 декабря 1999', 'США', 26000000), 
('10 февраля 2000', 'Австралия', NULL), 
('10 февраля 2000', 'Германия', 2107877), 
('10 февраля 2000', 'Перу', NULL), 
('11 февраля 2000', 'Греция', 182000),
('11 февраля 2000', 'Норвегия', 110510), 
('11 февраля 2000', 'Финляндия', 32953), 
('11 февраля 2000', 'Швеция', 132085), 
('17 февраля 2000', 'Швейцария', NULL), 
('18 февраля 2000', 'Израиль', NULL), 
('18 февраля 2000', 'Испания', 692551), 
('24 февраля 2000', 'Израиль', NULL), 
('25 февраля 2000', 'Дания', 129224), 
('1 марта 2000', 'Бельгия', 313321), 
('1 марта 2000', 'Франция', 1714080), 
('2 марта 2000', 'Аргентина', NULL), 
('3 марта 2000', 'Бразилия', NULL), 
('3 марта 2000', 'Ирландия', NULL), 
('3 марта 2000', 'Исландия', 15281), 
('4 марта 2000', 'Корея Южная,', NULL), 
('9 марта 2000', 'Гонконг', NULL), 
('9 марта 2000', 'Малайзия', NULL), 
('9 марта 2000', 'Нидерланды', 241317), 
('10 марта 2000', 'Бразилия', NULL), 
('10 марта 2000', 'Италия', 1742730), 
('11 марта 2000', 'Тайвань', NULL), 
('15 марта 2000', 'Венесуэла', NULL), 
('15 марта 2000', 'Филиппины', NULL), 
('16 марта 2000', 'Индия', NULL),
('16 марта 2000', 'Новая Зеландия,', NULL ), 
('16 марта 2000', 'Сингапур', NULL), 
('16 марта 2000', 'Словакия', NULL), 
('16 марта 2000', 'Чехия', 75548), 
('17 марта 2000', 'Турция', 333784), 
('23 марта 2000', 'Хорватия', NULL), 
('24 марта 2000', 'Польша', 113926), 
('25 марта 2000', 'Япония', NULL), 
('31 марта 2000', 'Португалия', NULL), 
('12 апреля 2000', 'Филиппины', NULL), 
('18 апреля 2000', 'Россия', NULL), 
('26 апреля 2000', 'Кувейт', NULL), 
('27 апреля 2000', 'Венгрия', 96478), 
('20 октября 2000', 'Эстония', 8994), 
('10 ноября 2000', 'Литва', NULL), 
('27 апреля 2001', 'Румыния', 340), 
('31 мая 2001', 'Словения', NULL), 
('7 августа 2007', 'ОАЭ', NULL), 
('7 октября 2016', 'Индонезия', NULL), 
('31 декабря 2019', 'Индия', NULL);


INSERT INTO person (fullname, role_user) VALUES
('Фрэнк Дарабонт', NULL),
('Тоm Хэнкс', 'Paul Edgecomb, $ 20 000 000'),
('Дэвид Морс', 'Brutus «Brutal» Howell'),
('Бонни Хант', 'Jan Edgecomb'),
('Майкл Кларк Дункан', 'John Coffey'),
('Джеймс Кромуэлл', 'Warden Hal Moores'),
('Майкл Джитер', 'Eduard Delacroix'),
('Грэм Грин', 'Arlen Bitterbuck'),
('Даг Хатчисон', 'Percy Wetmore'),
('Сэм Рокуэлл', '«Wild Bill» Wharton'),
('Барри Пеппер', 'Dean Stanton'),
('Джеффри ДеМанн', 'Harry Terwilliger'),
('Патриша Кларксон', 'Melinda Moores'),
('Гарри Дин Стэнтон', 'Toot-Toot'),
('Даббс Грир', 'Old Paul Edgecomb'),
('Ив Брент', 'Elaine Connelly'),
('Уильям Сэдлер', 'Klaus Detterick'),
('Мак Майлз', 'Orderly Hector'),
('Рай Таско', 'Man in Nursing Home'),
('Эдри Уорнер', 'Lady in Nursing Home'),
('Паула Малкомсон', 'Marjorie Detterick'),
('Кристофер Джоэль Айвз', 'Howie Detterick'),
('Эванн Драклер', 'Kathe Detterick'),
('Бэйли Драклер', 'Cora Detterick'),
('Брайан Либби', 'Sheriff McGee'),
('Брент Бриско', 'Bill Dodge'),
('Билл МакКинни', 'Jack Van Hay'),
('Гэри Синиз', 'Burt Hammersmith'),
('Рэйчел Сингер', 'Cynthia Hammersmith'),
('Скотти Левенуорф', 'Hammersmith''s Son'),
('Кэтлин Левенуорф', 'Hammersmith''s Daughter'),
('Билл Грэттон', 'Earl the Plumber'),
('Ди Крокстон', 'Woman at Del''s Execution'),
('Ребекка Клингер', 'Wife at Del''s Execution'),
('Гари Имхофф', 'Husband at Del''s Execution'),
('Ван Эпперсон', 'Police Officer'),
('Дэвид Э. Браунинг', 'Reverend at Funeral'),
('Фред Астер', 'actor in ''Top Hat'', хроника, в титрах не указан'),
('Томми Барнс', 'Tower Guard, в титрах не указан'),
('Билл Крэддок', 'Inmate, в титрах не указан'),
('Кристофер Гринвуд', 'Prison Guard, в титрах не указан'),
('Уэс Холл', 'Prisoner, в титрах не указан'),
('Дэниэл Д. Харрис', 'Prison Minister, в титрах не указан'),
('Фил Хоун', 'Police Photographer, в титрах не указан'),
('Джуди Херрера', 'Bitterbuck''s Daughter, в титрах не указана'),
('Тед Холлис', 'Coffee Execution Witness, в титрах не указан'),
('Дон Лэнгли', 'Posse Member, в титрах не указан'),
('Роберт Мэлоун', 'Tower Guard, в титрах не указан'),
('Арнольд Монти', 'Prison Guard, в титрах не указан'),
('Джинджер Роджерс', 'Actress in ''Top Hat'', хроника, в титрах не указана'),
('Гарт Шоу', 'Inmate, в титрах не указан'),
('Тим Смит', 'Member of the Posse, в титрах не указан'),
('Той Спирс', 'Banker Posse Member, в титрах не указан'),
('Джаред Стовэлл', 'Inmate, в титрах не указан'),
('Дора Тейт', 'Mourner, в титрах не указан'),
('Сэмюэл Тейт', 'Mourner, в титрах не указан'),
('Тодд Томпсон', 'Prison Guard, в титрах не указан'),
('Джеймс Маршалл Волчок', 'Prison Guard, в титрах не указан'),
('Фрэнк Дарабонт', 'продюсер'),
('Дэвид Валдес', 'продюсер'),
('Леонид Белозорович', NULL);

INSERT INTO personduplicated (fullname, role_user) VALUES
('Всеволод Кузнецов', 'Paul Edgecomb'),
('Владимир Антоник', 'Brutus «Brutal» Howell'),
('Любовь Германова', 'Jan Edgecomb'),
('Валентин Голубенко', 'John Coffey'),
('Александр Белявский', 'Warden Hal Moores'),
('Дмитрий Полонский', 'Eduard Delacroix'),
('Александр Коврижных', 'Arlen Bitterbuck'),
('Борис Шувалов', 'Percy Wetmore'),
('Андрей Градов', '«Wild Bill» Wharton'),
('Олег Вирозуб', 'Dean Stanton'),
('Юрий Маляров', 'Harry Terwilliger'),
('Лариса Некипелова', 'Melinda Moores'),
('Борис Токарев', 'Toot-Toot'),
('Всеволод Абдулов', 'Old Paul Edgecomb'),
('Александр Груздев', 'Sheriff McGee'),
('Андрей Ярославцев', 'Jack Van Hay'),
('Валерий Сторожик', 'Burt Hammersmith'),
('Александр Рыжков', 'Police Officer'),
('Фрэнк Дарабонт', NULL),
('Стивен Кинг', 'роман'),
('Дэвид Тэттерсолл', NULL),
('Композитор', NULL),
('Томас Ньюман', NULL),
('Теренс Марш', 'постановщик'),
('Уильям Крус', NULL),
('Керин Вагнер', 'по костюмам'),
('Майкл Сейртон', 'по декорациям'),
('Ричард Фрэнсис-Брюс', NULL);

INSERT INTO film (title, url_img, description, estimation, year_production, country, slogan, 
				  age, budget, genre_id, audience_id, mounting_id, director_id, composer_id, 
				  operator_id, producer_id, scenario_id) VALUES
('Зеленая миля',
 'https://kinopoisk-ru.clstorage.net/H1hG64120/76d6374g7/1d-oDKKFwvfnNoupTeJ7kyl_-DQy8fPzP3OpYAAZb-gLQD8tgxWHk3GOSSoa4C6eUiPpXE9Shg4Z8e6oDL_0ZuTXqR33-YaKikPz2HHvAtpkW5FZarWC0mZj3S11dBNUy-D3iEuNezPxP8wzE9hz8z966E0yI5YucbDbYZD2lZtx03TgdlWXH5d2Ls2JYtfb-ZLETLakj0sPSqFEiCWLuL-Ms2RroW-LxaM8I28R09OT0rAZmlvWj3XEg5nRrgnPFT_kEJ75O9MTAl4VebpbK2F2lCwKZBeLL5IJKDCx32yvPOugU22jp9GPpGtv5ecP-ypsab5vuj_1SNMZ9UpdOwmrEHg6aYun5xJqTQWC3zPZEvg0PuD_05sClYBkRU8Y3-hTiPv1e0epKzRLY50LV49WhEGWk2a_3Sibqc3m5VvxizzMktXPkzMSBtlhov8TLfrcrGqQE9M7OkWYnIV7zAe4_8CPPZOHcadASws5w5cX1vQVmrvqP8X8ownJ5lUv_eco0L7dp-OXuhKpPcpXrwUiHEzObGPXN_KVjGQln_gjvHuYJ307T8nTpIuf1UePk5qUTa6fzodF6DdRMaKJH_23hARqZYuLH-JWlfWiW6v9vlAURnTLaz9GORRowcd4P7QjlOMdqyNlPzCnizFHZ1umWF1qo9IPdWQbhYU-vSc1v2z4OuVD44eSYkmZQovDCYoMNAq4B3uD7jGcPKlrzCuEW1yriQ9f3Tus_xMp3-_bfhCJloM60y1ky8WlarFPMZPgWP4ROw-zEu7VESJPr2GCICTilKvLd4YJZGwtn7wPyFcgk4UDc0GPyPsb7VcPg3bA0R6X7uvtMOu1OT5hvx3HSADi-atf4wpara0C9-ORSpAAtiyT38uyTYzgBUvsB9ir2G-1a6tRv2B_y9UT61fGXF2qV05X3bRvCbHKXbc5E2DsilFra7dOliGJQqsr4ZqohII4Ywc_LjHcQImfFHPYS9CrUauTNYvgI0uZx2-LDszB2t8CX928C5W9Mv0P6c-4gLKlr6dvKpYZzYbjB2VCbCD2cIvDB8J9JMSNc7TfgOMEAxU3XzV7bGcLFdNrW44UvRpXUh8NvJ9VZSIZU3VbMLQ-SZsXn0KCUT1S51eVdgiAqngDL7-SdYS8lZc0j1x3OIM5_1utI-grXx0rhzMKTL0iO34PbSjDWc3u1asRnyBYBpXn43M6VvGFrmsnsQIc3Pb84_NDniHUeLlrTIeEO9DfvYMfydPMWwdFT_u3IpyxKmPys_lYx71FNunPgYsEBLrRB3Pn6oZR5db7z-3GSFA6HMdT--pNiOy57zQjvCcQuyFTm9m7KOMrvSOPF86ICYrPYkN1bB9d_eI5b00jvNDydQend-rmwWkO90_5rqSUMhiDs-cmSVBwBZcgH9hToL_hL8e9SzTne60vFx-CwDHeA7qPcVBvObVGnUeFmyiYTqU720e2fi3l9ovLtf6U3BK00-dzblmEOB0zYPM0I9QfvR87DdsQ9_MRL-uXShiBypfCD1EwqxGxTmG_yVe0YE6Bs6uT9gItIWJ_m3F6cACS7Pu_n0IN8AzF45CjICcQ01G7p72TnDOHIf9Xu9ZkCUIL7mcp8LepQRa9XwU_yJj-DU-riwbuIZVWE8uttkS0xiQrY39-0UCoNffIU1SjJHMpV6cFe9R7j6kr-6fitLGeP3JXHVTnjS3ujQ9hjyiM6l0z52-Snq3lovPXBYokIEaUH6vvyplE5I1_zJt0G6D3JSOvOUfg1xeNb2-P7gDZWlMGNyHwt6WhspmjRW8Q0MYZX6ffdubBEb6H2xG2RDhicNu3S4pNqAT1h-SrWOcQKx17p90jpEd3LWNzp9pYka5D6udVoJOhVdI9j5nTqPBuec9nZ7qCiYEmB0e5hlRMHigX16eqffxMqQtAk0S3FNNtczutCywzy2EjYwPKQJGuX0IfqaynOb3GEZvJU-CcFmXfX-9Oph2FNhNjtT7wsDJsG6evSl1oPEVniDNcY4hXKTv_JcPsIysNf-Oj0nhNJm9SqyHIP0W5zlUj4UfgOO7tF2fXjvI5ec5fExmu8NgqbCdzg-ol3KiFVxwvhE-Ycy2b0_EjJNPTAVMbE6JwbaIzDh_l6C-JMbq9L7G7KLTG4TtD7_qmATH6hyNhyojYmpSre3-aoRCIxWcIqyw3nAchY0e1P1ynywnHh3_6MCUev4LHcayXjf1SEYs1G_jgzomv60cSapWRQnePXTbkoL4Q2z8POkHIGLWfLANoe1SzlZ9HuXMw_1NdZ2cLbjDZKm_SS3HEpxUhVmW7STcIRB6NH5dHlsrNfXrTu6Uq7GwuhO_zy2IZiCBlk-x_IOcYJzmDQ3UjNOuLlYNvXx6Q5cqbPmdR7M8ZXfJdqzXTnAy21buTTzp-CZnixzttPuBkmijH63NuxdwQHZvgvyxfoKfVmz8pkyS_R93TBxdWtDFGq47H8ey7XbWeOTtlb5TIbpXPC3eSJjHJMnczCYIgNP4o92cL9qlY4GEHTKP8K4QXua_PTTO444sZq_evgpSJVhuKm1EwH1Wl4mGTSbvM2JrpC6tjep4hnf6L19XSIGS6QHujp_7B1IipS7yvIJfg79kbH4lPlMsvAVube6p8qb4nhtfxVOvNCUIBU8nH9EAK4csL936KDX1ia-cBilgAgkRTf7t-AURE4ecc53R70JMN70e1e9RHH5Vfi7NeaImWnx7TfZhblS0qbVfl7-SYdqWf718WHq2BhidfrdZ0GDI4ayOzkjFgmIFbYFdsqwyXjaePITdQj18Jnw-T-jChPktOj4V068mFSn0DjTN8aLaJg1MfAg4p4Xb3a6F2-EAOGGP_MxqRkAT9hxSPvJOgo30jmyUjLEdDkY9jv_IUxbLTztvdLDshoVKh322vzOgW-RsrS_4iibVi66fVlkQgsgzH9wPuJdAo8Vsc5zCr4JO1t6c1Ezjjk4FrEzdu4MlOJ3rLKfwI',
 'В тюрьме для смертников появляется заключенный с божественным даром. Мистическая драма по роману Стивена Кинга',
 '9.1',
 '1999',
 'США',
 'Пол Эджкомб не верил в чудеса. Пока не столкнулся с одним из них',
 '16+',
 60000000,
 NULL,
 NULL,
 29,
 1,
 24,
 22,
 1,
 1
),
('Побег из Шоушенка',
 'https://kinopoisk-ru.clstorage.net/lG152e232/363b6cz5Ei9/xEY9u9PwpGVDtkjk0T-e9cp43pqN2_jkrW4-qiINoYy6lCHrcQWwmuWEoPKCOhtxH2f-hz-XLbTVWYc7oOJbrUWXKOwXd7ExVDPapRMrXzNML0mfywntdaoq6fz1xm2Gth59Yv7PuJH91TBhB-zNpI93_dCu1WqwBIUJ_-M2wTxChnGzEmKhro8viKrWdtPyEvJbk91Y_-SwrXYp58EsyP9ceWxxzDQa8xl3b15nDiXPcDvf4tI7MgQKgi2htMCxBIp3-dMnJiyBYESin_SU9tzx3tPTk_3kMiy3oGqI4op_H_EtNwwxmrDdvK_f6IerwDt9GehZszgMygekYHxINMaKu_LcLyttD-xEpF5_1H8Y9hwfHlx9qvMlvqjsTCBDP5x3rTaJsJo12Leh1qQK7Ihy_V7i1jR8yIsKq6ByCTYFTjk9nq6l6g0ti-KRvhR60PVdm9BWMWSzL_hv4QyvxDySfC2yDrpa_RI9KVXgh2FBdvMYJ5S4uAVJh-ep_Az2BgE3M96go-HL68ju1nQS_pxxEZpYmz0q_SB4amVIo0p4EvctMMa7mDOZ_WGRa0Jjxvi90ylV_34FDMppozIE9EVDub2S5-4pguRHrFm33rkbcdyelZE1LLfu-e0oyS9CdFR0KzoLuNK8m7VokeKKpE4-uh8gWrC8D4iM5em9irEIgrW7G6jrJA5sgmzUO96-VbOdVl0fvOl1JrBl4souzLpSN-j4h3Las5o8opAijmIB8nNYK5m3sExABm1mPcXxjcU7eR0v6q4BIIdnHPyXM1f305KWmzHrtuWybGXLKYDzljiiMc653f0d8OjfrEPiDDByFqxcfHhLTIqj6HJKswcGtLyepSenAqiPahawHT9VvV2VVF-75HXmt6RhiezAdhT-rbqIuJbw0TisXeUBpgmwPRAiXXI1iEnL5aI6THYOijT8EiUtqg5oQuWZOtr3UjuaWdfY-KP_of0qp0sjDDWfd-FxRjRTOtN3YR-ojutIufLfIl19uIMIh63qNw11BoOw9BkqLKWELQqumnbR8xB_0dUSEnStfW_3IOEFa8ez2jJqf0x_EX4Ve-AcKkWuhfA326AS-j0Lh8sqqbaB9QqDfjcWIKYsgiNL71S7VbCROt6UXVixbT0p9SThj-5D9p55oLMGvZs6nfEnFuVNLs56_Rsgk3l4T0fMb2R_QfgBBv0xES-q7YrnRCLaf5p5kXZSGtRS--EzqDwvKEVkCLrUNCl_zDnbOBVwKllkwy6OMLvf4Vs9tQEIjyQofQrxwEN-9FVnL2AK5UKo07Qd-xl6Hx4dUnls8mw-bWzEr4L-nTkqsEz3W_qSticVrE1tATq4lyQZ_D-HwI6k4_QLdcUJvLed5StvQymC7pY91H9Q_lRdFB_y47rhsKMjRGvKu1P4YLmIuhKw0r0h0OcCLUg_cFpiW3D9SQRNqmX_wXHOwvB82m_nYcNnxWHYdx02GnMWE5McsWy_aX-j44qvw3PcMSO7Q3ubMNX-rhply20BsLRb41O0tshLRO3jNox9SM79s1JvpKEFKcigmnNXMRK9UtcamrQpM638r-mEKAT4Fzvl-Mz1UjqaPula4IOhRT43H-ZR_XqLAECjJLsOugoLvjxVqerhyuVP5hnzlfdVOpsaGBqxYXroMGQlAymCP9W0q_GJ-ll33bygV6iG6s82OtYmnvC-CYoFo-T5Af3OCTE7lmWmLYVmhK0XOlW4G7BXVFARtW_0b_VkZEVgQ76V-6uwSX1Sdpw271zoha5GdXuRb525uIJEjG0ods1zgU62PtXqbiJF68Ypm_SWtlJ6kdKT3_JlcqX46WWLIcK-3TItcwEyF3caMW6dZEGnhHj7F2pS97-Lh49pY_WNfQAPNHYUJ27oQ-aD6Nj9FT4aPtMXXJP1ZXQqdahiCioDvt2zpT5Mt9WwFr7oVS5KbMw6-lSh0_LxA8vPauY6zvzBD30yH-gsLgtvh-xZflI6UTMaktqZfWe4LXng6UsnhHzcsSn2BjzQOtU_aRIgDy6JMrCZKRn1v0wGTC5jfUk9Ao44dd5lqy9FoMep03CZOlg7ltneVrDvPqF8qOxKIsK_UzFgMMb73vDe8KCQ4g6mz_59VGLcf7lKyo-r5jZIdk0HODsTZmPliSRMaRj_lLLSsR-fElbzI3yquO2lSuFFPxc0KbkFd957kvjvFaWPL81xd1TsWzBywUmE6aP8AnmNQHk51K9naktpgOVW-1z-UTraEhdTMic_ZfqgaofkTjPY9qQwjrSbf5V-Kl5vCeZJPXZcqRV_tULEwGGiNoEzjc82u5WhJmBEII3o2jDS-B1xlFtf2nqjNmV3ouIJ40hzlH5nsAcymDOZcWGZI8bjxnd4VyyR-LGACotp7XdCdApK-Xse7-puSW9KZp7_23_fd1KdnZY_IrbpMekpguPC9tc4q_PFc5v8FnloXOVMJMlzNtPplrWwywkPIm19jfGNiD0-0mou4UPvhacYsBx_WnXaXp1Xdaf-qfpgqkcuyHTdv2D4xjuXdBC-LpcojmoC9rJU4984OcSDw2ojd0w2zwq5-9kp4udDL4Ok2PwV-1s43ttQUTAg_21_4ihPKo__kvij_8uwE_2V_S1Qq8WjTvi-1uwT8fVIjs7sIf3CusmKdvxbYuapTeGN6hA0GbNdP5TcVxy4Kz9sPaHkgisL9Ru04DFJ9dK0UrjuWSVDp8TyuhhgnbxwSQpEYmE9hbQIi_k90SmpZ8HgRa3evVvx03Id0lMTOW89pL5qoUgvQvocfKA_yDvTNZV24NYsRmdP_7uQYF1_folLBGwresh1wkH0PxQv6unD58Ym0X3a8hO9XxoaEDLnv6e_K6FJKESyUjcheIl00TpQPq5VoAamBTX2VmccvzlDQIJtYHoMtIgH937V5SWuzO6DoVB6lb_dcR4bHxeyJXIg-WyoDKHKu5e5qLeD8BXzGfVhVSOM78I_OJDolbr4A0',
 'Бухгалтер Энди Дюфрейн обвинён в убийстве собственной жены и её любовника. Оказавшись в тюрьме под названием Шоушенк, он сталкивается с жестокостью и беззаконием, царящими по обе стороны решётки. Каждый, кто попадает в эти стены, становится их рабом до конца жизни. Но Энди, обладающий живым умом и доброй душой, находит подход как к заключённым, так и к охранникам, добиваясь их особого к себе расположения.',
 '9.1',
 '1994',
 'США',
 'Страх - это кандалы. Надежда - это свобода',
 '16+',
 25000000,
 NULL,
 NULL,
 23,
 2,
 21,
 23,
 3,
 4
);

INSERT INTO film_genre (film_id, genre_id) VALUES
(1, 7),(1, 28),(1, 13);

INSERT INTO film_audience (film_id, audience_id) VALUES
(1, 5),(1, 7), (1, 19);

INSERT INTO film_person (person_id, personduplicated_id) VALUES
(2, 1), (3, 2), (4, 3), (5, 4), (6, 5), (7, 6), (8,7),
(9, 8), (10, 9), (11, 10), (12, 11), (13, 12), (14, 13), (15,14),
(25, 15), (27, 16), (28, 17), (36, 18), (6, 19), (7, 20), (8, 21);

