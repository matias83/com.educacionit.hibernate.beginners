-- Postgresql 9.6


CREATE SEQUENCE public.employee_seq
INCREMENT 1
START 1
MINVALUE 1
MAXVALUE 9223372036854775807
CACHE 1;

ALTER SEQUENCE public.employee_seq
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