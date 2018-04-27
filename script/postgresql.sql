-- Postgresql 9.6

CREATE SEQUENCE public.employee_seq
INCREMENT 1
START 1
MINVALUE 1
MAXVALUE 9223372036854775807
CACHE 1;

ALTER SEQUENCE public.employee_seq
OWNER TO postgres;

CREATE SEQUENCE public.company_seq
INCREMENT 1
START 1
MINVALUE 1
MAXVALUE 9223372036854775807
CACHE 1;

ALTER SEQUENCE public.company_seq
OWNER TO postgres;

CREATE SEQUENCE public.country_seq
INCREMENT 1
START 1
MINVALUE 1
MAXVALUE 9223372036854775807
CACHE 1;

ALTER SEQUENCE public.country_seq
OWNER TO postgres;

CREATE SEQUENCE public.sq_entity
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.sq_entity
    OWNER TO postgres;

CREATE SEQUENCE public.sq_person
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.sq_person
    OWNER TO postgres;

CREATE SEQUENCE public.sq_person3
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.sq_person3
    OWNER TO postgres;

CREATE SEQUENCE public.sq_employee
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.sq_employee
    OWNER TO postgres;

CREATE SEQUENCE public.sq_employee3
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.sq_employee3
    OWNER TO postgres;

CREATE SEQUENCE public.sq_owner
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.sq_owner
    OWNER TO postgres;

CREATE SEQUENCE public.sq_owner2
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.sq_owner2
    OWNER TO postgres;



-- Table: public.employee

-- DROP TABLE public.employee;

CREATE TABLE public.employee
(
  emp_id integer NOT NULL DEFAULT nextval('employee_seq'::regclass),
  emp_name character varying(28) COLLATE pg_catalog."default" NOT NULL,
  emp_role character varying(28) COLLATE pg_catalog."default" NOT NULL,
  sys_creation timestamp with time zone NOT NULL,
  CONSTRAINT employee_pkey PRIMARY KEY (emp_id)
)
WITH (
OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.employee
  OWNER to postgres;



-- Table: public.company

-- DROP TABLE public.company;

CREATE TABLE public.company
(
  com_id integer NOT NULL DEFAULT nextval('company_seq'::regclass),
  com_name character varying(56) COLLATE pg_catalog."default" NOT NULL,
  com_country character varying(56) COLLATE pg_catalog."default" NOT NULL,
  com_email character varying(128) COLLATE pg_catalog."default" NOT NULL,
  CONSTRAINT company_pkey PRIMARY KEY (com_id)
)
WITH (
OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.company
  OWNER to postgres;



-- Table: public.country

-- DROP TABLE public.country;

CREATE TABLE public.country
(
  cou_id integer NOT NULL DEFAULT nextval('country_seq'::regclass),
  cou_code character varying(10) COLLATE pg_catalog."default" NOT NULL,
  cou_name character varying(128) COLLATE pg_catalog."default" NOT NULL,
  CONSTRAINT country_pkey PRIMARY KEY (cou_id)
)
WITH (
OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.country
  OWNER to postgres;



-- Table: public.entity

-- DROP TABLE public.entity;

CREATE TABLE public.entity
(
    ent_id integer NOT NULL,
    ent_first_name character varying(50) COLLATE pg_catalog."default",
    ent_last_name character varying(50) COLLATE pg_catalog."default",
    ent_joining_date timestamp without time zone,
    ent_department_name character varying(100) COLLATE pg_catalog."default",
    ent_discriminator character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT entity_pkey PRIMARY KEY (ent_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.ENTITY
    OWNER to postgres;



-- Table: public.person

-- DROP TABLE public.person;

CREATE TABLE public.person
(
    per_person_id integer NOT NULL,
    per_first_name character varying(50) COLLATE pg_catalog."default",
    per_last_name character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT person_pkey PRIMARY KEY (per_person_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.person
    OWNER to postgres;



-- Table: public.person3

-- DROP TABLE public.person3;

CREATE TABLE public.person3
(
    per_person_id integer NOT NULL,
    per_first_name character varying(50) COLLATE pg_catalog."default",
    per_last_name character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT person_pkey3 PRIMARY KEY (per_person_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.person3
    OWNER to postgres;



-- Table: public.employee

-- DROP TABLE public.employee;

CREATE TABLE public.employee
(
    per_person_id integer NOT NULL,
    per_first_name character varying(50) COLLATE pg_catalog."default",
    per_last_name character varying(50) COLLATE pg_catalog."default",
    joining_date timestamp without time zone,
	  department_name character varying(50),
    CONSTRAINT employee_pkey PRIMARY KEY (per_person_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.employee
    OWNER to postgres;



-- Table: public.employee3

-- DROP TABLE public.employee3;

CREATE TABLE public.employee3
(
    per_person_id integer NOT NULL,
    joining_date timestamp without time zone,
	  department_name character varying(50),
    CONSTRAINT employee_pkey3 PRIMARY KEY (per_person_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.employee3
    OWNER to postgres;



-- Table: public.owner

-- DROP TABLE public.owner;

CREATE TABLE public.owner
(
    per_person_id integer NOT NULL,
    per_first_name character varying(50) COLLATE pg_catalog."default",
    per_last_name character varying(50) COLLATE pg_catalog."default",
    stocks integer,
	  partnership_stake integer,
    CONSTRAINT owner_pkey PRIMARY KEY (per_person_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.owner
    OWNER to postgres;



-- Table: public.owner2

-- DROP TABLE public.owner2;

CREATE TABLE public.owner2
(
    per_person_id integer NOT NULL,
    stocks integer,
	  partnership_stake integer,
    CONSTRAINT owner_pkey2 PRIMARY KEY (per_person_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.owner2
    OWNER to postgres;