
DROP TABLE IF EXISTS archivo;
DROP TABLE IF EXISTS consulta_examen;
DROP TABLE IF EXISTS detalle_consulta;
DROP TABLE IF EXISTS consulta;
DROP TABLE IF EXISTS especialidad;
DROP TABLE IF EXISTS examen;
DROP TABLE IF EXISTS medico;
DROP TABLE IF EXISTS menu_rol;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS paciente;
DROP TABLE IF EXISTS reset_token;
DROP TABLE IF EXISTS usuario_rol;
DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS rol;

CREATE TABLE public.archivo (
    id_archivo integer NOT NULL,
    filename character varying(50),
    filetype character varying(15),
    contenido bytea
);


ALTER TABLE public.archivo OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16394)
-- Name: archivo_id_archivo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.archivo_id_archivo_seq
    
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.archivo_id_archivo_seq OWNER TO postgres;

--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 196
-- Name: archivo_id_archivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.archivo_id_archivo_seq OWNED BY public.archivo.id_archivo;


--
-- TOC entry 199 (class 1259 OID 16407)
-- Name: consulta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consulta (
    id_consulta integer NOT NULL,
    fecha timestamp without time zone,
    num_consultorio character varying(3),
    id_especialidad integer NOT NULL,
    id_medico integer NOT NULL,
    id_paciente integer NOT NULL
);


ALTER TABLE public.consulta OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16413)
-- Name: consulta_examen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consulta_examen (
    id_consulta integer NOT NULL,
    id_examen integer NOT NULL
);


ALTER TABLE public.consulta_examen OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16405)
-- Name: consulta_id_consulta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.consulta_id_consulta_seq
    
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consulta_id_consulta_seq OWNER TO postgres;

--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 198
-- Name: consulta_id_consulta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.consulta_id_consulta_seq OWNED BY public.consulta.id_consulta;


--
-- TOC entry 202 (class 1259 OID 16420)
-- Name: detalle_consulta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_consulta (
    id_detalle integer NOT NULL,
    diagnostico character varying(70) NOT NULL,
    tratamiento character varying(300) NOT NULL,
    id_consulta integer NOT NULL
);


ALTER TABLE public.detalle_consulta OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16418)
-- Name: detalle_consulta_id_detalle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalle_consulta_id_detalle_seq
    
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalle_consulta_id_detalle_seq OWNER TO postgres;

--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 201
-- Name: detalle_consulta_id_detalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalle_consulta_id_detalle_seq OWNED BY public.detalle_consulta.id_detalle;


--
-- TOC entry 204 (class 1259 OID 16428)
-- Name: especialidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.especialidad (
    id_especialidad integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.especialidad OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16426)
-- Name: especialidad_id_especialidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.especialidad_id_especialidad_seq
    
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.especialidad_id_especialidad_seq OWNER TO postgres;

--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 203
-- Name: especialidad_id_especialidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.especialidad_id_especialidad_seq OWNED BY public.especialidad.id_especialidad;


--
-- TOC entry 206 (class 1259 OID 16436)
-- Name: examen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.examen (
    id_examen integer NOT NULL,
    descripcion character varying(150),
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.examen OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16434)
-- Name: examen_id_examen_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.examen_id_examen_seq
    
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.examen_id_examen_seq OWNER TO postgres;

--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 205
-- Name: examen_id_examen_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.examen_id_examen_seq OWNED BY public.examen.id_examen;


--
-- TOC entry 208 (class 1259 OID 16444)
-- Name: medico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medico (
    id_medico integer NOT NULL,
    cmp character varying(12) NOT NULL,
    apellidos character varying(70) NOT NULL,
    foto_url character varying(255),
    nombres character varying(70) NOT NULL
);


ALTER TABLE public.medico OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16442)
-- Name: medico_id_medico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medico_id_medico_seq
    
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medico_id_medico_seq OWNER TO postgres;

--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 207
-- Name: medico_id_medico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medico_id_medico_seq OWNED BY public.medico.id_medico;


--
-- TOC entry 209 (class 1259 OID 16450)
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    id_menu integer NOT NULL,
    icono character varying(20),
    nombre character varying(20),
    url character varying(50)
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16455)
-- Name: menu_rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_rol (
    id_menu integer NOT NULL,
    id_rol integer NOT NULL
);


ALTER TABLE public.menu_rol OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16552)
-- Name: oauth_access_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_access_token (
    token_id character varying(256),
    token bytea,
    authentication_id character varying(256),
    user_name character varying(256),
    client_id character varying(256),
    authentication bytea,
    refresh_token character varying(256)
);


ALTER TABLE public.oauth_access_token OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16560)
-- Name: oauth_refresh_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_refresh_token (
    token_id character varying(256),
    token bytea,
    authentication bytea
);


ALTER TABLE public.oauth_refresh_token OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16460)
-- Name: paciente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paciente (
    id_paciente integer NOT NULL,
    apellidos character varying(70) NOT NULL,
    direccion character varying(150),
    dni character varying(8) NOT NULL,
    email character varying(55),
    nombres character varying(70) NOT NULL,
    telefono character varying(9)
);


ALTER TABLE public.paciente OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16458)
-- Name: paciente_id_paciente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paciente_id_paciente_seq
   
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paciente_id_paciente_seq OWNER TO postgres;

--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 211
-- Name: paciente_id_paciente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paciente_id_paciente_seq OWNED BY public.paciente.id_paciente;


--
-- TOC entry 214 (class 1259 OID 16468)
-- Name: reset_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reset_token (
    id integer NOT NULL,
    expiracion timestamp without time zone NOT NULL,
    token character varying(255) NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE public.reset_token OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16466)
-- Name: reset_token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reset_token_id_seq
    
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reset_token_id_seq OWNER TO postgres;

--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 213
-- Name: reset_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reset_token_id_seq OWNED BY public.reset_token.id;


--
-- TOC entry 215 (class 1259 OID 16474)
-- Name: rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rol (
    id_rol integer NOT NULL,
    descripcion character varying(255),
    nombre character varying(255)
);


ALTER TABLE public.rol OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16482)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    estado boolean NOT NULL,
    clave character varying(255) NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16490)
-- Name: usuario_rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_rol (
    id_usuario integer NOT NULL,
    id_rol integer NOT NULL
);


ALTER TABLE public.usuario_rol OWNER TO postgres;

--
-- TOC entry 2764 (class 2604 OID 16399)
-- Name: archivo id_archivo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archivo ALTER COLUMN id_archivo SET DEFAULT nextval('public.archivo_id_archivo_seq'::regclass);


--
-- TOC entry 2765 (class 2604 OID 16410)
-- Name: consulta id_consulta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consulta ALTER COLUMN id_consulta SET DEFAULT nextval('public.consulta_id_consulta_seq'::regclass);


--
-- TOC entry 2766 (class 2604 OID 16423)
-- Name: detalle_consulta id_detalle; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_consulta ALTER COLUMN id_detalle SET DEFAULT nextval('public.detalle_consulta_id_detalle_seq'::regclass);


--
-- TOC entry 2767 (class 2604 OID 16431)
-- Name: especialidad id_especialidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especialidad ALTER COLUMN id_especialidad SET DEFAULT nextval('public.especialidad_id_especialidad_seq'::regclass);


--
-- TOC entry 2768 (class 2604 OID 16439)
-- Name: examen id_examen; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.examen ALTER COLUMN id_examen SET DEFAULT nextval('public.examen_id_examen_seq'::regclass);


--
-- TOC entry 2769 (class 2604 OID 16447)
-- Name: medico id_medico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medico ALTER COLUMN id_medico SET DEFAULT nextval('public.medico_id_medico_seq'::regclass);


--
-- TOC entry 2770 (class 2604 OID 16463)
-- Name: paciente id_paciente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente ALTER COLUMN id_paciente SET DEFAULT nextval('public.paciente_id_paciente_seq'::regclass);


--
-- TOC entry 2771 (class 2604 OID 16471)
-- Name: reset_token id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reset_token ALTER COLUMN id SET DEFAULT nextval('public.reset_token_id_seq'::regclass);


--
-- TOC entry 2933 (class 0 OID 16396)
-- Dependencies: 197
-- Data for Name: archivo; Type: TABLE DATA; Schema: public; Owner: postgres
--