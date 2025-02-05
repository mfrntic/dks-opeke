CREATE DATABASE tree_cadastre;

CREATE SCHEMA public;
CREATE SCHEMA security;

CREATE TABLE public.attribute_groups (
    attribute_group_name character varying(30) NOT NULL,
    attribute_group_label character varying(100) NOT NULL,
    attribute_group_ordinal integer DEFAULT 1 NOT NULL,
    is_enabled boolean DEFAULT true NOT NULL,
    CONSTRAINT attribute_groups_pkey PRIMARY KEY (attribute_group_name)
);

CREATE TABLE public.attributes (
    attribute_name character varying(30) NOT NULL,
    attribute_group_name character varying(30) NOT NULL,
    attribute_label character varying(200) NOT NULL,
    attribute_ordinal integer DEFAULT 1 NOT NULL,
    is_enabled boolean DEFAULT true NOT NULL,
    data_type character varying(10) DEFAULT 'text'::character varying NOT NULL,
    available_values json,
    feature_type_id integer,
    CONSTRAINT attributes_pkey PRIMARY KEY (attribute_name),
    CONSTRAINT fk_attribute_groups_attributes FOREIGN KEY (attribute_group_name) 
        REFERENCES public.attribute_groups(attribute_group_name) ON DELETE CASCADE
);

CREATE TABLE public.cadastres (
    cadastre_id integer NOT NULL GENERATED ALWAYS AS IDENTITY (
        START WITH 1 INCREMENT BY 1
    ),
    cadastre_name character varying(100) NOT NULL,
    date_created timestamp without time zone DEFAULT now() NOT NULL,
    cadastre_version integer DEFAULT 1 NOT NULL,
    cadastre_settings json,
    center_point public.geometry,
    cadastre_users integer[],
    CONSTRAINT pk_cadastre_id PRIMARY KEY (cadastre_id)
);

CREATE TABLE public.feature_attributes (
    feature_id uuid NOT NULL,
    attribute_name character varying(30) NOT NULL,
    attribute_value character varying(250) NOT NULL,
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    user_id integer,
    CONSTRAINT feature_attributes_pkey PRIMARY KEY (feature_id, attribute_name),
    CONSTRAINT fk_feature_attributes_attributes FOREIGN KEY (attribute_name) 
        REFERENCES public.attributes(attribute_name) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_feature_attributes_features FOREIGN KEY (feature_id) 
        REFERENCES public.features(feature_id) ON DELETE CASCADE
);

CREATE TABLE public.feature_photos (
    photo_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY (
        START WITH 1 INCREMENT BY 1
    ),
    feature_id uuid NOT NULL,
    photo_path character varying(255),
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    user_id integer,
    CONSTRAINT pk_photo_id PRIMARY KEY (photo_id),
    CONSTRAINT fk_feature_id FOREIGN KEY (feature_id) 
        REFERENCES public.features(feature_id)
);

CREATE TABLE public.feature_types (
    feature_type_id integer NOT NULL,
    feature_type_name character varying(50) NOT NULL,
    geometry_type character varying(15) DEFAULT 'POINT'::character varying NOT NULL,
    CONSTRAINT pk_feature_type_id PRIMARY KEY (feature_type_id),
    CONSTRAINT chk_geometry_type CHECK (((geometry_type)::text = ANY ((ARRAY[
        'POINT'::character varying, 
        'LINESTRING'::character varying, 
        'POLYGON'::character varying, 
        'MULTIPOINT'::character varying, 
        'MULTILINESTRING'::character varying, 
        'MULTIPOLYGON'::character varying, 
        'GEOMETRYCOLLECTION'::character varying
    ])::text[])))
);

CREATE TABLE public.features (
    feature_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    feature_tag character varying(10),
    cadastre_id integer NOT NULL,
    species_id integer,
    feature_type_id integer NOT NULL,
    geom public.geometry,
    note character varying(500),
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    user_id integer,
    CONSTRAINT pk_feature_id PRIMARY KEY (feature_id),
    CONSTRAINT fk_cadastre_id FOREIGN KEY (cadastre_id) 
        REFERENCES public.cadastres(cadastre_id) ON DELETE CASCADE,
    CONSTRAINT fk_feature_type_id FOREIGN KEY (feature_type_id) 
        REFERENCES public.feature_types(feature_type_id),
    CONSTRAINT fk_species_id FOREIGN KEY (species_id) 
        REFERENCES public.tree_species(species_id)
);

CREATE TABLE public.tree_species (
    species_id integer NOT NULL GENERATED ALWAYS AS IDENTITY (
        START WITH 1 INCREMENT BY 1
    ),
    species_scientific_name character varying(150) NOT NULL,
    species_croatian_name character varying(150),
    CONSTRAINT pk_species_id PRIMARY KEY (species_id)
);

CREATE TABLE security.roles (
    role_id integer NOT NULL GENERATED ALWAYS AS IDENTITY (
        START WITH 1 INCREMENT BY 1
    ),
    role_name character varying(50) NOT NULL,
    role_description text,
    CONSTRAINT roles_pkey PRIMARY KEY (role_id),
    CONSTRAINT roles_name_key UNIQUE (role_name)
);

CREATE TABLE security.user_roles (
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id),
    CONSTRAINT user_roles_role_id_fkey FOREIGN KEY (role_id) 
        REFERENCES security.roles(role_id) ON DELETE CASCADE,
    CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) 
        REFERENCES security.users(user_id) ON DELETE CASCADE
);

CREATE TABLE security.users (
    user_id integer NOT NULL GENERATED ALWAYS AS IDENTITY (
        START WITH 1 INCREMENT BY 1
    ),
    user_name character varying(50) NOT NULL,
    user_email character varying(100) NOT NULL,
    password_hash text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    system_user boolean DEFAULT false,
    CONSTRAINT users_pkey PRIMARY KEY (user_id),
    CONSTRAINT users_email_key UNIQUE (user_email),
    CONSTRAINT users_username_key UNIQUE (user_name)
);
