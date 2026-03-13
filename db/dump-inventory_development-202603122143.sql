--
-- PostgreSQL database dump
--

\restrict I7fuCt7snBHlsEB3dD17wKztxAf4McPCeu7df2RBvE3VmJ0Ey5suL7wlSuBdV6t

-- Dumped from database version 18.1 (Debian 18.1-1.pgdg13+2)
-- Dumped by pg_dump version 18.3

-- Started on 2026-03-12 21:43:41 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 18198)
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 18255)
-- Name: integrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.integrations (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.integrations OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 18254)
-- Name: integrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.integrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.integrations_id_seq OWNER TO postgres;

--
-- TOC entry 3572 (class 0 OID 0)
-- Dependencies: 227
-- Name: integrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.integrations_id_seq OWNED BY public.integrations.id;


--
-- TOC entry 234 (class 1259 OID 18316)
-- Name: onboardings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.onboardings (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    current_step character varying DEFAULT 'start'::character varying NOT NULL,
    default_lead_time integer,
    default_days_of_stock integer,
    default_forecasting_days integer,
    existing_pos character varying,
    vendors_as_suppliers boolean,
    bundles character varying,
    requested_integrations character varying[] DEFAULT '{}'::character varying[],
    completed boolean DEFAULT false NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.onboardings OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 18315)
-- Name: onboardings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.onboardings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.onboardings_id_seq OWNER TO postgres;

--
-- TOC entry 3573 (class 0 OID 0)
-- Dependencies: 233
-- Name: onboardings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.onboardings_id_seq OWNED BY public.onboardings.id;


--
-- TOC entry 224 (class 1259 OID 18221)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying NOT NULL,
    price numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 18220)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 3574 (class 0 OID 0)
-- Dependencies: 223
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 240 (class 1259 OID 18370)
-- Name: sales_histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_histories (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    warehouse_id bigint,
    quantity numeric,
    sales_price numeric,
    discount integer,
    payment_id character varying,
    checkout_at timestamp(6) without time zone,
    payment_at timestamp(6) without time zone,
    delivery_at timestamp(6) without time zone,
    delivery_id character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.sales_histories OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 18369)
-- Name: sales_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_histories_id_seq OWNER TO postgres;

--
-- TOC entry 3575 (class 0 OID 0)
-- Dependencies: 239
-- Name: sales_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_histories_id_seq OWNED BY public.sales_histories.id;


--
-- TOC entry 219 (class 1259 OID 18190)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 18352)
-- Name: suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliers (
    id bigint NOT NULL,
    name character varying,
    vendor_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.suppliers OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 18351)
-- Name: suppliers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suppliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.suppliers_id_seq OWNER TO postgres;

--
-- TOC entry 3576 (class 0 OID 0)
-- Dependencies: 237
-- Name: suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suppliers_id_seq OWNED BY public.suppliers.id;


--
-- TOC entry 222 (class 1259 OID 18209)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 18208)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3577 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 230 (class 1259 OID 18268)
-- Name: users_integrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_integrations (
    id bigint NOT NULL,
    integration_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.users_integrations OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 18267)
-- Name: users_integrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_integrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_integrations_id_seq OWNER TO postgres;

--
-- TOC entry 3578 (class 0 OID 0)
-- Dependencies: 229
-- Name: users_integrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_integrations_id_seq OWNED BY public.users_integrations.id;


--
-- TOC entry 236 (class 1259 OID 18340)
-- Name: vendors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendors (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.vendors OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 18339)
-- Name: vendors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendors_id_seq OWNER TO postgres;

--
-- TOC entry 3579 (class 0 OID 0)
-- Dependencies: 235
-- Name: vendors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendors_id_seq OWNED BY public.vendors.id;


--
-- TOC entry 226 (class 1259 OID 18234)
-- Name: warehouses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouses (
    id bigint NOT NULL,
    name character varying NOT NULL,
    address character varying,
    users_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.warehouses OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18233)
-- Name: warehouses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.warehouses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.warehouses_id_seq OWNER TO postgres;

--
-- TOC entry 3580 (class 0 OID 0)
-- Dependencies: 225
-- Name: warehouses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.warehouses_id_seq OWNED BY public.warehouses.id;


--
-- TOC entry 232 (class 1259 OID 18292)
-- Name: warehouses_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouses_products (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    warehouse_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.warehouses_products OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 18291)
-- Name: warehouses_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.warehouses_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.warehouses_products_id_seq OWNER TO postgres;

--
-- TOC entry 3581 (class 0 OID 0)
-- Dependencies: 231
-- Name: warehouses_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.warehouses_products_id_seq OWNED BY public.warehouses_products.id;


--
-- TOC entry 3345 (class 2604 OID 18258)
-- Name: integrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.integrations ALTER COLUMN id SET DEFAULT nextval('public.integrations_id_seq'::regclass);


--
-- TOC entry 3348 (class 2604 OID 18319)
-- Name: onboardings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.onboardings ALTER COLUMN id SET DEFAULT nextval('public.onboardings_id_seq'::regclass);


--
-- TOC entry 3343 (class 2604 OID 18224)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 3354 (class 2604 OID 18373)
-- Name: sales_histories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_histories ALTER COLUMN id SET DEFAULT nextval('public.sales_histories_id_seq'::regclass);


--
-- TOC entry 3353 (class 2604 OID 18355)
-- Name: suppliers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers ALTER COLUMN id SET DEFAULT nextval('public.suppliers_id_seq'::regclass);


--
-- TOC entry 3342 (class 2604 OID 18212)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3346 (class 2604 OID 18271)
-- Name: users_integrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_integrations ALTER COLUMN id SET DEFAULT nextval('public.users_integrations_id_seq'::regclass);


--
-- TOC entry 3352 (class 2604 OID 18343)
-- Name: vendors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendors ALTER COLUMN id SET DEFAULT nextval('public.vendors_id_seq'::regclass);


--
-- TOC entry 3344 (class 2604 OID 18237)
-- Name: warehouses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses ALTER COLUMN id SET DEFAULT nextval('public.warehouses_id_seq'::regclass);


--
-- TOC entry 3347 (class 2604 OID 18295)
-- Name: warehouses_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses_products ALTER COLUMN id SET DEFAULT nextval('public.warehouses_products_id_seq'::regclass);


--
-- TOC entry 3546 (class 0 OID 18198)
-- Dependencies: 220
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ar_internal_metadata VALUES ('environment', 'development', '2026-03-10 23:08:01.83574', '2026-03-10 23:08:01.835742');


--
-- TOC entry 3554 (class 0 OID 18255)
-- Dependencies: 228
-- Data for Name: integrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.integrations VALUES (2, 'shopify', '2026-03-12 10:34:59.022455', '2026-03-12 10:34:59.022455');
INSERT INTO public.integrations VALUES (3, 'shiphero', '2026-03-12 10:35:48.183677', '2026-03-12 10:35:48.183677');
INSERT INTO public.integrations VALUES (4, 'amazon', '2026-03-12 10:36:06.63969', '2026-03-12 10:36:06.63969');


--
-- TOC entry 3560 (class 0 OID 18316)
-- Dependencies: 234
-- Data for Name: onboardings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.onboardings VALUES (2, 2, 'start', NULL, NULL, NULL, NULL, NULL, NULL, '{}', false, '2026-03-11 09:11:58.213888', '2026-03-11 09:11:58.213888');
INSERT INTO public.onboardings VALUES (3, 2, 'start', NULL, NULL, NULL, NULL, NULL, NULL, '{}', false, '2026-03-11 09:12:09.919944', '2026-03-11 09:12:09.919944');
INSERT INTO public.onboardings VALUES (5, 4, 'start', NULL, NULL, NULL, NULL, NULL, NULL, '{}', false, '2026-03-11 09:56:32.405415', '2026-03-11 09:56:32.405415');
INSERT INTO public.onboardings VALUES (6, 6, 'start', NULL, NULL, NULL, NULL, NULL, NULL, '{}', false, '2026-03-11 09:59:49.057195', '2026-03-11 09:59:49.057195');
INSERT INTO public.onboardings VALUES (7, 5, 'start', NULL, NULL, NULL, NULL, NULL, NULL, '{}', false, '2026-03-11 10:00:14.921562', '2026-03-11 10:00:14.921562');
INSERT INTO public.onboardings VALUES (1, 1, 'start', NULL, NULL, NULL, NULL, NULL, NULL, '{new1,new2}', false, '2026-03-11 08:50:50.801509', '2026-03-12 10:15:27.508262');
INSERT INTO public.onboardings VALUES (4, 3, 'step_7', NULL, NULL, NULL, NULL, NULL, NULL, '{new1,neew2}', false, '2026-03-11 09:22:43.726484', '2026-03-12 19:11:09.983755');
INSERT INTO public.onboardings VALUES (8, 7, 'start', NULL, NULL, NULL, NULL, NULL, NULL, '{}', false, '2026-03-12 19:51:54.828969', '2026-03-12 19:51:54.828969');


--
-- TOC entry 3550 (class 0 OID 18221)
-- Dependencies: 224
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3566 (class 0 OID 18370)
-- Dependencies: 240
-- Data for Name: sales_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3545 (class 0 OID 18190)
-- Dependencies: 219
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.schema_migrations VALUES ('20260310210153');
INSERT INTO public.schema_migrations VALUES ('20260310210223');
INSERT INTO public.schema_migrations VALUES ('20260310210239');
INSERT INTO public.schema_migrations VALUES ('20260310210259');
INSERT INTO public.schema_migrations VALUES ('20260310210317');
INSERT INTO public.schema_migrations VALUES ('20260310210339');
INSERT INTO public.schema_migrations VALUES ('20260310221012');
INSERT INTO public.schema_migrations VALUES ('20260310221055');
INSERT INTO public.schema_migrations VALUES ('20260310221101');
INSERT INTO public.schema_migrations VALUES ('20260310221120');


--
-- TOC entry 3564 (class 0 OID 18352)
-- Dependencies: 238
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3548 (class 0 OID 18209)
-- Dependencies: 222
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'John', '2026-03-11 08:43:27.41168', '2026-03-11 08:43:27.41168');
INSERT INTO public.users VALUES (2, 'John2', '2026-03-11 08:52:31.262725', '2026-03-11 08:52:31.262725');
INSERT INTO public.users VALUES (3, 'John3', '2026-03-11 09:13:58.935582', '2026-03-11 09:13:58.935582');
INSERT INTO public.users VALUES (4, 'John4', '2026-03-11 09:56:19.316459', '2026-03-11 09:56:19.316459');
INSERT INTO public.users VALUES (5, 'John45', '2026-03-11 09:57:26.936845', '2026-03-11 09:57:26.936845');
INSERT INTO public.users VALUES (6, 'John46', '2026-03-11 09:59:00.128716', '2026-03-11 09:59:00.128716');
INSERT INTO public.users VALUES (7, 'John7', '2026-03-12 20:50:34.059466', '2026-03-12 20:50:34.059466');


--
-- TOC entry 3556 (class 0 OID 18268)
-- Dependencies: 230
-- Data for Name: users_integrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users_integrations VALUES (1, 2, 1, '2026-03-12 11:36:02.585198', '2026-03-12 11:36:02.585198');
INSERT INTO public.users_integrations VALUES (2, 4, 3, '2026-03-12 11:42:22.792861', '2026-03-12 11:42:22.792861');
INSERT INTO public.users_integrations VALUES (4, 3, 3, '2026-03-12 19:12:34.874834', '2026-03-12 19:12:34.874834');


--
-- TOC entry 3562 (class 0 OID 18340)
-- Dependencies: 236
-- Data for Name: vendors; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3552 (class 0 OID 18234)
-- Dependencies: 226
-- Data for Name: warehouses; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3558 (class 0 OID 18292)
-- Dependencies: 232
-- Data for Name: warehouses_products; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3582 (class 0 OID 0)
-- Dependencies: 227
-- Name: integrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.integrations_id_seq', 4, true);


--
-- TOC entry 3583 (class 0 OID 0)
-- Dependencies: 233
-- Name: onboardings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.onboardings_id_seq', 8, true);


--
-- TOC entry 3584 (class 0 OID 0)
-- Dependencies: 223
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- TOC entry 3585 (class 0 OID 0)
-- Dependencies: 239
-- Name: sales_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_histories_id_seq', 1, false);


--
-- TOC entry 3586 (class 0 OID 0)
-- Dependencies: 237
-- Name: suppliers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suppliers_id_seq', 1, false);


--
-- TOC entry 3587 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- TOC entry 3588 (class 0 OID 0)
-- Dependencies: 229
-- Name: users_integrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_integrations_id_seq', 4, true);


--
-- TOC entry 3589 (class 0 OID 0)
-- Dependencies: 235
-- Name: vendors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendors_id_seq', 1, false);


--
-- TOC entry 3590 (class 0 OID 0)
-- Dependencies: 225
-- Name: warehouses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.warehouses_id_seq', 1, false);


--
-- TOC entry 3591 (class 0 OID 0)
-- Dependencies: 231
-- Name: warehouses_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.warehouses_products_id_seq', 1, false);


--
-- TOC entry 3358 (class 2606 OID 18207)
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- TOC entry 3368 (class 2606 OID 18266)
-- Name: integrations integrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.integrations
    ADD CONSTRAINT integrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3379 (class 2606 OID 18332)
-- Name: onboardings onboardings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.onboardings
    ADD CONSTRAINT onboardings_pkey PRIMARY KEY (id);


--
-- TOC entry 3362 (class 2606 OID 18232)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3388 (class 2606 OID 18381)
-- Name: sales_histories sales_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_histories
    ADD CONSTRAINT sales_histories_pkey PRIMARY KEY (id);


--
-- TOC entry 3356 (class 2606 OID 18197)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3384 (class 2606 OID 18362)
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- TOC entry 3372 (class 2606 OID 18278)
-- Name: users_integrations users_integrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_integrations
    ADD CONSTRAINT users_integrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3360 (class 2606 OID 18219)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3381 (class 2606 OID 18350)
-- Name: vendors vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendors
    ADD CONSTRAINT vendors_pkey PRIMARY KEY (id);


--
-- TOC entry 3366 (class 2606 OID 18246)
-- Name: warehouses warehouses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT warehouses_pkey PRIMARY KEY (id);


--
-- TOC entry 3376 (class 2606 OID 18302)
-- Name: warehouses_products warehouses_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses_products
    ADD CONSTRAINT warehouses_products_pkey PRIMARY KEY (id);


--
-- TOC entry 3377 (class 1259 OID 18338)
-- Name: index_onboardings_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_onboardings_on_user_id ON public.onboardings USING btree (user_id);


--
-- TOC entry 3385 (class 1259 OID 18392)
-- Name: index_sales_histories_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_sales_histories_on_product_id ON public.sales_histories USING btree (product_id);


--
-- TOC entry 3386 (class 1259 OID 18393)
-- Name: index_sales_histories_on_warehouse_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_sales_histories_on_warehouse_id ON public.sales_histories USING btree (warehouse_id);


--
-- TOC entry 3382 (class 1259 OID 18368)
-- Name: index_suppliers_on_vendor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_suppliers_on_vendor_id ON public.suppliers USING btree (vendor_id);


--
-- TOC entry 3369 (class 1259 OID 18289)
-- Name: index_users_integrations_on_integration_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_integrations_on_integration_id ON public.users_integrations USING btree (integration_id);


--
-- TOC entry 3370 (class 1259 OID 18290)
-- Name: index_users_integrations_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_integrations_on_user_id ON public.users_integrations USING btree (user_id);


--
-- TOC entry 3363 (class 1259 OID 18252)
-- Name: index_warehouses_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_warehouses_on_name ON public.warehouses USING btree (name);


--
-- TOC entry 3364 (class 1259 OID 18253)
-- Name: index_warehouses_on_users_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_warehouses_on_users_id ON public.warehouses USING btree (users_id);


--
-- TOC entry 3373 (class 1259 OID 18313)
-- Name: index_warehouses_products_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_warehouses_products_on_product_id ON public.warehouses_products USING btree (product_id);


--
-- TOC entry 3374 (class 1259 OID 18314)
-- Name: index_warehouses_products_on_warehouse_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_warehouses_products_on_warehouse_id ON public.warehouses_products USING btree (warehouse_id);


--
-- TOC entry 3392 (class 2606 OID 18303)
-- Name: warehouses_products fk_rails_0c16376b4b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses_products
    ADD CONSTRAINT fk_rails_0c16376b4b FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3396 (class 2606 OID 18382)
-- Name: sales_histories fk_rails_1cb2ee81e8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_histories
    ADD CONSTRAINT fk_rails_1cb2ee81e8 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3389 (class 2606 OID 18247)
-- Name: warehouses fk_rails_42af660042; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT fk_rails_42af660042 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- TOC entry 3397 (class 2606 OID 18387)
-- Name: sales_histories fk_rails_4c91c21a01; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_histories
    ADD CONSTRAINT fk_rails_4c91c21a01 FOREIGN KEY (warehouse_id) REFERENCES public.warehouses(id);


--
-- TOC entry 3395 (class 2606 OID 18363)
-- Name: suppliers fk_rails_708ce4fcb1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT fk_rails_708ce4fcb1 FOREIGN KEY (vendor_id) REFERENCES public.vendors(id);


--
-- TOC entry 3394 (class 2606 OID 18333)
-- Name: onboardings fk_rails_79b836a814; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.onboardings
    ADD CONSTRAINT fk_rails_79b836a814 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3390 (class 2606 OID 18284)
-- Name: users_integrations fk_rails_81def94170; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_integrations
    ADD CONSTRAINT fk_rails_81def94170 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3391 (class 2606 OID 18279)
-- Name: users_integrations fk_rails_e4863320a5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_integrations
    ADD CONSTRAINT fk_rails_e4863320a5 FOREIGN KEY (integration_id) REFERENCES public.integrations(id);


--
-- TOC entry 3393 (class 2606 OID 18308)
-- Name: warehouses_products fk_rails_f68d3d33a4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses_products
    ADD CONSTRAINT fk_rails_f68d3d33a4 FOREIGN KEY (warehouse_id) REFERENCES public.warehouses(id);


-- Completed on 2026-03-12 21:43:41 CET

--
-- PostgreSQL database dump complete
--

\unrestrict I7fuCt7snBHlsEB3dD17wKztxAf4McPCeu7df2RBvE3VmJ0Ey5suL7wlSuBdV6t

