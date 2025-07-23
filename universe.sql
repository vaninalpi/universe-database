--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text,
    age_in_millons_of_years integer NOT NULL,
    galaxy_types character varying(30),
    distance_from_earth numeric,
    is_active boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    planet_id integer,
    description text,
    age_in_millons_of_years integer NOT NULL,
    distance_from_planet numeric,
    has_life boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    star_id integer,
    description text,
    age_in_millons_of_years integer NOT NULL,
    planet_types character varying(30),
    distance_from_earth numeric,
    has_life boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: space_mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_mission (
    space_mission_id integer NOT NULL,
    name character varying(50) NOT NULL,
    launch_date date,
    planet_id integer,
    moon_id integer,
    is_active boolean,
    description text
);


ALTER TABLE public.space_mission OWNER TO freecodecamp;

--
-- Name: space_mission_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_mission_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_mission_mission_id_seq OWNER TO freecodecamp;

--
-- Name: space_mission_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_mission_mission_id_seq OWNED BY public.space_mission.space_mission_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer,
    description text,
    age_in_millons_of_years integer NOT NULL,
    distance_from_earth numeric,
    is_active boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_mission space_mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission ALTER COLUMN space_mission_id SET DEFAULT nextval('public.space_mission_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Láctea', 'Nuestra galaxia espiral', 13600, 'Spiral', 0, true);
INSERT INTO public.galaxy VALUES (2, 'Andrómeda', 'Galaxia espiral más cercana', 10000, 'Spiral', 2.5, true);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Galaxia con prominente bulbo', 13200, 'Spiral', 29.3, true);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Galaxia con intensa actividad', 12000, 'Elliptical', 13.7, true);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Pequeña galaxia espiral', 5000, 'Spiral', 3.0, true);
INSERT INTO public.galaxy VALUES (6, 'Bode', 'Galaxia en la constelación Osa Mayor', 11000, 'Spiral', 12.0, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 'Nuestro satélite natural', 4500, 0.384, false);
INSERT INTO public.moon VALUES (2, 'Fobos', 2, 'Luna marciana irregular', 4500, 0.009, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 'Luna marciana pequeña', 4500, 0.023, false);
INSERT INTO public.moon VALUES (4, 'Ío', 3, 'Luna volcánica', 4500, 0.422, false);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 'Con océano subsuperficial', 4500, 0.671, false);
INSERT INTO public.moon VALUES (6, 'Ganímedes', 3, 'Luna más grande del sistema', 4500, 1.07, false);
INSERT INTO public.moon VALUES (7, 'Calisto', 3, 'Luna con muchos cráteres', 4500, 1.88, false);
INSERT INTO public.moon VALUES (8, 'Titán', 5, 'Con atmósfera densa', 4500, 1.22, false);
INSERT INTO public.moon VALUES (9, 'Encélado', 5, 'Con géiseres de agua', 4500, 0.238, false);
INSERT INTO public.moon VALUES (10, 'Mimas', 5, '"Estrella de la muerte"', 4500, 0.186, false);
INSERT INTO public.moon VALUES (11, 'Rea', 5, 'Luna con anillos tenues', 4500, 0.527, false);
INSERT INTO public.moon VALUES (12, 'Tritón', 8, 'Luna con géiseres de nitrógeno', 4500, 0.354, false);
INSERT INTO public.moon VALUES (13, 'Miranda', 9, 'Superficie caótica', 4500, 0.129, false);
INSERT INTO public.moon VALUES (14, 'Ariel', 9, 'Con cañones profundos', 4500, 0.191, false);
INSERT INTO public.moon VALUES (15, 'Umbriel', 9, 'Luna oscura', 4500, 0.266, false);
INSERT INTO public.moon VALUES (16, 'Titania', 9, 'Luna más grande de Urano', 4500, 0.436, false);
INSERT INTO public.moon VALUES (17, 'Oberón', 9, 'Luna con muchos cráteres', 4500, 0.583, false);
INSERT INTO public.moon VALUES (18, 'Caronte', 10, 'Luna de Plutón', 4500, 0.019, false);
INSERT INTO public.moon VALUES (19, 'Nereida', 8, 'Luna con órbita excéntrica', 4500, 5.513, false);
INSERT INTO public.moon VALUES (20, 'Hiperión', 5, 'Luna esponjosa', 4500, 1.481, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Tierra', 1, 'Nuestro planeta', 4540, 'Terrestrial', 0, true);
INSERT INTO public.planet VALUES (2, 'Marte', 1, 'Planeta rojo', 4540, 'Terrestrial', 0.372, false);
INSERT INTO public.planet VALUES (3, 'Júpiter', 1, 'Gigante gaseoso', 4540, 'Gas Giant', 4.2, false);
INSERT INTO public.planet VALUES (4, 'Venus', 1, 'Planeta más caliente', 4540, 'Terrestrial', 0.28, false);
INSERT INTO public.planet VALUES (5, 'Saturno', 1, 'Con anillos prominentes', 4540, 'Gas Giant', 8.52, false);
INSERT INTO public.planet VALUES (6, 'Proxima b', 3, 'Exoplaneta en zona habitable', 4850, 'Terrestrial', 4.24, false);
INSERT INTO public.planet VALUES (7, 'Kepler-186f', 4, 'Exoplaneta similar a Tierra', 4000, 'Terrestrial', 492, false);
INSERT INTO public.planet VALUES (8, 'Neptuno', 1, 'Gigante de hielo', 4540, 'Ice Giant', 29.09, false);
INSERT INTO public.planet VALUES (9, 'Urano', 1, 'Gigante de hielo inclinado', 4540, 'Ice Giant', 18.21, false);
INSERT INTO public.planet VALUES (10, 'Mercurio', 1, 'Planeta más pequeño', 4540, 'Terrestrial', 0.61, false);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 2, 'Planeta con atmósfera', 3000, 'Gas Giant', 154, false);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 5, 'Exoplaneta potencialmente habitable', 7500, 'Terrestrial', 39.6, false);


--
-- Data for Name: space_mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_mission VALUES (1, 'Apollo 11', '1969-07-16', 1, 1, false, 'Primer alunizaje humano en la Luna (Tierra → Luna)');
INSERT INTO public.space_mission VALUES (2, 'Mars Rover Perseverance', '2020-07-30', 2, NULL, true, 'Exploración de Marte y búsqueda de signos de vida antigua');
INSERT INTO public.space_mission VALUES (3, 'Voyager 2', '1977-08-20', 8, 12, false, 'Sonda que estudió los planetas exteriores y su luna Tritón');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 'Nuestra estrella', 4600, 0, true);
INSERT INTO public.star VALUES (2, 'Sirio', 2, 'Estrella más brillante', 230, 8.6, true);
INSERT INTO public.star VALUES (3, 'Alfa Centauri', 3, 'Sistema estelar más cercano', 6000, 4.37, true);
INSERT INTO public.star VALUES (4, 'Vega', 1, 'Estrella de verano', 455, 25.04, true);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 'Supergigante roja', 8, 642.5, true);
INSERT INTO public.star VALUES (6, 'Polaris', 1, 'Estrella polar', 70, 433, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_mission_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_mission_mission_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: space_mission space_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_name_key UNIQUE (name);


--
-- Name: space_mission space_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_pkey PRIMARY KEY (space_mission_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: space_mission space_mission_target_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_target_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: space_mission space_mission_target_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_target_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

