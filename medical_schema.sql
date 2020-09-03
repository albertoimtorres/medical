-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION amoreno;

COMMENT ON SCHEMA public IS 'standard public schema';

-- DROP TYPE _auth_group;

CREATE TYPE _auth_group (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = auth_group,
	DELIMITER = ',');

-- DROP TYPE _auth_group_permissions;

CREATE TYPE _auth_group_permissions (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = auth_group_permissions,
	DELIMITER = ',');

-- DROP TYPE _auth_permission;

CREATE TYPE _auth_permission (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = auth_permission,
	DELIMITER = ',');

-- DROP TYPE _auth_user;

CREATE TYPE _auth_user (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = auth_user,
	DELIMITER = ',');

-- DROP TYPE _auth_user_groups;

CREATE TYPE _auth_user_groups (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = auth_user_groups,
	DELIMITER = ',');

-- DROP TYPE _auth_user_user_permissions;

CREATE TYPE _auth_user_user_permissions (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = auth_user_user_permissions,
	DELIMITER = ',');

-- DROP TYPE _django_admin_log;

CREATE TYPE _django_admin_log (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = django_admin_log,
	DELIMITER = ',');

-- DROP TYPE _django_content_type;

CREATE TYPE _django_content_type (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = django_content_type,
	DELIMITER = ',');

-- DROP TYPE _django_migrations;

CREATE TYPE _django_migrations (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = django_migrations,
	DELIMITER = ',');

-- DROP TYPE _django_session;

CREATE TYPE _django_session (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = django_session,
	DELIMITER = ',');

-- DROP TYPE _paciente_paciente;

CREATE TYPE _paciente_paciente (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 8,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = paciente_paciente,
	DELIMITER = ',');

-- DROP TYPE auth_group;

CREATE TYPE auth_group AS (
	id int4,
	"name" varchar(150));

-- DROP TYPE auth_group_permissions;

CREATE TYPE auth_group_permissions AS (
	id int4,
	group_id int4,
	permission_id int4);

-- DROP TYPE auth_permission;

CREATE TYPE auth_permission AS (
	id int4,
	"name" varchar(255),
	content_type_id int4,
	codename varchar(100));

-- DROP TYPE auth_user;

CREATE TYPE auth_user AS (
	id int4,
	"password" varchar(128),
	last_login timestamptz(6),
	is_superuser bool,
	username varchar(150),
	first_name varchar(30),
	last_name varchar(150),
	email varchar(254),
	is_staff bool,
	is_active bool,
	date_joined timestamptz(6));

-- DROP TYPE auth_user_groups;

CREATE TYPE auth_user_groups AS (
	id int4,
	user_id int4,
	group_id int4);

-- DROP TYPE auth_user_user_permissions;

CREATE TYPE auth_user_user_permissions AS (
	id int4,
	user_id int4,
	permission_id int4);

-- DROP TYPE django_admin_log;

CREATE TYPE django_admin_log AS (
	id int4,
	action_time timestamptz(6),
	object_id text,
	object_repr varchar(200),
	action_flag int2,
	change_message text,
	content_type_id int4,
	user_id int4);

-- DROP TYPE django_content_type;

CREATE TYPE django_content_type AS (
	id int4,
	app_label varchar(100),
	model varchar(100));

-- DROP TYPE django_migrations;

CREATE TYPE django_migrations AS (
	id int4,
	app varchar(255),
	"name" varchar(255),
	applied timestamptz(6));

-- DROP TYPE django_session;

CREATE TYPE django_session AS (
	session_key varchar(40),
	session_data text,
	expire_date timestamptz(6));

-- DROP TYPE paciente_paciente;

CREATE TYPE paciente_paciente AS (
	id int4,
	no_expediente int4,
	tipo_sangre varchar(3),
	alergias _varchar);

-- DROP SEQUENCE public.auth_group_id_seq;

CREATE SEQUENCE public.auth_group_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.auth_group_id_seq OWNER TO "admin";
GRANT ALL ON SEQUENCE public.auth_group_id_seq TO "admin";

-- DROP SEQUENCE public.auth_group_permissions_id_seq;

CREATE SEQUENCE public.auth_group_permissions_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNER TO "admin";
GRANT ALL ON SEQUENCE public.auth_group_permissions_id_seq TO "admin";

-- DROP SEQUENCE public.auth_permission_id_seq;

CREATE SEQUENCE public.auth_permission_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.auth_permission_id_seq OWNER TO "admin";
GRANT ALL ON SEQUENCE public.auth_permission_id_seq TO "admin";

-- DROP SEQUENCE public.auth_user_groups_id_seq;

CREATE SEQUENCE public.auth_user_groups_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.auth_user_groups_id_seq OWNER TO "admin";
GRANT ALL ON SEQUENCE public.auth_user_groups_id_seq TO "admin";

-- DROP SEQUENCE public.auth_user_id_seq;

CREATE SEQUENCE public.auth_user_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.auth_user_id_seq OWNER TO "admin";
GRANT ALL ON SEQUENCE public.auth_user_id_seq TO "admin";

-- DROP SEQUENCE public.auth_user_user_permissions_id_seq;

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNER TO "admin";
GRANT ALL ON SEQUENCE public.auth_user_user_permissions_id_seq TO "admin";

-- DROP SEQUENCE public.django_admin_log_id_seq;

CREATE SEQUENCE public.django_admin_log_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.django_admin_log_id_seq OWNER TO "admin";
GRANT ALL ON SEQUENCE public.django_admin_log_id_seq TO "admin";

-- DROP SEQUENCE public.django_content_type_id_seq;

CREATE SEQUENCE public.django_content_type_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.django_content_type_id_seq OWNER TO "admin";
GRANT ALL ON SEQUENCE public.django_content_type_id_seq TO "admin";

-- DROP SEQUENCE public.django_migrations_id_seq;

CREATE SEQUENCE public.django_migrations_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.django_migrations_id_seq OWNER TO "admin";
GRANT ALL ON SEQUENCE public.django_migrations_id_seq TO "admin";

-- DROP SEQUENCE public.paciente_paciente_id_seq;

CREATE SEQUENCE public.paciente_paciente_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.paciente_paciente_id_seq OWNER TO "admin";
GRANT ALL ON SEQUENCE public.paciente_paciente_id_seq TO "admin";
-- public.auth_group definition

-- Drop table

-- DROP TABLE public.auth_group;

CREATE TABLE public.auth_group (
	id serial NOT NULL,
	"name" varchar(150) NOT NULL,
	CONSTRAINT auth_group_name_key UNIQUE (name),
	CONSTRAINT auth_group_pkey PRIMARY KEY (id)
);
CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);

-- Permissions

ALTER TABLE public.auth_group OWNER TO "admin";
GRANT ALL ON TABLE public.auth_group TO "admin";


-- public.auth_user definition

-- Drop table

-- DROP TABLE public.auth_user;

CREATE TABLE public.auth_user (
	id serial NOT NULL,
	"password" varchar(128) NOT NULL,
	last_login timestamptz NULL,
	is_superuser bool NOT NULL,
	username varchar(150) NOT NULL,
	first_name varchar(30) NOT NULL,
	last_name varchar(150) NOT NULL,
	email varchar(254) NOT NULL,
	is_staff bool NOT NULL,
	is_active bool NOT NULL,
	date_joined timestamptz NOT NULL,
	CONSTRAINT auth_user_pkey PRIMARY KEY (id),
	CONSTRAINT auth_user_username_key UNIQUE (username)
);
CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);

-- Permissions

ALTER TABLE public.auth_user OWNER TO "admin";
GRANT ALL ON TABLE public.auth_user TO "admin";


-- public.django_content_type definition

-- Drop table

-- DROP TABLE public.django_content_type;

CREATE TABLE public.django_content_type (
	id serial NOT NULL,
	app_label varchar(100) NOT NULL,
	model varchar(100) NOT NULL,
	CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model),
	CONSTRAINT django_content_type_pkey PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.django_content_type OWNER TO "admin";
GRANT ALL ON TABLE public.django_content_type TO "admin";


-- public.django_migrations definition

-- Drop table

-- DROP TABLE public.django_migrations;

CREATE TABLE public.django_migrations (
	id serial NOT NULL,
	app varchar(255) NOT NULL,
	"name" varchar(255) NOT NULL,
	applied timestamptz NOT NULL,
	CONSTRAINT django_migrations_pkey PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.django_migrations OWNER TO "admin";
GRANT ALL ON TABLE public.django_migrations TO "admin";


-- public.django_session definition

-- Drop table

-- DROP TABLE public.django_session;

CREATE TABLE public.django_session (
	session_key varchar(40) NOT NULL,
	session_data text NOT NULL,
	expire_date timestamptz NOT NULL,
	CONSTRAINT django_session_pkey PRIMARY KEY (session_key)
);
CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);

-- Permissions

ALTER TABLE public.django_session OWNER TO "admin";
GRANT ALL ON TABLE public.django_session TO "admin";


-- public.paciente_paciente definition

-- Drop table

-- DROP TABLE public.paciente_paciente;

CREATE TABLE public.paciente_paciente (
	id serial NOT NULL,
	no_expediente int4 NOT NULL,
	tipo_sangre varchar(3) NOT NULL,
	alergias _varchar NOT NULL,
	CONSTRAINT paciente_paciente_no_expediente_key UNIQUE (no_expediente),
	CONSTRAINT paciente_paciente_pkey PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.paciente_paciente OWNER TO "admin";
GRANT ALL ON TABLE public.paciente_paciente TO "admin";


-- public.auth_permission definition

-- Drop table

-- DROP TABLE public.auth_permission;

CREATE TABLE public.auth_permission (
	id serial NOT NULL,
	"name" varchar(255) NOT NULL,
	content_type_id int4 NOT NULL,
	codename varchar(100) NOT NULL,
	CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename),
	CONSTRAINT auth_permission_pkey PRIMARY KEY (id),
	CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED
);
CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);

-- Permissions

ALTER TABLE public.auth_permission OWNER TO "admin";
GRANT ALL ON TABLE public.auth_permission TO "admin";


-- public.auth_user_groups definition

-- Drop table

-- DROP TABLE public.auth_user_groups;

CREATE TABLE public.auth_user_groups (
	id serial NOT NULL,
	user_id int4 NOT NULL,
	group_id int4 NOT NULL,
	CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id),
	CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id),
	CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED,
	CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED
);
CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);

-- Permissions

ALTER TABLE public.auth_user_groups OWNER TO "admin";
GRANT ALL ON TABLE public.auth_user_groups TO "admin";


-- public.auth_user_user_permissions definition

-- Drop table

-- DROP TABLE public.auth_user_user_permissions;

CREATE TABLE public.auth_user_user_permissions (
	id serial NOT NULL,
	user_id int4 NOT NULL,
	permission_id int4 NOT NULL,
	CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id),
	CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id),
	CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED,
	CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED
);
CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);

-- Permissions

ALTER TABLE public.auth_user_user_permissions OWNER TO "admin";
GRANT ALL ON TABLE public.auth_user_user_permissions TO "admin";


-- public.django_admin_log definition

-- Drop table

-- DROP TABLE public.django_admin_log;

CREATE TABLE public.django_admin_log (
	id serial NOT NULL,
	action_time timestamptz NOT NULL,
	object_id text NULL,
	object_repr varchar(200) NOT NULL,
	action_flag int2 NOT NULL,
	change_message text NOT NULL,
	content_type_id int4 NULL,
	user_id int4 NOT NULL,
	CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0)),
	CONSTRAINT django_admin_log_pkey PRIMARY KEY (id),
	CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED,
	CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED
);
CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);

-- Permissions

ALTER TABLE public.django_admin_log OWNER TO "admin";
GRANT ALL ON TABLE public.django_admin_log TO "admin";


-- public.auth_group_permissions definition

-- Drop table

-- DROP TABLE public.auth_group_permissions;

CREATE TABLE public.auth_group_permissions (
	id serial NOT NULL,
	group_id int4 NOT NULL,
	permission_id int4 NOT NULL,
	CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id),
	CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id),
	CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED,
	CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED
);
CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);

-- Permissions

ALTER TABLE public.auth_group_permissions OWNER TO "admin";
GRANT ALL ON TABLE public.auth_group_permissions TO "admin";




-- Permissions

GRANT ALL ON SCHEMA public TO amoreno;
GRANT ALL ON SCHEMA public TO public;
