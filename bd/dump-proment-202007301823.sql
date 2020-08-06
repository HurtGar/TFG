PGDMP                         x           proment    12.3    12.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16392    proment    DATABASE     y   CREATE DATABASE proment WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE proment;
                adrian    false            �           0    0    DATABASE proment    COMMENT     L   COMMENT ON DATABASE proment IS 'Base de datos para la aplicación Proment';
                   adrian    false    3488                        2615    20709    gestion    SCHEMA        CREATE SCHEMA gestion;
    DROP SCHEMA gestion;
                adrian    false            �            1259    20904 
   auth_group    TABLE     g   CREATE TABLE gestion.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE gestion.auth_group;
       gestion         heap    adrian    false    3            �            1259    20902    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE gestion.auth_group_id_seq;
       gestion          adrian    false    3    229            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE gestion.auth_group_id_seq OWNED BY gestion.auth_group.id;
          gestion          adrian    false    228            �            1259    20914    auth_group_permissions    TABLE     �   CREATE TABLE gestion.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 +   DROP TABLE gestion.auth_group_permissions;
       gestion         heap    adrian    false    3            �            1259    20912    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE gestion.auth_group_permissions_id_seq;
       gestion          adrian    false    231    3            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE gestion.auth_group_permissions_id_seq OWNED BY gestion.auth_group_permissions.id;
          gestion          adrian    false    230            �            1259    20896    auth_permission    TABLE     �   CREATE TABLE gestion.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 $   DROP TABLE gestion.auth_permission;
       gestion         heap    adrian    false    3            �            1259    20894    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE gestion.auth_permission_id_seq;
       gestion          adrian    false    227    3            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE gestion.auth_permission_id_seq OWNED BY gestion.auth_permission.id;
          gestion          adrian    false    226            �            1259    20922 	   auth_user    TABLE     �  CREATE TABLE gestion.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE gestion.auth_user;
       gestion         heap    adrian    false    3            �            1259    20932    auth_user_groups    TABLE     �   CREATE TABLE gestion.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 %   DROP TABLE gestion.auth_user_groups;
       gestion         heap    adrian    false    3            �            1259    20930    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE gestion.auth_user_groups_id_seq;
       gestion          adrian    false    3    235            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE gestion.auth_user_groups_id_seq OWNED BY gestion.auth_user_groups.id;
          gestion          adrian    false    234            �            1259    20920    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE gestion.auth_user_id_seq;
       gestion          adrian    false    3    233            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE gestion.auth_user_id_seq OWNED BY gestion.auth_user.id;
          gestion          adrian    false    232            �            1259    20940    auth_user_user_permissions    TABLE     �   CREATE TABLE gestion.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 /   DROP TABLE gestion.auth_user_user_permissions;
       gestion         heap    adrian    false    3            �            1259    20938 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE gestion.auth_user_user_permissions_id_seq;
       gestion          adrian    false    237    3            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE gestion.auth_user_user_permissions_id_seq OWNED BY gestion.auth_user_user_permissions.id;
          gestion          adrian    false    236            �            1259    21031    authtoken_token    TABLE     �   CREATE TABLE gestion.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);
 $   DROP TABLE gestion.authtoken_token;
       gestion         heap    adrian    false    3            �            1259    20724    bloques    TABLE       CREATE TABLE gestion.bloques (
    idbloque integer NOT NULL,
    nombrebloque character varying(100) NOT NULL,
    descbloque character varying(1000) NOT NULL,
    fechacreacion timestamp with time zone NOT NULL,
    proyecto_idproyecto integer NOT NULL
);
    DROP TABLE gestion.bloques;
       gestion         heap    adrian    false    3            �            1259    20722    bloques_idbloque_seq    SEQUENCE     �   CREATE SEQUENCE gestion.bloques_idbloque_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE gestion.bloques_idbloque_seq;
       gestion          adrian    false    3    205            �           0    0    bloques_idbloque_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE gestion.bloques_idbloque_seq OWNED BY gestion.bloques.idbloque;
          gestion          adrian    false    204            �            1259    21000    django_admin_log    TABLE     �  CREATE TABLE gestion.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 %   DROP TABLE gestion.django_admin_log;
       gestion         heap    adrian    false    3            �            1259    20998    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE gestion.django_admin_log_id_seq;
       gestion          adrian    false    3    239            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE gestion.django_admin_log_id_seq OWNED BY gestion.django_admin_log.id;
          gestion          adrian    false    238            �            1259    20886    django_content_type    TABLE     �   CREATE TABLE gestion.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 (   DROP TABLE gestion.django_content_type;
       gestion         heap    adrian    false    3            �            1259    20884    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE gestion.django_content_type_id_seq;
       gestion          adrian    false    225    3            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE gestion.django_content_type_id_seq OWNED BY gestion.django_content_type.id;
          gestion          adrian    false    224            �            1259    20713    django_migrations    TABLE     �   CREATE TABLE gestion.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 &   DROP TABLE gestion.django_migrations;
       gestion         heap    adrian    false    3            �            1259    20711    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE gestion.django_migrations_id_seq;
       gestion          adrian    false    3    203            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE gestion.django_migrations_id_seq OWNED BY gestion.django_migrations.id;
          gestion          adrian    false    202            �            1259    21049    django_session    TABLE     �   CREATE TABLE gestion.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 #   DROP TABLE gestion.django_session;
       gestion         heap    adrian    false    3            �            1259    20735    estados    TABLE     o   CREATE TABLE gestion.estados (
    idestado integer NOT NULL,
    descestado character varying(50) NOT NULL
);
    DROP TABLE gestion.estados;
       gestion         heap    adrian    false    3            �            1259    20733    estados_idestado_seq    SEQUENCE     �   CREATE SEQUENCE gestion.estados_idestado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE gestion.estados_idestado_seq;
       gestion          adrian    false    207    3            �           0    0    estados_idestado_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE gestion.estados_idestado_seq OWNED BY gestion.estados.idestado;
          gestion          adrian    false    206            �            1259    20773    historialModificacionesTareas    TABLE     �   CREATE TABLE gestion."historialModificacionesTareas" (
    idhistorico integer NOT NULL,
    fechahistorico date NOT NULL,
    horahistorico time without time zone NOT NULL,
    idusuario integer NOT NULL,
    tareas_idtarea integer NOT NULL
);
 4   DROP TABLE gestion."historialModificacionesTareas";
       gestion         heap    adrian    false    3            �            1259    20771 -   historialModificacionesTareas_idhistorico_seq    SEQUENCE     �   CREATE SEQUENCE gestion."historialModificacionesTareas_idhistorico_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE gestion."historialModificacionesTareas_idhistorico_seq";
       gestion          adrian    false    3    215            �           0    0 -   historialModificacionesTareas_idhistorico_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE gestion."historialModificacionesTareas_idhistorico_seq" OWNED BY gestion."historialModificacionesTareas".idhistorico;
          gestion          adrian    false    214            �            1259    20743    prioridades    TABLE     �   CREATE TABLE gestion.prioridades (
    idprioridad integer NOT NULL,
    descprioridad character varying(50) NOT NULL,
    nivelprioridad integer NOT NULL
);
     DROP TABLE gestion.prioridades;
       gestion         heap    adrian    false    3            �            1259    20741    prioridades_idprioridad_seq    SEQUENCE     �   CREATE SEQUENCE gestion.prioridades_idprioridad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE gestion.prioridades_idprioridad_seq;
       gestion          adrian    false    209    3            �           0    0    prioridades_idprioridad_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE gestion.prioridades_idprioridad_seq OWNED BY gestion.prioridades.idprioridad;
          gestion          adrian    false    208            �            1259    20751 	   proyectos    TABLE        CREATE TABLE gestion.proyectos (
    idproyecto integer NOT NULL,
    nombreproyecto character varying(100) NOT NULL,
    descproyecto character varying(500) NOT NULL,
    inicioproyecto date NOT NULL,
    finproyecto date NOT NULL,
    fechacreacion timestamp with time zone NOT NULL
);
    DROP TABLE gestion.proyectos;
       gestion         heap    adrian    false    3            �            1259    20749    proyectos_idproyecto_seq    SEQUENCE     �   CREATE SEQUENCE gestion.proyectos_idproyecto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE gestion.proyectos_idproyecto_seq;
       gestion          adrian    false    211    3            �           0    0    proyectos_idproyecto_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE gestion.proyectos_idproyecto_seq OWNED BY gestion.proyectos.idproyecto;
          gestion          adrian    false    210            �            1259    20857    registroEntradaUsuarios    TABLE     �   CREATE TABLE gestion."registroEntradaUsuarios" (
    idregistroacceso integer NOT NULL,
    fechaacceso date NOT NULL,
    horaacceso time without time zone NOT NULL,
    ipacceso character varying(45) NOT NULL,
    usuario_idusuario integer NOT NULL
);
 .   DROP TABLE gestion."registroEntradaUsuarios";
       gestion         heap    adrian    false    3            �            1259    20855 ,   registroEntradaUsuarios_idregistroacceso_seq    SEQUENCE     �   CREATE SEQUENCE gestion."registroEntradaUsuarios_idregistroacceso_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE gestion."registroEntradaUsuarios_idregistroacceso_seq";
       gestion          adrian    false    223    3            �           0    0 ,   registroEntradaUsuarios_idregistroacceso_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE gestion."registroEntradaUsuarios_idregistroacceso_seq" OWNED BY gestion."registroEntradaUsuarios".idregistroacceso;
          gestion          adrian    false    222            �            1259    20825    roles    TABLE     �   CREATE TABLE gestion.roles (
    idrol integer NOT NULL,
    descrol character varying(45) NOT NULL,
    nivelrol integer NOT NULL
);
    DROP TABLE gestion.roles;
       gestion         heap    adrian    false    3            �            1259    20823    roles_idrol_seq    SEQUENCE     �   CREATE SEQUENCE gestion.roles_idrol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE gestion.roles_idrol_seq;
       gestion          adrian    false    217    3            �           0    0    roles_idrol_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE gestion.roles_idrol_seq OWNED BY gestion.roles.idrol;
          gestion          adrian    false    216            �            1259    20762    tareas    TABLE     �  CREATE TABLE gestion.tareas (
    idtarea integer NOT NULL,
    nombretarea character varying(100) NOT NULL,
    desctarea character varying(5000) NOT NULL,
    fechacreacion timestamp with time zone NOT NULL,
    "fechaInicio" date NOT NULL,
    fechafin date NOT NULL,
    fechaactualizacion timestamp with time zone NOT NULL,
    bloques_idbloque integer NOT NULL,
    estados_idestado integer,
    prioridades_idprioridad integer
);
    DROP TABLE gestion.tareas;
       gestion         heap    adrian    false    3            �            1259    20760    tareas_idtarea_seq    SEQUENCE     �   CREATE SEQUENCE gestion.tareas_idtarea_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE gestion.tareas_idtarea_seq;
       gestion          adrian    false    3    213            �           0    0    tareas_idtarea_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE gestion.tareas_idtarea_seq OWNED BY gestion.tareas.idtarea;
          gestion          adrian    false    212            �            1259    20833    tareasusuario    TABLE     �   CREATE TABLE gestion.tareasusuario (
    id integer NOT NULL,
    tareas_idtarea_id integer NOT NULL,
    usuarios_idusuario_id integer NOT NULL
);
 "   DROP TABLE gestion.tareasusuario;
       gestion         heap    adrian    false    3            �            1259    20831    tareasusuario_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion.tareasusuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE gestion.tareasusuario_id_seq;
       gestion          adrian    false    219    3            �           0    0    tareasusuario_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE gestion.tareasusuario_id_seq OWNED BY gestion.tareasusuario.id;
          gestion          adrian    false    218            �            1259    20841    usuarios    TABLE     �  CREATE TABLE gestion.usuarios (
    idusuario integer NOT NULL,
    nombre character varying(45) NOT NULL,
    primerapellido character varying(45) NOT NULL,
    segundoapellido character varying(45),
    telefono character varying(12),
    email character varying(254) NOT NULL,
    password character varying(200) NOT NULL,
    fecharegistro timestamp with time zone NOT NULL,
    estado integer NOT NULL,
    roles_idrol integer
);
    DROP TABLE gestion.usuarios;
       gestion         heap    adrian    false    3            �            1259    20839    usuarios_idusuario_seq    SEQUENCE     �   CREATE SEQUENCE gestion.usuarios_idusuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE gestion.usuarios_idusuario_seq;
       gestion          adrian    false    221    3            �           0    0    usuarios_idusuario_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE gestion.usuarios_idusuario_seq OWNED BY gestion.usuarios.idusuario;
          gestion          adrian    false    220            |           2604    20907    auth_group id    DEFAULT     p   ALTER TABLE ONLY gestion.auth_group ALTER COLUMN id SET DEFAULT nextval('gestion.auth_group_id_seq'::regclass);
 =   ALTER TABLE gestion.auth_group ALTER COLUMN id DROP DEFAULT;
       gestion          adrian    false    228    229    229            }           2604    20917    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY gestion.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('gestion.auth_group_permissions_id_seq'::regclass);
 I   ALTER TABLE gestion.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       gestion          adrian    false    230    231    231            {           2604    20899    auth_permission id    DEFAULT     z   ALTER TABLE ONLY gestion.auth_permission ALTER COLUMN id SET DEFAULT nextval('gestion.auth_permission_id_seq'::regclass);
 B   ALTER TABLE gestion.auth_permission ALTER COLUMN id DROP DEFAULT;
       gestion          adrian    false    226    227    227            ~           2604    20925    auth_user id    DEFAULT     n   ALTER TABLE ONLY gestion.auth_user ALTER COLUMN id SET DEFAULT nextval('gestion.auth_user_id_seq'::regclass);
 <   ALTER TABLE gestion.auth_user ALTER COLUMN id DROP DEFAULT;
       gestion          adrian    false    233    232    233                       2604    20935    auth_user_groups id    DEFAULT     |   ALTER TABLE ONLY gestion.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('gestion.auth_user_groups_id_seq'::regclass);
 C   ALTER TABLE gestion.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       gestion          adrian    false    234    235    235            �           2604    20943    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY gestion.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('gestion.auth_user_user_permissions_id_seq'::regclass);
 M   ALTER TABLE gestion.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       gestion          adrian    false    237    236    237            p           2604    20727    bloques idbloque    DEFAULT     v   ALTER TABLE ONLY gestion.bloques ALTER COLUMN idbloque SET DEFAULT nextval('gestion.bloques_idbloque_seq'::regclass);
 @   ALTER TABLE gestion.bloques ALTER COLUMN idbloque DROP DEFAULT;
       gestion          adrian    false    205    204    205            �           2604    21003    django_admin_log id    DEFAULT     |   ALTER TABLE ONLY gestion.django_admin_log ALTER COLUMN id SET DEFAULT nextval('gestion.django_admin_log_id_seq'::regclass);
 C   ALTER TABLE gestion.django_admin_log ALTER COLUMN id DROP DEFAULT;
       gestion          adrian    false    238    239    239            z           2604    20889    django_content_type id    DEFAULT     �   ALTER TABLE ONLY gestion.django_content_type ALTER COLUMN id SET DEFAULT nextval('gestion.django_content_type_id_seq'::regclass);
 F   ALTER TABLE gestion.django_content_type ALTER COLUMN id DROP DEFAULT;
       gestion          adrian    false    224    225    225            o           2604    20716    django_migrations id    DEFAULT     ~   ALTER TABLE ONLY gestion.django_migrations ALTER COLUMN id SET DEFAULT nextval('gestion.django_migrations_id_seq'::regclass);
 D   ALTER TABLE gestion.django_migrations ALTER COLUMN id DROP DEFAULT;
       gestion          adrian    false    202    203    203            q           2604    20738    estados idestado    DEFAULT     v   ALTER TABLE ONLY gestion.estados ALTER COLUMN idestado SET DEFAULT nextval('gestion.estados_idestado_seq'::regclass);
 @   ALTER TABLE gestion.estados ALTER COLUMN idestado DROP DEFAULT;
       gestion          adrian    false    206    207    207            u           2604    20776 )   historialModificacionesTareas idhistorico    DEFAULT     �   ALTER TABLE ONLY gestion."historialModificacionesTareas" ALTER COLUMN idhistorico SET DEFAULT nextval('gestion."historialModificacionesTareas_idhistorico_seq"'::regclass);
 [   ALTER TABLE gestion."historialModificacionesTareas" ALTER COLUMN idhistorico DROP DEFAULT;
       gestion          adrian    false    215    214    215            r           2604    20746    prioridades idprioridad    DEFAULT     �   ALTER TABLE ONLY gestion.prioridades ALTER COLUMN idprioridad SET DEFAULT nextval('gestion.prioridades_idprioridad_seq'::regclass);
 G   ALTER TABLE gestion.prioridades ALTER COLUMN idprioridad DROP DEFAULT;
       gestion          adrian    false    208    209    209            s           2604    20754    proyectos idproyecto    DEFAULT     ~   ALTER TABLE ONLY gestion.proyectos ALTER COLUMN idproyecto SET DEFAULT nextval('gestion.proyectos_idproyecto_seq'::regclass);
 D   ALTER TABLE gestion.proyectos ALTER COLUMN idproyecto DROP DEFAULT;
       gestion          adrian    false    210    211    211            y           2604    20860 (   registroEntradaUsuarios idregistroacceso    DEFAULT     �   ALTER TABLE ONLY gestion."registroEntradaUsuarios" ALTER COLUMN idregistroacceso SET DEFAULT nextval('gestion."registroEntradaUsuarios_idregistroacceso_seq"'::regclass);
 Z   ALTER TABLE gestion."registroEntradaUsuarios" ALTER COLUMN idregistroacceso DROP DEFAULT;
       gestion          adrian    false    223    222    223            v           2604    20828    roles idrol    DEFAULT     l   ALTER TABLE ONLY gestion.roles ALTER COLUMN idrol SET DEFAULT nextval('gestion.roles_idrol_seq'::regclass);
 ;   ALTER TABLE gestion.roles ALTER COLUMN idrol DROP DEFAULT;
       gestion          adrian    false    217    216    217            t           2604    20765    tareas idtarea    DEFAULT     r   ALTER TABLE ONLY gestion.tareas ALTER COLUMN idtarea SET DEFAULT nextval('gestion.tareas_idtarea_seq'::regclass);
 >   ALTER TABLE gestion.tareas ALTER COLUMN idtarea DROP DEFAULT;
       gestion          adrian    false    213    212    213            w           2604    20836    tareasusuario id    DEFAULT     v   ALTER TABLE ONLY gestion.tareasusuario ALTER COLUMN id SET DEFAULT nextval('gestion.tareasusuario_id_seq'::regclass);
 @   ALTER TABLE gestion.tareasusuario ALTER COLUMN id DROP DEFAULT;
       gestion          adrian    false    218    219    219            x           2604    20844    usuarios idusuario    DEFAULT     z   ALTER TABLE ONLY gestion.usuarios ALTER COLUMN idusuario SET DEFAULT nextval('gestion.usuarios_idusuario_seq'::regclass);
 B   ALTER TABLE gestion.usuarios ALTER COLUMN idusuario DROP DEFAULT;
       gestion          adrian    false    220    221    221            �          0    20904 
   auth_group 
   TABLE DATA                 gestion          adrian    false    229            �          0    20914    auth_group_permissions 
   TABLE DATA                 gestion          adrian    false    231            �          0    20896    auth_permission 
   TABLE DATA                 gestion          adrian    false    227            �          0    20922 	   auth_user 
   TABLE DATA                 gestion          adrian    false    233            �          0    20932    auth_user_groups 
   TABLE DATA                 gestion          adrian    false    235            �          0    20940    auth_user_user_permissions 
   TABLE DATA                 gestion          adrian    false    237            �          0    21031    authtoken_token 
   TABLE DATA                 gestion          adrian    false    240            v          0    20724    bloques 
   TABLE DATA                 gestion          adrian    false    205            �          0    21000    django_admin_log 
   TABLE DATA                 gestion          adrian    false    239            �          0    20886    django_content_type 
   TABLE DATA                 gestion          adrian    false    225            t          0    20713    django_migrations 
   TABLE DATA                 gestion          adrian    false    203            �          0    21049    django_session 
   TABLE DATA                 gestion          adrian    false    241            x          0    20735    estados 
   TABLE DATA                 gestion          adrian    false    207            �          0    20773    historialModificacionesTareas 
   TABLE DATA                 gestion          adrian    false    215            z          0    20743    prioridades 
   TABLE DATA                 gestion          adrian    false    209            |          0    20751 	   proyectos 
   TABLE DATA                 gestion          adrian    false    211            �          0    20857    registroEntradaUsuarios 
   TABLE DATA                 gestion          adrian    false    223            �          0    20825    roles 
   TABLE DATA                 gestion          adrian    false    217            ~          0    20762    tareas 
   TABLE DATA                 gestion          adrian    false    213            �          0    20833    tareasusuario 
   TABLE DATA                 gestion          adrian    false    219            �          0    20841    usuarios 
   TABLE DATA                 gestion          adrian    false    221            �           0    0    auth_group_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('gestion.auth_group_id_seq', 1, false);
          gestion          adrian    false    228            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('gestion.auth_group_permissions_id_seq', 1, false);
          gestion          adrian    false    230            �           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('gestion.auth_permission_id_seq', 68, true);
          gestion          adrian    false    226            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('gestion.auth_user_groups_id_seq', 1, false);
          gestion          adrian    false    234            �           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('gestion.auth_user_id_seq', 1, true);
          gestion          adrian    false    232            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('gestion.auth_user_user_permissions_id_seq', 1, false);
          gestion          adrian    false    236            �           0    0    bloques_idbloque_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('gestion.bloques_idbloque_seq', 1, false);
          gestion          adrian    false    204            �           0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('gestion.django_admin_log_id_seq', 1, false);
          gestion          adrian    false    238            �           0    0    django_content_type_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('gestion.django_content_type_id_seq', 17, true);
          gestion          adrian    false    224            �           0    0    django_migrations_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('gestion.django_migrations_id_seq', 21, true);
          gestion          adrian    false    202            �           0    0    estados_idestado_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('gestion.estados_idestado_seq', 13, true);
          gestion          adrian    false    206            �           0    0 -   historialModificacionesTareas_idhistorico_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('gestion."historialModificacionesTareas_idhistorico_seq"', 1, false);
          gestion          adrian    false    214            �           0    0    prioridades_idprioridad_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('gestion.prioridades_idprioridad_seq', 8, true);
          gestion          adrian    false    208            �           0    0    proyectos_idproyecto_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('gestion.proyectos_idproyecto_seq', 1, false);
          gestion          adrian    false    210            �           0    0 ,   registroEntradaUsuarios_idregistroacceso_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('gestion."registroEntradaUsuarios_idregistroacceso_seq"', 1, false);
          gestion          adrian    false    222            �           0    0    roles_idrol_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('gestion.roles_idrol_seq', 8, true);
          gestion          adrian    false    216            �           0    0    tareas_idtarea_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('gestion.tareas_idtarea_seq', 1, false);
          gestion          adrian    false    212            �           0    0    tareasusuario_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('gestion.tareasusuario_id_seq', 1, false);
          gestion          adrian    false    218            �           0    0    usuarios_idusuario_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('gestion.usuarios_idusuario_seq', 1, false);
          gestion          adrian    false    220            �           2606    21029    auth_group auth_group_name_key 
   CONSTRAINT     Z   ALTER TABLE ONLY gestion.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 I   ALTER TABLE ONLY gestion.auth_group DROP CONSTRAINT auth_group_name_key;
       gestion            adrian    false    229            �           2606    20956 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 }   ALTER TABLE ONLY gestion.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       gestion            adrian    false    231    231            �           2606    20919 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY gestion.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 ]   ALTER TABLE ONLY gestion.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       gestion            adrian    false    231            �           2606    20909    auth_group auth_group_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY gestion.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY gestion.auth_group DROP CONSTRAINT auth_group_pkey;
       gestion            adrian    false    229            �           2606    20947 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 q   ALTER TABLE ONLY gestion.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       gestion            adrian    false    227    227            �           2606    20901 $   auth_permission auth_permission_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY gestion.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 O   ALTER TABLE ONLY gestion.auth_permission DROP CONSTRAINT auth_permission_pkey;
       gestion            adrian    false    227            �           2606    20937 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY gestion.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 Q   ALTER TABLE ONLY gestion.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       gestion            adrian    false    235            �           2606    20971 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 k   ALTER TABLE ONLY gestion.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       gestion            adrian    false    235    235            �           2606    20927    auth_user auth_user_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY gestion.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY gestion.auth_user DROP CONSTRAINT auth_user_pkey;
       gestion            adrian    false    233            �           2606    20945 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY gestion.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 e   ALTER TABLE ONLY gestion.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       gestion            adrian    false    237            �           2606    20985 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY gestion.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       gestion            adrian    false    237    237            �           2606    21023     auth_user auth_user_username_key 
   CONSTRAINT     `   ALTER TABLE ONLY gestion.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 K   ALTER TABLE ONLY gestion.auth_user DROP CONSTRAINT auth_user_username_key;
       gestion            adrian    false    233            �           2606    21035 $   authtoken_token authtoken_token_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY gestion.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);
 O   ALTER TABLE ONLY gestion.authtoken_token DROP CONSTRAINT authtoken_token_pkey;
       gestion            adrian    false    240            �           2606    21037 +   authtoken_token authtoken_token_user_id_key 
   CONSTRAINT     j   ALTER TABLE ONLY gestion.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);
 V   ALTER TABLE ONLY gestion.authtoken_token DROP CONSTRAINT authtoken_token_user_id_key;
       gestion            adrian    false    240            �           2606    20732    bloques bloques_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY gestion.bloques
    ADD CONSTRAINT bloques_pkey PRIMARY KEY (idbloque);
 ?   ALTER TABLE ONLY gestion.bloques DROP CONSTRAINT bloques_pkey;
       gestion            adrian    false    205            �           2606    20795 "   bloques constraint_bloque_proyecto 
   CONSTRAINT     w   ALTER TABLE ONLY gestion.bloques
    ADD CONSTRAINT constraint_bloque_proyecto UNIQUE (idbloque, proyecto_idproyecto);
 M   ALTER TABLE ONLY gestion.bloques DROP CONSTRAINT constraint_bloque_proyecto;
       gestion            adrian    false    205    205            �           2606    20791 8   historialModificacionesTareas constraint_historico_tarea 
   CONSTRAINT     �   ALTER TABLE ONLY gestion."historialModificacionesTareas"
    ADD CONSTRAINT constraint_historico_tarea UNIQUE (idhistorico, tareas_idtarea);
 e   ALTER TABLE ONLY gestion."historialModificacionesTareas" DROP CONSTRAINT constraint_historico_tarea;
       gestion            adrian    false    215    215            �           2606    20793 :   historialModificacionesTareas constraint_historico_usuario 
   CONSTRAINT     �   ALTER TABLE ONLY gestion."historialModificacionesTareas"
    ADD CONSTRAINT constraint_historico_usuario UNIQUE (idhistorico, idusuario);
 g   ALTER TABLE ONLY gestion."historialModificacionesTareas" DROP CONSTRAINT constraint_historico_usuario;
       gestion            adrian    false    215    215            �           2606    20789 %   tareas constraint_idtarea_prioridades 
   CONSTRAINT     }   ALTER TABLE ONLY gestion.tareas
    ADD CONSTRAINT constraint_idtarea_prioridades UNIQUE (idtarea, prioridades_idprioridad);
 P   ALTER TABLE ONLY gestion.tareas DROP CONSTRAINT constraint_idtarea_prioridades;
       gestion            adrian    false    213    213            �           2606    20785    tareas constraint_tarea_bloque 
   CONSTRAINT     o   ALTER TABLE ONLY gestion.tareas
    ADD CONSTRAINT constraint_tarea_bloque UNIQUE (idtarea, bloques_idbloque);
 I   ALTER TABLE ONLY gestion.tareas DROP CONSTRAINT constraint_tarea_bloque;
       gestion            adrian    false    213    213            �           2606    20787    tareas constraint_tarea_estado 
   CONSTRAINT     o   ALTER TABLE ONLY gestion.tareas
    ADD CONSTRAINT constraint_tarea_estado UNIQUE (idtarea, estados_idestado);
 I   ALTER TABLE ONLY gestion.tareas DROP CONSTRAINT constraint_tarea_estado;
       gestion            adrian    false    213    213            �           2606    20864 '   tareasusuario constraint_tareas_usuario 
   CONSTRAINT     �   ALTER TABLE ONLY gestion.tareasusuario
    ADD CONSTRAINT constraint_tareas_usuario UNIQUE (tareas_idtarea_id, usuarios_idusuario_id);
 R   ALTER TABLE ONLY gestion.tareasusuario DROP CONSTRAINT constraint_tareas_usuario;
       gestion            adrian    false    219    219            �           2606    21009 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY gestion.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 Q   ALTER TABLE ONLY gestion.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       gestion            adrian    false    239            �           2606    20893 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY gestion.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 p   ALTER TABLE ONLY gestion.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       gestion            adrian    false    225    225            �           2606    20891 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY gestion.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 W   ALTER TABLE ONLY gestion.django_content_type DROP CONSTRAINT django_content_type_pkey;
       gestion            adrian    false    225            �           2606    20721 (   django_migrations django_migrations_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY gestion.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 S   ALTER TABLE ONLY gestion.django_migrations DROP CONSTRAINT django_migrations_pkey;
       gestion            adrian    false    203            �           2606    21056 "   django_session django_session_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY gestion.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 M   ALTER TABLE ONLY gestion.django_session DROP CONSTRAINT django_session_pkey;
       gestion            adrian    false    241            �           2606    20740    estados estados_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY gestion.estados
    ADD CONSTRAINT estados_pkey PRIMARY KEY (idestado);
 ?   ALTER TABLE ONLY gestion.estados DROP CONSTRAINT estados_pkey;
       gestion            adrian    false    207            �           2606    20778 @   historialModificacionesTareas historialModificacionesTareas_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY gestion."historialModificacionesTareas"
    ADD CONSTRAINT "historialModificacionesTareas_pkey" PRIMARY KEY (idhistorico);
 o   ALTER TABLE ONLY gestion."historialModificacionesTareas" DROP CONSTRAINT "historialModificacionesTareas_pkey";
       gestion            adrian    false    215            �           2606    20748    prioridades prioridades_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY gestion.prioridades
    ADD CONSTRAINT prioridades_pkey PRIMARY KEY (idprioridad);
 G   ALTER TABLE ONLY gestion.prioridades DROP CONSTRAINT prioridades_pkey;
       gestion            adrian    false    209            �           2606    20759    proyectos proyectos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY gestion.proyectos
    ADD CONSTRAINT proyectos_pkey PRIMARY KEY (idproyecto);
 C   ALTER TABLE ONLY gestion.proyectos DROP CONSTRAINT proyectos_pkey;
       gestion            adrian    false    211            �           2606    20862 4   registroEntradaUsuarios registroEntradaUsuarios_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY gestion."registroEntradaUsuarios"
    ADD CONSTRAINT "registroEntradaUsuarios_pkey" PRIMARY KEY (idregistroacceso);
 c   ALTER TABLE ONLY gestion."registroEntradaUsuarios" DROP CONSTRAINT "registroEntradaUsuarios_pkey";
       gestion            adrian    false    223            �           2606    20830    roles roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY gestion.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (idrol);
 ;   ALTER TABLE ONLY gestion.roles DROP CONSTRAINT roles_pkey;
       gestion            adrian    false    217            �           2606    20770    tareas tareas_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY gestion.tareas
    ADD CONSTRAINT tareas_pkey PRIMARY KEY (idtarea);
 =   ALTER TABLE ONLY gestion.tareas DROP CONSTRAINT tareas_pkey;
       gestion            adrian    false    213            �           2606    20838     tareasusuario tareasusuario_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY gestion.tareasusuario
    ADD CONSTRAINT tareasusuario_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY gestion.tareasusuario DROP CONSTRAINT tareasusuario_pkey;
       gestion            adrian    false    219            �           2606    20849    usuarios usuarios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY gestion.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (idusuario);
 A   ALTER TABLE ONLY gestion.usuarios DROP CONSTRAINT usuarios_pkey;
       gestion            adrian    false    221            �           1259    21030    auth_group_name_a6ea08ec_like    INDEX     i   CREATE INDEX auth_group_name_a6ea08ec_like ON gestion.auth_group USING btree (name varchar_pattern_ops);
 2   DROP INDEX gestion.auth_group_name_a6ea08ec_like;
       gestion            adrian    false    229            �           1259    20967 (   auth_group_permissions_group_id_b120cbf9    INDEX     p   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON gestion.auth_group_permissions USING btree (group_id);
 =   DROP INDEX gestion.auth_group_permissions_group_id_b120cbf9;
       gestion            adrian    false    231            �           1259    20968 -   auth_group_permissions_permission_id_84c5c92e    INDEX     z   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON gestion.auth_group_permissions USING btree (permission_id);
 B   DROP INDEX gestion.auth_group_permissions_permission_id_84c5c92e;
       gestion            adrian    false    231            �           1259    20953 (   auth_permission_content_type_id_2f476e4b    INDEX     p   CREATE INDEX auth_permission_content_type_id_2f476e4b ON gestion.auth_permission USING btree (content_type_id);
 =   DROP INDEX gestion.auth_permission_content_type_id_2f476e4b;
       gestion            adrian    false    227            �           1259    20983 "   auth_user_groups_group_id_97559544    INDEX     d   CREATE INDEX auth_user_groups_group_id_97559544 ON gestion.auth_user_groups USING btree (group_id);
 7   DROP INDEX gestion.auth_user_groups_group_id_97559544;
       gestion            adrian    false    235            �           1259    20982 !   auth_user_groups_user_id_6a12ed8b    INDEX     b   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON gestion.auth_user_groups USING btree (user_id);
 6   DROP INDEX gestion.auth_user_groups_user_id_6a12ed8b;
       gestion            adrian    false    235            �           1259    20997 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON gestion.auth_user_user_permissions USING btree (permission_id);
 F   DROP INDEX gestion.auth_user_user_permissions_permission_id_1fbb5f2c;
       gestion            adrian    false    237            �           1259    20996 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     v   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON gestion.auth_user_user_permissions USING btree (user_id);
 @   DROP INDEX gestion.auth_user_user_permissions_user_id_a95ead1b;
       gestion            adrian    false    237            �           1259    21024     auth_user_username_6821ab7c_like    INDEX     o   CREATE INDEX auth_user_username_6821ab7c_like ON gestion.auth_user USING btree (username varchar_pattern_ops);
 5   DROP INDEX gestion.auth_user_username_6821ab7c_like;
       gestion            adrian    false    233            �           1259    21043 !   authtoken_token_key_10f0b77e_like    INDEX     q   CREATE INDEX authtoken_token_key_10f0b77e_like ON gestion.authtoken_token USING btree (key varchar_pattern_ops);
 6   DROP INDEX gestion.authtoken_token_key_10f0b77e_like;
       gestion            adrian    false    240            �           1259    20820 $   bloques_proyecto_idproyecto_d27ce5b6    INDEX     h   CREATE INDEX bloques_proyecto_idproyecto_d27ce5b6 ON gestion.bloques USING btree (proyecto_idproyecto);
 9   DROP INDEX gestion.bloques_proyecto_idproyecto_d27ce5b6;
       gestion            adrian    false    205            �           1259    21020 )   django_admin_log_content_type_id_c4bce8eb    INDEX     r   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON gestion.django_admin_log USING btree (content_type_id);
 >   DROP INDEX gestion.django_admin_log_content_type_id_c4bce8eb;
       gestion            adrian    false    239            �           1259    21021 !   django_admin_log_user_id_c564eba6    INDEX     b   CREATE INDEX django_admin_log_user_id_c564eba6 ON gestion.django_admin_log USING btree (user_id);
 6   DROP INDEX gestion.django_admin_log_user_id_c564eba6;
       gestion            adrian    false    239            �           1259    21058 #   django_session_expire_date_a5c62663    INDEX     f   CREATE INDEX django_session_expire_date_a5c62663 ON gestion.django_session USING btree (expire_date);
 8   DROP INDEX gestion.django_session_expire_date_a5c62663;
       gestion            adrian    false    241            �           1259    21057 (   django_session_session_key_c0390e0f_like    INDEX        CREATE INDEX django_session_session_key_c0390e0f_like ON gestion.django_session USING btree (session_key varchar_pattern_ops);
 =   DROP INDEX gestion.django_session_session_key_c0390e0f_like;
       gestion            adrian    false    241            �           1259    20819 5   historialModificacionesTareas_tareas_idtarea_51abfa7e    INDEX     �   CREATE INDEX "historialModificacionesTareas_tareas_idtarea_51abfa7e" ON gestion."historialModificacionesTareas" USING btree (tareas_idtarea);
 L   DROP INDEX gestion."historialModificacionesTareas_tareas_idtarea_51abfa7e";
       gestion            adrian    false    215            �           1259    20883 2   registroEntradaUsuarios_usuario_idusuario_33006b35    INDEX     �   CREATE INDEX "registroEntradaUsuarios_usuario_idusuario_33006b35" ON gestion."registroEntradaUsuarios" USING btree (usuario_idusuario);
 I   DROP INDEX gestion."registroEntradaUsuarios_usuario_idusuario_33006b35";
       gestion            adrian    false    223            �           1259    20811     tareas_bloques_idbloque_491b72ae    INDEX     `   CREATE INDEX tareas_bloques_idbloque_491b72ae ON gestion.tareas USING btree (bloques_idbloque);
 5   DROP INDEX gestion.tareas_bloques_idbloque_491b72ae;
       gestion            adrian    false    213            �           1259    20812     tareas_estados_idestado_de765172    INDEX     `   CREATE INDEX tareas_estados_idestado_de765172 ON gestion.tareas USING btree (estados_idestado);
 5   DROP INDEX gestion.tareas_estados_idestado_de765172;
       gestion            adrian    false    213            �           1259    20813 '   tareas_prioridades_idprioridad_c64ef060    INDEX     n   CREATE INDEX tareas_prioridades_idprioridad_c64ef060 ON gestion.tareas USING btree (prioridades_idprioridad);
 <   DROP INDEX gestion.tareas_prioridades_idprioridad_c64ef060;
       gestion            adrian    false    213            �           1259    20870 (   tareasusuario_tareas_idtarea_id_e0305dcc    INDEX     p   CREATE INDEX tareasusuario_tareas_idtarea_id_e0305dcc ON gestion.tareasusuario USING btree (tareas_idtarea_id);
 =   DROP INDEX gestion.tareasusuario_tareas_idtarea_id_e0305dcc;
       gestion            adrian    false    219            �           1259    20877 ,   tareasusuario_usuarios_idusuario_id_1759be13    INDEX     x   CREATE INDEX tareasusuario_usuarios_idusuario_id_1759be13 ON gestion.tareasusuario USING btree (usuarios_idusuario_id);
 A   DROP INDEX gestion.tareasusuario_usuarios_idusuario_id_1759be13;
       gestion            adrian    false    219            �           1259    20876    usuarios_roles_idrol_671fe408    INDEX     Z   CREATE INDEX usuarios_roles_idrol_671fe408 ON gestion.usuarios USING btree (roles_idrol);
 2   DROP INDEX gestion.usuarios_roles_idrol_671fe408;
       gestion            adrian    false    221            �           2606    20962 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES gestion.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY gestion.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       gestion          adrian    false    227    231    3256            �           2606    20957 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES gestion.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY gestion.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       gestion          adrian    false    231    3261    229            �           2606    20948 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES gestion.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY gestion.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       gestion          adrian    false    227    225    3251            �           2606    20977 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES gestion.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY gestion.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       gestion          adrian    false    235    3261    229            �           2606    20972 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES gestion.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY gestion.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       gestion          adrian    false    3269    235    233            �           2606    20991 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES gestion.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY gestion.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       gestion          adrian    false    237    227    3256            �           2606    20986 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES gestion.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY gestion.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       gestion          adrian    false    3269    233    237            �           2606    21044 @   authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES gestion.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY gestion.authtoken_token DROP CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id;
       gestion          adrian    false    240    3269    233            �           2606    20779 D   bloques bloques_proyecto_idproyecto_d27ce5b6_fk_proyectos_idproyecto    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.bloques
    ADD CONSTRAINT bloques_proyecto_idproyecto_d27ce5b6_fk_proyectos_idproyecto FOREIGN KEY (proyecto_idproyecto) REFERENCES gestion.proyectos(idproyecto) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY gestion.bloques DROP CONSTRAINT bloques_proyecto_idproyecto_d27ce5b6_fk_proyectos_idproyecto;
       gestion          adrian    false    205    211    3215            �           2606    21010 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES gestion.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY gestion.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       gestion          adrian    false    3251    239    225            �           2606    21015 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES gestion.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY gestion.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       gestion          adrian    false    233    3269    239            �           2606    20814 W   historialModificacionesTareas historialModificacio_tareas_idtarea_51abfa7e_fk_tareas_id    FK CONSTRAINT     �   ALTER TABLE ONLY gestion."historialModificacionesTareas"
    ADD CONSTRAINT "historialModificacio_tareas_idtarea_51abfa7e_fk_tareas_id" FOREIGN KEY (tareas_idtarea) REFERENCES gestion.tareas(idtarea) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY gestion."historialModificacionesTareas" DROP CONSTRAINT "historialModificacio_tareas_idtarea_51abfa7e_fk_tareas_id";
       gestion          adrian    false    213    3225    215            �           2606    20878 T   registroEntradaUsuarios registroEntradaUsuar_usuario_idusuario_33006b35_fk_usuarios_    FK CONSTRAINT     �   ALTER TABLE ONLY gestion."registroEntradaUsuarios"
    ADD CONSTRAINT "registroEntradaUsuar_usuario_idusuario_33006b35_fk_usuarios_" FOREIGN KEY (usuario_idusuario) REFERENCES gestion.usuarios(idusuario) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY gestion."registroEntradaUsuarios" DROP CONSTRAINT "registroEntradaUsuar_usuario_idusuario_33006b35_fk_usuarios_";
       gestion          adrian    false    221    223    3243            �           2606    20796 ;   tareas tareas_bloques_idbloque_491b72ae_fk_bloques_idbloque    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.tareas
    ADD CONSTRAINT tareas_bloques_idbloque_491b72ae_fk_bloques_idbloque FOREIGN KEY (bloques_idbloque) REFERENCES gestion.bloques(idbloque) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY gestion.tareas DROP CONSTRAINT tareas_bloques_idbloque_491b72ae_fk_bloques_idbloque;
       gestion          adrian    false    205    3206    213            �           2606    20801 ;   tareas tareas_estados_idestado_de765172_fk_estados_idestado    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.tareas
    ADD CONSTRAINT tareas_estados_idestado_de765172_fk_estados_idestado FOREIGN KEY (estados_idestado) REFERENCES gestion.estados(idestado) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY gestion.tareas DROP CONSTRAINT tareas_estados_idestado_de765172_fk_estados_idestado;
       gestion          adrian    false    207    213    3211            �           2606    20806 8   tareas tareas_prioridades_idpriori_c64ef060_fk_prioridad    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.tareas
    ADD CONSTRAINT tareas_prioridades_idpriori_c64ef060_fk_prioridad FOREIGN KEY (prioridades_idprioridad) REFERENCES gestion.prioridades(idprioridad) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY gestion.tareas DROP CONSTRAINT tareas_prioridades_idpriori_c64ef060_fk_prioridad;
       gestion          adrian    false    213    3213    209            �           2606    20865 H   tareasusuario tareasusuario_tareas_idtarea_id_e0305dcc_fk_tareas_idtarea    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.tareasusuario
    ADD CONSTRAINT tareasusuario_tareas_idtarea_id_e0305dcc_fk_tareas_idtarea FOREIGN KEY (tareas_idtarea_id) REFERENCES gestion.tareas(idtarea) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY gestion.tareasusuario DROP CONSTRAINT tareasusuario_tareas_idtarea_id_e0305dcc_fk_tareas_idtarea;
       gestion          adrian    false    3225    219    213            �           2606    20850 F   tareasusuario tareasusuario_usuarios_idusuario_i_1759be13_fk_usuarios_    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.tareasusuario
    ADD CONSTRAINT tareasusuario_usuarios_idusuario_i_1759be13_fk_usuarios_ FOREIGN KEY (usuarios_idusuario_id) REFERENCES gestion.usuarios(idusuario) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY gestion.tareasusuario DROP CONSTRAINT tareasusuario_usuarios_idusuario_i_1759be13_fk_usuarios_;
       gestion          adrian    false    3243    221    219            �           2606    20871 5   usuarios usuarios_roles_idrol_671fe408_fk_roles_idrol    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.usuarios
    ADD CONSTRAINT usuarios_roles_idrol_671fe408_fk_roles_idrol FOREIGN KEY (roles_idrol) REFERENCES gestion.roles(idrol) DEFERRABLE INITIALLY DEFERRED;
 `   ALTER TABLE ONLY gestion.usuarios DROP CONSTRAINT usuarios_roles_idrol_671fe408_fk_roles_idrol;
       gestion          adrian    false    217    221    3235            �   
   x���          �   
   x���          �   *  x���M��0����ܶ�V���TU{@��R���r�QYB�ъ_�'3�H�I���+ym6�/O߶��y�5��L��U��׳��Ң0�яO_�?�D����gu�T�D�l�S�_��znf�f֌��l�3�������s�'��K�ތ���S��c�C1y�lw?�t�a zI�{t0.x�ν �.Xa��z�����>Ϫ���Azs�>P�
�e�)����XƝa��j�ʘsd�*tn�1H�����:EHP*�.�QD�"��DL�SD|D6w٩4������/�*��4��r{@�5u��������Cp+�}���nJe�H��^�f�H٠\�&}H�ִ���0ώ���P+�f%L�y�J���:�5)��f+U�UQ���̀W���C7[���B���|}9�}Xi¾��2h3:��-G��Gn+R��Z�ۢ��YWb2ԥ��3���(����U�P�ݫ��
��HcY�^Kv�q�Y�^w_�Q�cҼע�O�8����?U��SwJ�I(�2�ª	Ѭ�)�D�&uL�ָ���ܫ���`
�P(+e��B4�f��B4�h
���X��g��i�����0�V�ݝ����� w��R����_���E�J��q+f���{��V����)��.�/�s
�B4nf������B��u	�?���Q	o8���#mI��3���`�ռ��eI�+ݩ]}o�N��}�6Y<��[� gć`�z�C�B����oy��#> n�m�[ׇ�;B�v�d}M���Y[�{�D`��ۼc:���:�      �   �   x�e�K�@E���YS��8�V��`���cFV"Y�"�}F-�.��=�Xn`�!���C縬�[&Guu��e\���Y����x���Q��D�6�M�f��{�v68��7�r{�0=0}���6�����,�&ƚ���Rk�@�Z_D�!�!Ȍ�	�UQ�-�$�އ�~�/�/b2US���;�(�<�      �   
   x���          �   
   x���          �   �   x�ʽ�0 �Oq[5
��mqr` 1�����?1�����o��~hO#t�x�{z��2��yy����������}R�嚙���1F����6*�G�P���F��� (� 5�K��#�A�j�B|�>!q      v   
   x���          �   
   x���          �     x���;O�0 �=��[@B��	bb��*��ꈍkH|��!���cH��u;;�O>�9��7����B+�[�V�@����J�?m�6{q�݈delJA��~pMz�����f-éuj�*�=�p��H�c�A#$z�8ƒr���O��rE�W��t�s�5�oQ��sXr����)��Gp9��X�����JS��ఝL�p�����F���(�'��ͦ%��k>�j��	��-�r���-�Z7',j5�N�Y*�
��4d�����~�~����$����7      t   "  x���ˎ�0��}��
����[RV,fQi4 f`kY���88�h��ؽ0MID�&�/�����o�n�<f���OY�;ol���PMiemJ��D�}�x���!{��g�������n!,Mc�QUt��A�k��T�
���;˷���A8�Ζ����k�W��I,�������}��w@�FGÉ��O�IE�%�XD����$1*�X����eȪ�K�k��e�J��M�c9N��+8y��T۸]~�T)�O�l��<&���YZ�q+�9�Ӛ���Q���@IAx��bh.�����V��t]LB�Z��J7�q㨆PP����P9���ѵ2�>'9���xȧ���9���~�B@�Vr�pv	�T�3M�����BZ`�X���<��Wo���)�5��"L�ѯz�8��*�S޺�P��9�d��N�ӕ�0`�V�u���	�T�4	|(���s5М$�4X4`t�P:۷���41���e�h�:���hJ�(��s+����� r�S�f:@#@8�z�0G \�d<��Aly�~M�Xs�g�b���3      �   =  x�=�Io�@@��
n�i5�'���иe��f.�� ��׷���K^��09lW�ĵ��x�򶙦e�����x�������Az�j~Kc���A��pj3�wp5:�������\;�FD8���Ճ�Y�MG�T��+����b���P���Z/��iÙ?��Ȣ����;�VNwE���Nj�Ӏ�Y�V�l9۝�X��� ��q�(�7�(Z��^ҫ$��7FA�Z�������y[]N��C(��gQ�ufiT���
�b���ִ#�L�ssD��g�Q�e���|�4A��<�dm����O��������c4� sw�      x   �   x���v
Q���WHO-.����R�)��
a�>���
:
���y
�ř�y�ə�7�kZsy�����-%�X=F@=�y
E��E����j3jJM�ɬ"�.�����Ԥ�bb���8�Am�� ��d      �   
   x���          z   �   x���v
Q���WHO-.����+(��/�LILI-Vs�	uV�0�QP���K/�KT�Q0д��$R�!P�oi�BRbH�!	Z��Z� ڌH�f�15%3Qj�1	�M`���LH�g
�41��ٔ�f@͎mf$h3�-�Fs�V.. )���      |   
   x���          �   
   x���          �   �   x��ͽ
�0��W�m*���E*Z�V�`>�PM���{
��zo�v�������d���F�l�V�uG�(�Ş+ǋ���&h����&��2��w��c/� WJ��u(�B)P��H�E2�-2RH�������A	��V��
�[a0��,�d	y����`A����b      ~   
   x���          �   
   x���          �   
   x���         