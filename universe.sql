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
    name character varying(30) NOT NULL,
    est_total_stars_bn integer,
    est_distance_ly integer,
    blurb text
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    has_gas boolean,
    blurb text
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
-- Name: other_bodies; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.other_bodies (
    other_bodies_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    blurb text
);


ALTER TABLE public.other_bodies OWNER TO freecodecamp;

--
-- Name: other_bodies_other_bodies_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.other_bodies_other_bodies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_bodies_other_bodies_id_seq OWNER TO freecodecamp;

--
-- Name: other_bodies_other_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.other_bodies_other_bodies_id_seq OWNED BY public.other_bodies.other_bodies_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    avg_temp numeric(5,2),
    blurb text,
    has_gas boolean
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    blurb text,
    est_distance_ly integer
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
-- Name: other_bodies other_bodies_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_bodies ALTER COLUMN other_bodies_id SET DEFAULT nextval('public.other_bodies_other_bodies_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 0, 'The galaxy containing the Sun and its Solar System, and therefore Earth.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 0, 0, 'Andromeda, which is shortened from "Andromeda Galaxy", gets its name from the area of the sky in which it appears, the constellation of Andromeda.');
INSERT INTO public.galaxy VALUES (3, 'Sombrero Galaxy', 0, 0, 'Also known as Messier Object 104 or M104');
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 0, 0, 'Appears similar in shape to a cigar. Also known as Messier 82 or M82');
INSERT INTO public.galaxy VALUES (5, 'Cartwheel Galaxy', 0, 0, 'The largest in the Cartwheel Galaxy group, made up of four spiral galaxies');
INSERT INTO public.galaxy VALUES (6, 'Black Eye Galaxy', 0, 0, 'It has a spectacular dark band of absorbing dust in front of the galaxy bright nucleus, giving rise to its nicknames of the Black Eye or Evil Eye galaxy.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, false, 'Earth has this one solitary satallite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 'Phobos is on a collision course with Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 'Deimos is a small and lumpy, heavily cratered object.');
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, true, 'Ganymede is the largest moon in our solar system, even bigger than the planet Mercury');
INSERT INTO public.moon VALUES (5, 'Callisto', 5, false, 'Callisto is Jupiters second largest moon and the third largest moon in our solar system.');
INSERT INTO public.moon VALUES (6, 'Io', 5, true, 'Io is the most volcanically active world in our solar system.');
INSERT INTO public.moon VALUES (7, 'Europa', 5, true, 'Beneath the icy surface is a saltwater ocean with twice as much water as Earth');
INSERT INTO public.moon VALUES (8, 'Titan', 6, true, 'Only place besides Earth known to have liquids in the form of rivers, lakes and seas on its surface.');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, true, 'Icy particles spread out into space around its orbit, circling the planet to form the E ring.');
INSERT INTO public.moon VALUES (10, 'Hyperion', 6, false, 'Hyperion rotates roughly every 13 days during its 21 day orbit.');
INSERT INTO public.moon VALUES (11, 'Prometheus', 6, false, '');
INSERT INTO public.moon VALUES (12, 'Pandora', 6, false, '');
INSERT INTO public.moon VALUES (13, 'Janus', 6, false, '');
INSERT INTO public.moon VALUES (14, 'Epimetheus', 6, false, '');
INSERT INTO public.moon VALUES (15, 'Mimas', 6, false, '');
INSERT INTO public.moon VALUES (16, 'Iapetus', 6, false, '');
INSERT INTO public.moon VALUES (17, 'Phoebe', 6, false, '');
INSERT INTO public.moon VALUES (18, 'Tethys', 6, false, 'Giovanni Cassini discovered Tethys on March 21, 1684.');
INSERT INTO public.moon VALUES (19, 'Telesto', 6, false, '');
INSERT INTO public.moon VALUES (20, 'Atlas', 6, false, '');
INSERT INTO public.moon VALUES (21, 'Pan', 6, false, '');
INSERT INTO public.moon VALUES (22, 'Ymir', 6, false, '');


--
-- Data for Name: other_bodies; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 7, 440.00, 'Mercury is the closest planet to the Sun. It is only 58 million km / 36 million mi or 0.39 AU away. Though it is the closest, it isnt the hottest planet in the Solar System', false);
INSERT INTO public.planet VALUES (2, 'Venus', 7, 737.00, 'The temperatures are around 462 degrees Celsius, about four and a half times the amount of heat needed to evaporate water.', true);
INSERT INTO public.planet VALUES (3, 'Earth', 7, 288.00, 'Earth is the biggest terrestrial planet having a diameter of 12.760 km / 7.926 mi. ', true);
INSERT INTO public.planet VALUES (4, 'Mars', 7, 208.00, 'known as the Red Planet due to its reddish hue primarily because of its iron oxide on its surface, Mars is very similar to Earth.', true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 7, 163.00, 'It is 317 times more massive than Earth and 2.5 times larger than all the other planets combined.', true);
INSERT INTO public.planet VALUES (6, 'Saturn', 7, 133.00, 'The gas giant has been recently crowned as the king of the moons since it has 82 confirmed satellites.', true);
INSERT INTO public.planet VALUES (7, 'Uranus', 7, 78.00, 'classified as an ice giant due to the presence of ammonia, methane, water, and hydrocarbons in ice form.', true);
INSERT INTO public.planet VALUES (8, 'Neptune', 7, 72.00, 'It has a series of faint planetary rings, around 14 confirmed moons, and it has the fastest wind speeds of any planet', true);
INSERT INTO public.planet VALUES (9, 'Pluto', 7, 47.00, 'Actually a dwarf planet. Visited by New Horizons for detailed analysis.', true);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 1, 288.00, 'Its mass is at least 1.3 times that of Earth and thus is deemed a rocky planet like Earth.', false);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri c', 1, 200.00, 'Proxima c has a mass about 5.8 times of Earth and has an orbital period of 5.2 years.', false);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri d', 1, 72.00, 'not within habitable zone and has a mass at least 0.26 times that of Earth, making it one of the lightest known extrasolar planets.', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 1, '', 4);
INSERT INTO public.star VALUES (2, 'Rigil Kentaurus', 1, '', 4);
INSERT INTO public.star VALUES (3, 'Sirius A', 1, '', 9);
INSERT INTO public.star VALUES (4, 'Tau Ceti', 1, '', 12);
INSERT INTO public.star VALUES (5, 'Vega', 1, '', 25);
INSERT INTO public.star VALUES (6, 'Arcturus', 1, '', 37);
INSERT INTO public.star VALUES (7, 'Sun', 1, '', 0);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: other_bodies_other_bodies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.other_bodies_other_bodies_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: other_bodies other_bodies_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_bodies
    ADD CONSTRAINT other_bodies_name_key UNIQUE (name);


--
-- Name: other_bodies other_bodies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_bodies
    ADD CONSTRAINT other_bodies_pkey PRIMARY KEY (other_bodies_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: other_bodies fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_bodies
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

