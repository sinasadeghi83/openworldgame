--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 9.6.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: _attack; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._attack (
    attacker smallint,
    state_id smallint,
    chance smallint
);


ALTER TABLE public._attack OWNER TO rebasedata;

--
-- Name: _chat; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._chat (
    id bigint,
    type character varying(10) DEFAULT NULL::character varying,
    title character varying(6) DEFAULT NULL::character varying
);


ALTER TABLE public._chat OWNER TO rebasedata;

--
-- Name: _command; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._command (
    id smallint,
    name character varying(23) DEFAULT NULL::character varying,
    code character varying(23) DEFAULT NULL::character varying,
    description character varying(30) DEFAULT NULL::character varying
);


ALTER TABLE public._command OWNER TO rebasedata;

--
-- Name: _form; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._form (
    id character varying(1) DEFAULT NULL::character varying,
    chat_id character varying(1) DEFAULT NULL::character varying,
    command_id character varying(1) DEFAULT NULL::character varying,
    step character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._form OWNER TO rebasedata;

--
-- Name: _game; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._game (
    id smallint,
    chat_id bigint,
    map_id smallint,
    round smallint,
    turn smallint,
    last_time bigint,
    create_time bigint,
    status smallint,
    attacker_pop_ratio numeric(3,2) DEFAULT NULL::numeric,
    defender_pop_ratio numeric(3,2) DEFAULT NULL::numeric,
    lang smallint
);


ALTER TABLE public._game OWNER TO rebasedata;

--
-- Name: _gameform; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._gameform (
    id character varying(1) DEFAULT NULL::character varying,
    chat_id character varying(1) DEFAULT NULL::character varying,
    command_id character varying(1) DEFAULT NULL::character varying,
    player_id character varying(1) DEFAULT NULL::character varying,
    step character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._gameform OWNER TO rebasedata;

--
-- Name: _info; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._info (
    id smallint,
    guide character varying(3238) DEFAULT NULL::character varying,
    about character varying(87) DEFAULT NULL::character varying,
    lang smallint
);


ALTER TABLE public._info OWNER TO rebasedata;

--
-- Name: _map; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._map (
    id smallint,
    name character varying(11) DEFAULT NULL::character varying,
    address character varying(55) DEFAULT NULL::character varying,
    status smallint
);


ALTER TABLE public._map OWNER TO rebasedata;

--
-- Name: _migration; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._migration (
    version character varying(64) DEFAULT NULL::character varying,
    apply_time bigint
);


ALTER TABLE public._migration OWNER TO rebasedata;

--
-- Name: _neighbor; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._neighbor (
    state_id smallint,
    neighbor_id smallint
);


ALTER TABLE public._neighbor OWNER TO rebasedata;

--
-- Name: _player; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._player (
    id smallint,
    user_id integer,
    game_id smallint,
    turn smallint,
    color character varying(6) DEFAULT NULL::character varying,
    economy integer,
    population integer,
    army smallint
);


ALTER TABLE public._player OWNER TO rebasedata;

--
-- Name: _state; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._state (
    id smallint,
    name character varying(14) DEFAULT NULL::character varying,
    economy smallint,
    population smallint,
    map_id smallint,
    army smallint
);


ALTER TABLE public._state OWNER TO rebasedata;

--
-- Name: _stateplayer; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._stateplayer (
    state_id smallint,
    player_id smallint
);


ALTER TABLE public._stateplayer OWNER TO rebasedata;

--
-- Name: _user; Type: TABLE; Schema: public; Owner: rebasedata
--

CREATE TABLE public._user (
    id integer,
    is_bot smallint,
    first_name character varying(20) DEFAULT NULL::character varying,
    last_name character varying(1) DEFAULT NULL::character varying,
    username character varying(15) DEFAULT NULL::character varying,
    language_code character varying(2) DEFAULT NULL::character varying,
    chat_id integer,
    lang smallint
);


ALTER TABLE public._user OWNER TO rebasedata;

--
-- Data for Name: _attack; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._attack (attacker, state_id, chance) FROM stdin;
51	85	98
\.


--
-- Data for Name: _chat; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._chat (id, type, title) FROM stdin;
-1001195976210	supergroup	خودمون
-327359751	group	test
57184501	private	
92911683	private	
427369422	private	
727417374	private	
850828031	private	
\.


--
-- Data for Name: _command; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._command (id, name, code, description) FROM stdin;
1	/start	main/start	start the bot
3	شروع	main/start	
4	/newgame	game/new	create a new game
5	/startgame	game/start	start the game
6	/endgame	game/end	end game sooner
8	about us	main/about	
9	guide	main/guide	
10	country status	game/country-status	
11	improve army	game/improve-army	
12	improve economy	game/improve-economy	
13	improve population	game/improve-population	
14	attack	game/attack	
15	/showmap	game/show-map	show game map
16	درباره ما	main/about	
17	راهنما	main/guide	
18	وضعیت کشور	game/country-status	
19	بهبود ارتش	game/improve-army	
20	بهبود اقتصاد	game/improve-economy	
21	بهبود جمعیت	game/improve-population	
22	حمله	game/attack	
23	وضعیت	game/status	
24	/status	game/status	show player status
25	وضعیت همه	game/all-status	
26	/allstatus	game/all-status	send status of all players
27	/giveup	game/give-up	exit the game (loss)
28	/skipturn	game/skip-turn	skip turn (after 2 min)
29	/guide	main/guide	how to play
30	/setlang	main/change-lang	change the language of the bot
31	set webhook	admin/set-webhook	
32	set commands	admin/set-commands	
33	set guide	admin/set-guide	
34	set about us	admin/set-about	
35	admin	admin/keyboard	
36	آزاد سازی ایالت	game/free-state	
37	Liberation of the state	game/free-state	
\.


--
-- Data for Name: _form; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._form (id, chat_id, command_id, step) FROM stdin;
\.


--
-- Data for Name: _game; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._game (id, chat_id, map_id, round, turn, last_time, create_time, status, attacker_pop_ratio, defender_pop_ratio, lang) FROM stdin;
23	-1001195976210	1	294	1	1599485568	1599298441	1	0.97	0.25	2
\.


--
-- Data for Name: _gameform; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._gameform (id, chat_id, command_id, player_id, step) FROM stdin;
\.


--
-- Data for Name: _info; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._info (id, guide, about, lang) FROM stdin;
1	Game instructions:\r\n    Bitler is a group game in the style of strategy. In this game, each player is in charge of one country and must try to defeat all the other players by attacking other states and improving his country. This player will win the game. You must first join the robot in a group and then create a new game and wait for the rest of the members to play. After the players become members, you run the game by sending the command. Note that a maximum of 27 people can join the game (minimum 2 people). At the beginning of the game, each person is given a state by chance, the initial value of which is 300's economy and population.\r\n    Country resources:\r\n    Each country has 3 sources: army, economy, population. The economy is a secure resource, meaning it will always contribute positively in real terms in war and defense; The population is a source of risk, so that sometimes the economy will help more and sometimes less in war and defense, and finally the army, which is a necessary resource for war. You need to keep your army above 0 to fight. Note that country resources are different from state resources. Each country (player) has a different economy and population from its states, which can be negative or positive. The country's total resources are calculated by summing non-state resources and state resources.\r\n    Map:\r\n    With the / showmap command you can see the map of the game world. Each player is assigned a specific color that can be seen in the list of players at the top of the map. The game world is divided into small and large states and the amount of their resources as well as the name of the state are written on them. The high number represents the state economy and the low number represents the state population. You can only attack neighboring states. The point is, North Africa can be invaded from southern Europe, but southern Europe cannot be invaded from northern Africa. There are several other small blue borders that you can discover while playing!\r\n    the war:\r\n         According to the map, you can attack a neighboring state and add that state to your empire. In the first step, you tell the robot which state you want to attack, then the robot tells you what your chances of winning are. If you confirm the attack, the robot will inform you of the outcome of the battle and it will be the next person's turn. Otherwise you can choose another state to fight or improve your resources. Each war will depend on the amount of damage you lose in the war, which is deducted from your resources.\r\n    Instructions guide:\r\n    The commands to be executed in the group are marked with an *.\r\n    / newgame *: This command creates a new game.\r\n    / startgame *: This command executes the game from membership mode.\r\n    / showmap *: This command sends you a map link.\r\n    / status *: This command displays the status of a player.\r\n    / allstatus *: This command shows the country status of all players.\r\n    / skipturn *: If a player does not take his turn after 2 minutes, this command can be skipped.\r\n    / giveup *: The player who executes this command exits the game (loses (.\r\n    / endgame *: With this command, the game (running or recruiting) can be completed halfway.	This game bot developed by Sina Sadeghi @sinaapps \\n https://github.com/sinasadeghi83	1
2	راهنمای بازی:\r\n    بیتلر یک بازی گروهی در سبک استراتژی می باشد. در این بازی هر بازیکن اداره یک کشور را بر عهده دارد و باید تلاش کند با حمله به ایالت های دیگر و بهبود کشورش تمام بازیکنان دیگر را شکست دهد. این بازیکن برنده بازی خواهد بود. شما در ابتدا باید ربات را در یک گروه عضو کنید و سپس یک بازی جدید ایجاد کنید و منتظر بمانید تا بقیه عضو بازی شوند. پس از عضو شدن بازیکنان با ارسال دستور بازی را اجرا می کنید. توجه داشته باشید که حداکثر 27 نفر در بازی می توانند عضو شوند(حداقل 2 نفر). در ابتدای بازی به هر فرد یک ایالت به طور شانسی داده می شود که مقدار اولیه اقتصاد و جمعیت کشورش 300 می باشد. \r\n    منابع:\r\n    هرکشور 3 منبع دارد:ارتش، اقتصاد، جمعیت. اقتصاد یک منبع امن می باشد یعنی همیشه در جنگ و دفاع به مقدار واقعیش کمک مثبت خواهد کرد; جمعیت یک منبعی ریسکی می باشد به طوری که گاهی از اقتصاد هم کمک بیشتر و گاهی کمتر در جنگ و دفاع کمک خواهد کرد و درنهایت ارتش که یک منبع لازم برای جنگ می باشد. شما برای جنگیدن نیاز دارید که ارتشتان را بیشتر از 0 نگه دارید. توجه داشته باشید که منابع کشور با منابع ایالتی متفاوت می باشند. هر کشور(بازیکن) اقتصاد و جمعیت متفاوت از ایالت هایش دارد که می تواند منفی و یا مثبت باشد. کل منابع کشور با جمع منابع غیرایالتی و منابع ایالتی محاسبه می شود.\r\n    نقشه:\r\n    با دستور /showmap می توانید نقشه جهان بازی را ببینید. هر بازیکن با رنگ مشخصی تعیین شده که در لیست بازیکنان که در بالای نقشه قرار دارد قابل مشاهده است. جهان بازی به ایالت های کوچک و بزرگ تقسیم شده و میزان منابع آن ها و همچنین نام ایالت روی آن ها نوشته شده است. عدد بالایی نشان دهنده اقتصاد ایالت و عدد پایینی جمعیت ایالت می باشد. شما تنها به ایالت هایی می توانید حمله کنید که همسایه شما هستند. نکته ای که وجود دارد این است که از جنوب اروپا می توان به شمال آفریقا حمله کرد اما نمی توان از شمال آفریقا به جنوب اروپا حمله کرد. چندین مرز آبی کوچک دیگر هم وجود دارند که می توانید درحین بازی کشف کنید!\r\n    جنگ:\r\n         با توجه به نقشه می توانید به یک ایالت همسایه خود حمله کنید و آن ایالت را به امپراطوری خود اضافه کنید. در مرحله اول به ربات می گویید که به کدام ایالت می خواهید حمله می کنید سپس ربات به شما می گوید که شانس پیروزی شما چه قدر است. درصورتی که حمله را تایید کنید ربات نتیجه جنگ را به شما اعلام می کند و نوبت به نفر بعدی می رسد. در غیر این صورت شما می توانید ایالت دیگری را برای جنگ انتخاب کنید یا منابعتان را بهبود دهید. هر جنگ وابسته به برد و باخت شما در جنگ برای شما مقداری خسارت خواهد داشت که از منابع کسر می شود.\r\n    راهنمای دستورات:\r\n    دستوراتی که باید در گروه اجرا شوند با علامت * مشخص شده اند.\r\n    /newgame* : این دستور یک بازی جدید ایجاد می کند.\r\n    /startgame* : این دستور بازی را از حالت عضو گیری به حالت اجرا در می آورد.\r\n    /showmap*: این دستور لینک نقشه را برای شما می فرستد.\r\n    /status* : این دستور وضعیت یک بازیکن مورد نظر را نمایش می دهد.\r\n    /allstatus*: این دستور وضعیت کشور تمام بازیکنان را نشان می دهد.\r\n    /skipturn*: درصورتی که یک بازیکن پس از 2 دقیقه نوبتش را نرود می توان با این دستور نوبتش را رد کرد.\r\n    /giveup*: بازیکنی که این دستور را اجرا کند از بازی خارج می شود(می بازد(.\r\n    /endgame* : با این دستور می توان بازی(درحال اجرا یا عضوگیری) را نیمه کاره تمام کرد.	این ربات توسط سینا صادقی نوشته شده است \\n @sinaapps \\n https://github.com/sinasadeghi83	2
\.


--
-- Data for Name: _map; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._map (id, name, address, status) FROM stdin;
1	middle-east	https://sinasadeghi83.github.io/openworldgame/map1.html	1
\.


--
-- Data for Name: _migration; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._migration (version, apply_time) FROM stdin;
m000000_000000_base	1599167674
m200825_153308_create_chat_table	1599167675
m200825_153459_create_command_table	1599167675
m200825_154610_create_form_table	1599167676
m200825_154904_create_map_table	1599167676
m200825_155355_create_game_table	1599167676
m200825_160017_create_user_table	1599167676
m200825_160309_create_player_table	1599167677
m200825_161437_create_state_table	1599167677
m200825_161603_create_neighbor_table	1599167677
m200825_162235_create_junction_table_for_state_and_player_tables	1599167677
m200825_162625_create_junction_table_for_player_and_state_tables	1599167678
m200825_214004_delete_pk_auto_increment_from_chat_table	1599167678
m200825_214851_set_new_default_values_for_player_table	1599167678
m200826_215151_create_gameform_table	1599167678
m200827_134507_delete_null_fields_from_game_table	1599167679
m200830_080243_add_random_params_to_game_table	1599167679
m200830_081712_add_army_column_to_state_table	1599167679
m200902_110646_add_map_and_states_and_neighbors	1599167680
m200906_105406_add_description_column_to_command_table	1599389766
m200906_134223_add_lang_column_to_game_table	1599399770
m200906_135530_add_lang_column_to_user_table	1599400764
m200907_090124_create_info_table	1599470403
\.


--
-- Data for Name: _neighbor; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._neighbor (state_id, neighbor_id) FROM stdin;
1	2
1	3
1	4
1	5
1	6
1	7
2	1
2	5
2	30
2	33
2	35
2	36
3	1
3	4
3	6
3	47
3	48
4	1
4	3
4	5
4	48
4	49
5	1
5	2
5	4
5	49
5	51
5	52
5	53
6	1
6	3
6	7
6	47
6	102
6	103
7	1
7	6
7	9
7	11
7	39
7	99
8	9
8	10
8	97
8	98
8	99
9	7
9	8
9	10
9	11
9	99
10	8
10	11
10	12
11	7
11	9
11	10
11	13
11	39
12	10
12	13
12	14
13	11
13	12
13	14
13	39
13	40
13	41
13	43
14	12
14	13
14	15
14	41
14	43
14	46
15	14
15	16
15	17
16	15
16	17
16	18
16	46
17	15
17	16
17	18
18	16
18	17
18	19
18	20
18	46
19	18
19	20
19	23
19	45
19	46
20	18
20	19
20	21
20	23
21	20
21	22
21	23
21	24
22	21
22	24
22	25
23	19
23	20
23	24
23	32
23	44
23	45
24	21
24	22
24	23
24	25
24	26
24	32
25	22
25	24
25	26
25	28
26	24
26	25
26	27
26	28
26	31
26	32
27	26
27	28
27	29
27	30
27	31
27	54
27	55
27	56
28	25
28	26
28	27
28	29
29	27
29	28
29	53
29	54
29	55
29	56
30	2
30	27
30	31
30	33
31	26
31	27
31	30
31	32
31	34
32	23
32	24
32	26
32	31
32	34
33	2
33	30
33	34
33	36
34	31
34	33
34	36
34	37
34	44
35	2
35	36
35	37
35	38
36	2
36	33
36	34
36	35
36	37
37	34
37	35
37	36
37	38
37	40
37	42
37	44
38	35
38	37
38	39
38	40
39	7
39	11
39	13
39	38
39	40
40	13
40	37
40	38
40	39
40	41
40	42
41	13
41	40
41	42
41	43
42	37
42	40
42	41
42	44
42	45
43	13
43	14
43	41
43	45
43	46
44	23
44	32
44	34
44	37
44	42
44	45
45	19
45	23
45	42
45	43
45	44
45	46
46	14
46	15
46	16
46	18
46	19
46	43
46	45
47	3
47	6
47	48
47	65
48	3
48	4
48	47
48	49
48	65
49	4
49	5
49	48
49	50
49	63
49	65
50	49
50	51
50	57
50	63
50	79
51	5
51	50
51	52
51	54
51	57
52	5
52	51
52	53
52	54
53	5
53	52
53	54
54	51
54	52
54	53
54	55
54	57
54	58
55	54
55	56
55	58
56	55
56	58
56	59
56	60
57	50
57	51
57	54
57	58
57	59
57	79
58	54
58	55
58	56
58	57
58	59
59	56
59	57
59	58
59	60
59	61
59	79
60	56
60	59
60	61
60	62
61	59
61	60
61	62
61	79
61	83
62	60
62	61
63	49
63	50
63	64
63	65
63	66
63	79
63	80
64	63
64	66
64	70
64	77
64	80
64	84
65	47
65	48
65	49
65	63
65	66
66	63
66	64
66	65
66	67
66	69
66	70
67	66
67	68
67	69
68	67
68	69
68	71
68	72
69	66
69	67
69	68
69	70
69	71
70	64
70	66
70	69
70	71
70	76
70	77
71	68
71	69
71	70
71	72
71	74
71	76
72	68
72	71
72	73
72	74
73	72
73	74
73	75
74	71
74	73
74	75
74	76
75	73
75	74
75	78
75	85
76	70
76	71
76	74
76	77
76	78
77	64
77	70
77	76
77	78
77	84
78	75
78	76
78	77
78	84
78	85
79	50
79	57
79	59
79	61
79	63
79	81
79	83
80	63
80	64
80	81
80	82
81	79
81	80
81	82
81	83
82	80
82	81
82	84
83	61
83	62
83	79
83	81
84	64
84	77
84	78
84	82
84	85
85	75
85	78
85	84
86	87
86	88
86	93
87	86
88	86
88	89
88	93
89	88
89	90
89	94
90	68
90	89
90	91
91	68
91	72
91	90
91	92
92	91
93	86
93	88
93	94
93	95
94	89
94	93
94	105
94	107
95	93
95	96
95	105
96	95
96	97
96	98
96	100
96	104
97	8
97	96
97	98
97	99
97	100
98	8
98	96
98	97
99	7
99	8
99	9
99	97
99	100
100	96
100	97
100	99
100	101
100	104
101	100
101	102
101	104
101	106
102	6
102	101
102	103
102	106
103	6
103	65
103	102
103	106
104	96
104	100
104	101
104	105
104	106
105	94
105	95
105	104
105	106
106	101
106	102
106	103
106	104
106	105
107	65
107	66
107	67
107	94
\.


--
-- Data for Name: _player; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._player (id, user_id, game_id, turn, color, economy, population, army) FROM stdin;
50	92911683	23	0	701d98	57	-3194	2
51	850828031	23	1	06ef5f	-2310	-4190	2
\.


--
-- Data for Name: _state; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._state (id, name, economy, population, map_id, army) FROM stdin;
1	iranw	387	140	1	0
2	irane	128	474	1	0
3	iraq	101	243	1	0
4	arab1	299	320	1	0
5	arab2	258	137	1	0
6	turkey	369	330	1	0
7	ru1	338	344	1	0
8	ru3	54	239	1	0
9	ru2	476	258	1	0
10	ru4	84	447	1	0
11	ru5	299	482	1	0
12	ru6	445	274	1	0
13	ru7	409	188	1	0
14	ru8	338	454	1	0
15	ru9	344	329	1	0
16	ru10	131	230	1	0
17	ru11	311	431	1	0
18	chi1	466	121	1	0
19	chi2	332	376	1	0
20	chi3	74	392	1	0
21	chi4	252	196	1	0
22	chi5	275	470	1	0
23	chi6	438	194	1	0
24	chi7	258	410	1	0
25	indi1	166	421	1	0
26	indi2	422	323	1	0
27	indi3	428	153	1	0
28	indi4	108	410	1	0
29	indi5	248	332	1	0
30	pak1	145	118	1	0
31	pak2	444	74	1	0
32	pak3	259	361	1	0
33	afq1	114	300	1	0
34	afq2	371	295	1	0
35	turkm1	236	225	1	0
36	turkm2	401	484	1	0
37	uzbek	241	346	1	0
38	kazak1	483	248	1	0
39	kaza2	94	86	1	0
40	kazak3	279	59	1	0
41	kazak4	141	392	1	0
42	kazak5	422	158	1	0
43	kazak6	487	198	1	0
44	kazak7	61	188	1	0
45	kazak8	144	365	1	0
46	kazak9	446	143	1	0
47	egt1	359	235	1	0
48	egt2	416	167	1	0
49	sud1	483	213	1	0
50	sud2	226	405	1	0
51	ethio1	144	478	1	0
52	ethio2	229	130	1	0
53	somal	388	113	1	0
54	kenya	189	487	1	0
55	tanz1	84	177	1	0
56	tanz2	61	388	1	0
57	south-sudan	370	101	1	0
58	uganda	422	158	1	0
59	congo1	145	222	1	0
60	congo2	289	186	1	0
61	congo3	258	252	1	0
62	angola	490	123	1	0
63	chad	411	431	1	0
64	niger	212	263	1	0
65	libya1	404	432	1	0
66	libya2	220	454	1	0
67	algeria1	286	174	1	0
68	algeria2	382	244	1	0
69	algeria3	263	258	1	0
70	algeria4	215	487	1	0
71	algeria5	332	133	1	0
72	morocco	435	211	1	0
73	west-sahra	56	494	1	0
74	mauritana1	91	176	1	0
75	mauritana2	197	477	1	0
76	mali1	307	372	1	0
77	mali2	294	175	1	0
78	mali3	327	281	1	0
79	central-africa	190	461	1	0
80	nigeria1	117	191	1	0
81	nigeria2	384	99	1	0
82	nigeria3	494	357	1	0
83	gaban	394	373	1	0
84	ghana	365	184	1	0
85	guinea	70	143	1	0
86	england	235	354	1	0
87	ireland	404	356	1	0
88	france1	109	302	1	0
89	france2	105	443	1	0
90	spain1	123	417	1	0
91	spain2	382	235	1	0
92	portugal	99	421	1	0
93	german-french	395	281	1	0
94	euroaly	65	224	1	0
95	gerpol	97	309	1	0
96	east-poland	240	171	1	0
97	belarus	247	281	1	0
98	landia	233	475	1	0
99	ukraine1	148	69	1	0
100	ukraine2	260	408	1	0
101	romania	160	175	1	0
102	landia2	251	384	1	0
103	euroland1	302	317	1	0
104	euroland2	159	457	1	0
105	euroland3	421	369	1	0
106	euroland4	237	134	1	0
107	italy	216	83	1	0
\.


--
-- Data for Name: _stateplayer; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._stateplayer (state_id, player_id) FROM stdin;
3	51
4	51
5	51
9	50
11	50
12	50
13	50
14	50
15	50
16	50
17	50
18	50
19	50
20	50
22	50
23	50
24	50
25	50
26	50
28	50
29	50
32	50
34	50
37	50
38	50
44	50
45	50
46	50
47	51
48	51
49	51
50	51
51	51
54	51
62	51
63	51
64	51
65	51
66	51
67	51
68	51
69	51
70	51
71	51
72	51
73	51
75	51
76	51
79	51
82	51
83	51
84	51
\.


--
-- Data for Name: _user; Type: TABLE DATA; Schema: public; Owner: rebasedata
--

COPY public._user (id, is_bot, first_name, last_name, username, language_code, chat_id, lang) FROM stdin;
57184501	0	ماری		marybakhtiary	en	57184501	1
92911683	0	Sina		Sina_2s	en	92911683	1
427369422	0	????????Sina????????		Sinatechs	en	427369422	1
727417374	0	Muqraz		MaxTheDesertMan	en	727417374	1
850828031	0	Soroush		shhk_83	fa	850828031	1
\.


--
-- PostgreSQL database dump complete
--

