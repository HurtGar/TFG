PGDMP                          x           proment    12.3    12.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16392    proment    DATABASE     y   CREATE DATABASE proment WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE proment;
                adrian    false            �           0    0    DATABASE proment    COMMENT     L   COMMENT ON DATABASE proment IS 'Base de datos para la aplicación Proment';
                   adrian    false    3477                        2615    19285    gestion    SCHEMA        CREATE SCHEMA gestion;
    DROP SCHEMA gestion;
                adrian    false            �            1259    20550 
   auth_group    TABLE     g   CREATE TABLE gestion.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE gestion.auth_group;
       gestion         heap    adrian    false    6            �            1259    20548    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE gestion.auth_group_id_seq;
       gestion          adrian    false    6    229            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE gestion.auth_group_id_seq OWNED BY gestion.auth_group.id;
          gestion          adrian    false    228            �            1259    20560    auth_group_permissions    TABLE     �   CREATE TABLE gestion.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 +   DROP TABLE gestion.auth_group_permissions;
       gestion         heap    adrian    false    6            �            1259    20558    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE gestion.auth_group_permissions_id_seq;
       gestion          adrian    false    231    6            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE gestion.auth_group_permissions_id_seq OWNED BY gestion.auth_group_permissions.id;
          gestion          adrian    false    230            �            1259    20542    auth_permission    TABLE     �   CREATE TABLE gestion.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 $   DROP TABLE gestion.auth_permission;
       gestion         heap    adrian    false    6            �            1259    20540    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE gestion.auth_permission_id_seq;
       gestion          adrian    false    227    6            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE gestion.auth_permission_id_seq OWNED BY gestion.auth_permission.id;
          gestion          adrian    false    226            �            1259    20568 	   auth_user    TABLE     �  CREATE TABLE gestion.auth_user (
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
       gestion         heap    adrian    false    6            �            1259    20578    auth_user_groups    TABLE     �   CREATE TABLE gestion.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 %   DROP TABLE gestion.auth_user_groups;
       gestion         heap    adrian    false    6            �            1259    20576    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE gestion.auth_user_groups_id_seq;
       gestion          adrian    false    6    235            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE gestion.auth_user_groups_id_seq OWNED BY gestion.auth_user_groups.id;
          gestion          adrian    false    234            �            1259    20566    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE gestion.auth_user_id_seq;
       gestion          adrian    false    6    233            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE gestion.auth_user_id_seq OWNED BY gestion.auth_user.id;
          gestion          adrian    false    232            �            1259    20586    auth_user_user_permissions    TABLE     �   CREATE TABLE gestion.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 /   DROP TABLE gestion.auth_user_user_permissions;
       gestion         heap    adrian    false    6            �            1259    20584 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE gestion.auth_user_user_permissions_id_seq;
       gestion          adrian    false    237    6            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE gestion.auth_user_user_permissions_id_seq OWNED BY gestion.auth_user_user_permissions.id;
          gestion          adrian    false    236            �            1259    20372    bloques    TABLE       CREATE TABLE gestion.bloques (
    idbloque integer NOT NULL,
    nombrebloque character varying(100) NOT NULL,
    descbloque character varying(1000) NOT NULL,
    fechacreacion timestamp with time zone NOT NULL,
    proyecto_idproyecto integer NOT NULL
);
    DROP TABLE gestion.bloques;
       gestion         heap    adrian    false    6            �            1259    20370    bloques_idbloque_seq    SEQUENCE     �   CREATE SEQUENCE gestion.bloques_idbloque_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE gestion.bloques_idbloque_seq;
       gestion          adrian    false    6    205            �           0    0    bloques_idbloque_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE gestion.bloques_idbloque_seq OWNED BY gestion.bloques.idbloque;
          gestion          adrian    false    204            �            1259    20646    django_admin_log    TABLE     �  CREATE TABLE gestion.django_admin_log (
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
       gestion         heap    adrian    false    6            �            1259    20644    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE gestion.django_admin_log_id_seq;
       gestion          adrian    false    6    239            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE gestion.django_admin_log_id_seq OWNED BY gestion.django_admin_log.id;
          gestion          adrian    false    238            �            1259    20532    django_content_type    TABLE     �   CREATE TABLE gestion.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 (   DROP TABLE gestion.django_content_type;
       gestion         heap    adrian    false    6            �            1259    20530    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE gestion.django_content_type_id_seq;
       gestion          adrian    false    225    6            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE gestion.django_content_type_id_seq OWNED BY gestion.django_content_type.id;
          gestion          adrian    false    224            �            1259    20248    django_migrations    TABLE     �   CREATE TABLE gestion.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 &   DROP TABLE gestion.django_migrations;
       gestion         heap    adrian    false    6            �            1259    20246    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE gestion.django_migrations_id_seq;
       gestion          adrian    false    203    6            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE gestion.django_migrations_id_seq OWNED BY gestion.django_migrations.id;
          gestion          adrian    false    202            �            1259    20677    django_session    TABLE     �   CREATE TABLE gestion.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 #   DROP TABLE gestion.django_session;
       gestion         heap    adrian    false    6            �            1259    20383    estados    TABLE     o   CREATE TABLE gestion.estados (
    idestado integer NOT NULL,
    descestado character varying(50) NOT NULL
);
    DROP TABLE gestion.estados;
       gestion         heap    adrian    false    6            �            1259    20381    estados_idestado_seq    SEQUENCE     �   CREATE SEQUENCE gestion.estados_idestado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE gestion.estados_idestado_seq;
       gestion          adrian    false    207    6            �           0    0    estados_idestado_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE gestion.estados_idestado_seq OWNED BY gestion.estados.idestado;
          gestion          adrian    false    206            �            1259    20461    historialModificacionesTareas    TABLE     �   CREATE TABLE gestion."historialModificacionesTareas" (
    idhistorico integer NOT NULL,
    fechahistorico date NOT NULL,
    horahistorico time without time zone NOT NULL,
    idusuario integer NOT NULL,
    tareas_idtarea integer NOT NULL
);
 4   DROP TABLE gestion."historialModificacionesTareas";
       gestion         heap    adrian    false    6            �            1259    20459 -   historialModificacionesTareas_idhistorico_seq    SEQUENCE     �   CREATE SEQUENCE gestion."historialModificacionesTareas_idhistorico_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE gestion."historialModificacionesTareas_idhistorico_seq";
       gestion          adrian    false    223    6            �           0    0 -   historialModificacionesTareas_idhistorico_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE gestion."historialModificacionesTareas_idhistorico_seq" OWNED BY gestion."historialModificacionesTareas".idhistorico;
          gestion          adrian    false    222            �            1259    20391    prioridades    TABLE     �   CREATE TABLE gestion.prioridades (
    idprioridad integer NOT NULL,
    descprioridad character varying(50) NOT NULL,
    nivelprioridad integer NOT NULL
);
     DROP TABLE gestion.prioridades;
       gestion         heap    adrian    false    6            �            1259    20389    prioridades_idprioridad_seq    SEQUENCE     �   CREATE SEQUENCE gestion.prioridades_idprioridad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE gestion.prioridades_idprioridad_seq;
       gestion          adrian    false    209    6            �           0    0    prioridades_idprioridad_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE gestion.prioridades_idprioridad_seq OWNED BY gestion.prioridades.idprioridad;
          gestion          adrian    false    208            �            1259    20399 	   proyectos    TABLE     �   CREATE TABLE gestion.proyectos (
    idproyecto integer NOT NULL,
    descproyecto character varying(500) NOT NULL,
    inicioproyecto date NOT NULL,
    finproyecto date NOT NULL,
    fechacreacion timestamp with time zone NOT NULL
);
    DROP TABLE gestion.proyectos;
       gestion         heap    adrian    false    6            �            1259    20397    proyectos_idproyecto_seq    SEQUENCE     �   CREATE SEQUENCE gestion.proyectos_idproyecto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE gestion.proyectos_idproyecto_seq;
       gestion          adrian    false    211    6            �           0    0    proyectos_idproyecto_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE gestion.proyectos_idproyecto_seq OWNED BY gestion.proyectos.idproyecto;
          gestion          adrian    false    210            �            1259    20453    registroEntradaUsuarios    TABLE     �   CREATE TABLE gestion."registroEntradaUsuarios" (
    idregistroacceso integer NOT NULL,
    fechaacceso date NOT NULL,
    horaacceso time without time zone NOT NULL,
    ipacceso character varying(45) NOT NULL,
    usuario_idusuario integer NOT NULL
);
 .   DROP TABLE gestion."registroEntradaUsuarios";
       gestion         heap    adrian    false    6            �            1259    20451 ,   registroEntradaUsuarios_idregistroacceso_seq    SEQUENCE     �   CREATE SEQUENCE gestion."registroEntradaUsuarios_idregistroacceso_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE gestion."registroEntradaUsuarios_idregistroacceso_seq";
       gestion          adrian    false    6    221            �           0    0 ,   registroEntradaUsuarios_idregistroacceso_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE gestion."registroEntradaUsuarios_idregistroacceso_seq" OWNED BY gestion."registroEntradaUsuarios".idregistroacceso;
          gestion          adrian    false    220            �            1259    20410    roles    TABLE     �   CREATE TABLE gestion.roles (
    idrol integer NOT NULL,
    descrol character varying(45) NOT NULL,
    nivelrol integer NOT NULL
);
    DROP TABLE gestion.roles;
       gestion         heap    adrian    false    6            �            1259    20408    roles_idrol_seq    SEQUENCE     �   CREATE SEQUENCE gestion.roles_idrol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE gestion.roles_idrol_seq;
       gestion          adrian    false    213    6            �           0    0    roles_idrol_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE gestion.roles_idrol_seq OWNED BY gestion.roles.idrol;
          gestion          adrian    false    212            �            1259    20418    tareas    TABLE     �  CREATE TABLE gestion.tareas (
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
       gestion         heap    adrian    false    6            �            1259    20416    tareas_idtarea_seq    SEQUENCE     �   CREATE SEQUENCE gestion.tareas_idtarea_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE gestion.tareas_idtarea_seq;
       gestion          adrian    false    215    6            �           0    0    tareas_idtarea_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE gestion.tareas_idtarea_seq OWNED BY gestion.tareas.idtarea;
          gestion          adrian    false    214            �            1259    20429    tareasusuario    TABLE     �   CREATE TABLE gestion.tareasusuario (
    id integer NOT NULL,
    tareas_idtarea_id integer NOT NULL,
    usuarios_idusuario_id integer NOT NULL
);
 "   DROP TABLE gestion.tareasusuario;
       gestion         heap    adrian    false    6            �            1259    20427    tareasusuario_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion.tareasusuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE gestion.tareasusuario_id_seq;
       gestion          adrian    false    6    217            �           0    0    tareasusuario_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE gestion.tareasusuario_id_seq OWNED BY gestion.tareasusuario.id;
          gestion          adrian    false    216            �            1259    20437    usuarios    TABLE     �  CREATE TABLE gestion.usuarios (
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
       gestion         heap    adrian    false    6            �            1259    20435    usuarios_idusuario_seq    SEQUENCE     �   CREATE SEQUENCE gestion.usuarios_idusuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE gestion.usuarios_idusuario_seq;
       gestion          adrian    false    6    219            �           0    0    usuarios_idusuario_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE gestion.usuarios_idusuario_seq OWNED BY gestion.usuarios.idusuario;
          gestion          adrian    false    218            x           2604    20553    auth_group id    DEFAULT     p   ALTER TABLE ONLY gestion.auth_group ALTER COLUMN id SET DEFAULT nextval('gestion.auth_group_id_seq'::regclass);
 =   ALTER TABLE gestion.auth_group ALTER COLUMN id DROP DEFAULT;
       gestion          adrian    false    228    229    229            y           2604    20563    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY gestion.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('gestion.auth_group_permissions_id_seq'::regclass);
 I   ALTER TABLE gestion.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       gestion          adrian    false    230    231    231            w           2604    20545    auth_permission id    DEFAULT     z   ALTER TABLE ONLY gestion.auth_permission ALTER COLUMN id SET DEFAULT nextval('gestion.auth_permission_id_seq'::regclass);
 B   ALTER TABLE gestion.auth_permission ALTER COLUMN id DROP DEFAULT;
       gestion          adrian    false    226    227    227            z           2604    20571    auth_user id    DEFAULT     n   ALTER TABLE ONLY gestion.auth_user ALTER COLUMN id SET DEFAULT nextval('gestion.auth_user_id_seq'::regclass);
 <   ALTER TABLE gestion.auth_user ALTER COLUMN id DROP DEFAULT;
       gestion          adrian    false    232    233    233            {           2604    20581    auth_user_groups id    DEFAULT     |   ALTER TABLE ONLY gestion.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('gestion.auth_user_groups_id_seq'::regclass);
 C   ALTER TABLE gestion.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       gestion          adrian    false    235    234    235            |           2604    20589    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY gestion.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('gestion.auth_user_user_permissions_id_seq'::regclass);
 M   ALTER TABLE gestion.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       gestion          adrian    false    237    236    237            l           2604    20375    bloques idbloque    DEFAULT     v   ALTER TABLE ONLY gestion.bloques ALTER COLUMN idbloque SET DEFAULT nextval('gestion.bloques_idbloque_seq'::regclass);
 @   ALTER TABLE gestion.bloques ALTER COLUMN idbloque DROP DEFAULT;
       gestion          adrian    false    205    204    205            }           2604    20649    django_admin_log id    DEFAULT     |   ALTER TABLE ONLY gestion.django_admin_log ALTER COLUMN id SET DEFAULT nextval('gestion.django_admin_log_id_seq'::regclass);
 C   ALTER TABLE gestion.django_admin_log ALTER COLUMN id DROP DEFAULT;
       gestion          adrian    false    238    239    239            v           2604    20535    django_content_type id    DEFAULT     �   ALTER TABLE ONLY gestion.django_content_type ALTER COLUMN id SET DEFAULT nextval('gestion.django_content_type_id_seq'::regclass);
 F   ALTER TABLE gestion.django_content_type ALTER COLUMN id DROP DEFAULT;
       gestion          adrian    false    224    225    225            k           2604    20251    django_migrations id    DEFAULT     ~   ALTER TABLE ONLY gestion.django_migrations ALTER COLUMN id SET DEFAULT nextval('gestion.django_migrations_id_seq'::regclass);
 D   ALTER TABLE gestion.django_migrations ALTER COLUMN id DROP DEFAULT;
       gestion          adrian    false    203    202    203            m           2604    20386    estados idestado    DEFAULT     v   ALTER TABLE ONLY gestion.estados ALTER COLUMN idestado SET DEFAULT nextval('gestion.estados_idestado_seq'::regclass);
 @   ALTER TABLE gestion.estados ALTER COLUMN idestado DROP DEFAULT;
       gestion          adrian    false    207    206    207            u           2604    20464 )   historialModificacionesTareas idhistorico    DEFAULT     �   ALTER TABLE ONLY gestion."historialModificacionesTareas" ALTER COLUMN idhistorico SET DEFAULT nextval('gestion."historialModificacionesTareas_idhistorico_seq"'::regclass);
 [   ALTER TABLE gestion."historialModificacionesTareas" ALTER COLUMN idhistorico DROP DEFAULT;
       gestion          adrian    false    222    223    223            n           2604    20394    prioridades idprioridad    DEFAULT     �   ALTER TABLE ONLY gestion.prioridades ALTER COLUMN idprioridad SET DEFAULT nextval('gestion.prioridades_idprioridad_seq'::regclass);
 G   ALTER TABLE gestion.prioridades ALTER COLUMN idprioridad DROP DEFAULT;
       gestion          adrian    false    208    209    209            o           2604    20402    proyectos idproyecto    DEFAULT     ~   ALTER TABLE ONLY gestion.proyectos ALTER COLUMN idproyecto SET DEFAULT nextval('gestion.proyectos_idproyecto_seq'::regclass);
 D   ALTER TABLE gestion.proyectos ALTER COLUMN idproyecto DROP DEFAULT;
       gestion          adrian    false    211    210    211            t           2604    20456 (   registroEntradaUsuarios idregistroacceso    DEFAULT     �   ALTER TABLE ONLY gestion."registroEntradaUsuarios" ALTER COLUMN idregistroacceso SET DEFAULT nextval('gestion."registroEntradaUsuarios_idregistroacceso_seq"'::regclass);
 Z   ALTER TABLE gestion."registroEntradaUsuarios" ALTER COLUMN idregistroacceso DROP DEFAULT;
       gestion          adrian    false    221    220    221            p           2604    20413    roles idrol    DEFAULT     l   ALTER TABLE ONLY gestion.roles ALTER COLUMN idrol SET DEFAULT nextval('gestion.roles_idrol_seq'::regclass);
 ;   ALTER TABLE gestion.roles ALTER COLUMN idrol DROP DEFAULT;
       gestion          adrian    false    212    213    213            q           2604    20421    tareas idtarea    DEFAULT     r   ALTER TABLE ONLY gestion.tareas ALTER COLUMN idtarea SET DEFAULT nextval('gestion.tareas_idtarea_seq'::regclass);
 >   ALTER TABLE gestion.tareas ALTER COLUMN idtarea DROP DEFAULT;
       gestion          adrian    false    215    214    215            r           2604    20432    tareasusuario id    DEFAULT     v   ALTER TABLE ONLY gestion.tareasusuario ALTER COLUMN id SET DEFAULT nextval('gestion.tareasusuario_id_seq'::regclass);
 @   ALTER TABLE gestion.tareasusuario ALTER COLUMN id DROP DEFAULT;
       gestion          adrian    false    216    217    217            s           2604    20440    usuarios idusuario    DEFAULT     z   ALTER TABLE ONLY gestion.usuarios ALTER COLUMN idusuario SET DEFAULT nextval('gestion.usuarios_idusuario_seq'::regclass);
 B   ALTER TABLE gestion.usuarios ALTER COLUMN idusuario DROP DEFAULT;
       gestion          adrian    false    218    219    219            �          0    20550 
   auth_group 
   TABLE DATA           /   COPY gestion.auth_group (id, name) FROM stdin;
    gestion          adrian    false    229            �          0    20560    auth_group_permissions 
   TABLE DATA           N   COPY gestion.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    gestion          adrian    false    231            �          0    20542    auth_permission 
   TABLE DATA           O   COPY gestion.auth_permission (id, name, content_type_id, codename) FROM stdin;
    gestion          adrian    false    227            �          0    20568 	   auth_user 
   TABLE DATA           �   COPY gestion.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    gestion          adrian    false    233            �          0    20578    auth_user_groups 
   TABLE DATA           B   COPY gestion.auth_user_groups (id, user_id, group_id) FROM stdin;
    gestion          adrian    false    235            �          0    20586    auth_user_user_permissions 
   TABLE DATA           Q   COPY gestion.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    gestion          adrian    false    237            l          0    20372    bloques 
   TABLE DATA           j   COPY gestion.bloques (idbloque, nombrebloque, descbloque, fechacreacion, proyecto_idproyecto) FROM stdin;
    gestion          adrian    false    205            �          0    20646    django_admin_log 
   TABLE DATA           �   COPY gestion.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    gestion          adrian    false    239            �          0    20532    django_content_type 
   TABLE DATA           D   COPY gestion.django_content_type (id, app_label, model) FROM stdin;
    gestion          adrian    false    225            j          0    20248    django_migrations 
   TABLE DATA           D   COPY gestion.django_migrations (id, app, name, applied) FROM stdin;
    gestion          adrian    false    203            �          0    20677    django_session 
   TABLE DATA           Q   COPY gestion.django_session (session_key, session_data, expire_date) FROM stdin;
    gestion          adrian    false    240            n          0    20383    estados 
   TABLE DATA           8   COPY gestion.estados (idestado, descestado) FROM stdin;
    gestion          adrian    false    207            ~          0    20461    historialModificacionesTareas 
   TABLE DATA           �   COPY gestion."historialModificacionesTareas" (idhistorico, fechahistorico, horahistorico, idusuario, tareas_idtarea) FROM stdin;
    gestion          adrian    false    223            p          0    20391    prioridades 
   TABLE DATA           R   COPY gestion.prioridades (idprioridad, descprioridad, nivelprioridad) FROM stdin;
    gestion          adrian    false    209            r          0    20399 	   proyectos 
   TABLE DATA           j   COPY gestion.proyectos (idproyecto, descproyecto, inicioproyecto, finproyecto, fechacreacion) FROM stdin;
    gestion          adrian    false    211            |          0    20453    registroEntradaUsuarios 
   TABLE DATA           |   COPY gestion."registroEntradaUsuarios" (idregistroacceso, fechaacceso, horaacceso, ipacceso, usuario_idusuario) FROM stdin;
    gestion          adrian    false    221            t          0    20410    roles 
   TABLE DATA           :   COPY gestion.roles (idrol, descrol, nivelrol) FROM stdin;
    gestion          adrian    false    213            v          0    20418    tareas 
   TABLE DATA           �   COPY gestion.tareas (idtarea, nombretarea, desctarea, fechacreacion, "fechaInicio", fechafin, fechaactualizacion, bloques_idbloque, estados_idestado, prioridades_idprioridad) FROM stdin;
    gestion          adrian    false    215            x          0    20429    tareasusuario 
   TABLE DATA           V   COPY gestion.tareasusuario (id, tareas_idtarea_id, usuarios_idusuario_id) FROM stdin;
    gestion          adrian    false    217            z          0    20437    usuarios 
   TABLE DATA           �   COPY gestion.usuarios (idusuario, nombre, primerapellido, segundoapellido, telefono, email, password, fecharegistro, estado, roles_idrol) FROM stdin;
    gestion          adrian    false    219            �           0    0    auth_group_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('gestion.auth_group_id_seq', 1, false);
          gestion          adrian    false    228            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('gestion.auth_group_permissions_id_seq', 1, false);
          gestion          adrian    false    230            �           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('gestion.auth_permission_id_seq', 64, true);
          gestion          adrian    false    226            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('gestion.auth_user_groups_id_seq', 1, false);
          gestion          adrian    false    234            �           0    0    auth_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('gestion.auth_user_id_seq', 1, false);
          gestion          adrian    false    232            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('gestion.auth_user_user_permissions_id_seq', 1, false);
          gestion          adrian    false    236            �           0    0    bloques_idbloque_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('gestion.bloques_idbloque_seq', 1, false);
          gestion          adrian    false    204            �           0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('gestion.django_admin_log_id_seq', 1, false);
          gestion          adrian    false    238            �           0    0    django_content_type_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('gestion.django_content_type_id_seq', 16, true);
          gestion          adrian    false    224            �           0    0    django_migrations_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('gestion.django_migrations_id_seq', 18, true);
          gestion          adrian    false    202            �           0    0    estados_idestado_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('gestion.estados_idestado_seq', 1, false);
          gestion          adrian    false    206            �           0    0 -   historialModificacionesTareas_idhistorico_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('gestion."historialModificacionesTareas_idhistorico_seq"', 1, false);
          gestion          adrian    false    222            �           0    0    prioridades_idprioridad_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('gestion.prioridades_idprioridad_seq', 1, false);
          gestion          adrian    false    208            �           0    0    proyectos_idproyecto_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('gestion.proyectos_idproyecto_seq', 1, false);
          gestion          adrian    false    210            �           0    0 ,   registroEntradaUsuarios_idregistroacceso_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('gestion."registroEntradaUsuarios_idregistroacceso_seq"', 1, false);
          gestion          adrian    false    220            �           0    0    roles_idrol_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('gestion.roles_idrol_seq', 1, false);
          gestion          adrian    false    212            �           0    0    tareas_idtarea_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('gestion.tareas_idtarea_seq', 1, false);
          gestion          adrian    false    214            �           0    0    tareasusuario_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('gestion.tareasusuario_id_seq', 1, false);
          gestion          adrian    false    216            �           0    0    usuarios_idusuario_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('gestion.usuarios_idusuario_seq', 1, false);
          gestion          adrian    false    218            �           2606    20675    auth_group auth_group_name_key 
   CONSTRAINT     Z   ALTER TABLE ONLY gestion.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 I   ALTER TABLE ONLY gestion.auth_group DROP CONSTRAINT auth_group_name_key;
       gestion            adrian    false    229            �           2606    20602 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 }   ALTER TABLE ONLY gestion.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       gestion            adrian    false    231    231            �           2606    20565 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY gestion.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 ]   ALTER TABLE ONLY gestion.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       gestion            adrian    false    231            �           2606    20555    auth_group auth_group_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY gestion.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY gestion.auth_group DROP CONSTRAINT auth_group_pkey;
       gestion            adrian    false    229            �           2606    20593 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 q   ALTER TABLE ONLY gestion.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       gestion            adrian    false    227    227            �           2606    20547 $   auth_permission auth_permission_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY gestion.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 O   ALTER TABLE ONLY gestion.auth_permission DROP CONSTRAINT auth_permission_pkey;
       gestion            adrian    false    227            �           2606    20583 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY gestion.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 Q   ALTER TABLE ONLY gestion.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       gestion            adrian    false    235            �           2606    20617 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 k   ALTER TABLE ONLY gestion.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       gestion            adrian    false    235    235            �           2606    20573    auth_user auth_user_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY gestion.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY gestion.auth_user DROP CONSTRAINT auth_user_pkey;
       gestion            adrian    false    233            �           2606    20591 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY gestion.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 e   ALTER TABLE ONLY gestion.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       gestion            adrian    false    237            �           2606    20631 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY gestion.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       gestion            adrian    false    237    237            �           2606    20669     auth_user auth_user_username_key 
   CONSTRAINT     `   ALTER TABLE ONLY gestion.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 K   ALTER TABLE ONLY gestion.auth_user DROP CONSTRAINT auth_user_username_key;
       gestion            adrian    false    233            �           2606    20380    bloques bloques_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY gestion.bloques
    ADD CONSTRAINT bloques_pkey PRIMARY KEY (idbloque);
 ?   ALTER TABLE ONLY gestion.bloques DROP CONSTRAINT bloques_pkey;
       gestion            adrian    false    205            �           2606    20485 "   bloques constraint_bloque_proyecto 
   CONSTRAINT     w   ALTER TABLE ONLY gestion.bloques
    ADD CONSTRAINT constraint_bloque_proyecto UNIQUE (idbloque, proyecto_idproyecto);
 M   ALTER TABLE ONLY gestion.bloques DROP CONSTRAINT constraint_bloque_proyecto;
       gestion            adrian    false    205    205            �           2606    20481 8   historialModificacionesTareas constraint_historico_tarea 
   CONSTRAINT     �   ALTER TABLE ONLY gestion."historialModificacionesTareas"
    ADD CONSTRAINT constraint_historico_tarea UNIQUE (idhistorico, tareas_idtarea);
 e   ALTER TABLE ONLY gestion."historialModificacionesTareas" DROP CONSTRAINT constraint_historico_tarea;
       gestion            adrian    false    223    223            �           2606    20483 :   historialModificacionesTareas constraint_historico_usuario 
   CONSTRAINT     �   ALTER TABLE ONLY gestion."historialModificacionesTareas"
    ADD CONSTRAINT constraint_historico_usuario UNIQUE (idhistorico, idusuario);
 g   ALTER TABLE ONLY gestion."historialModificacionesTareas" DROP CONSTRAINT constraint_historico_usuario;
       gestion            adrian    false    223    223            �           2606    20479 %   tareas constraint_idtarea_prioridades 
   CONSTRAINT     }   ALTER TABLE ONLY gestion.tareas
    ADD CONSTRAINT constraint_idtarea_prioridades UNIQUE (idtarea, prioridades_idprioridad);
 P   ALTER TABLE ONLY gestion.tareas DROP CONSTRAINT constraint_idtarea_prioridades;
       gestion            adrian    false    215    215            �           2606    20475    tareas constraint_tarea_bloque 
   CONSTRAINT     o   ALTER TABLE ONLY gestion.tareas
    ADD CONSTRAINT constraint_tarea_bloque UNIQUE (idtarea, bloques_idbloque);
 I   ALTER TABLE ONLY gestion.tareas DROP CONSTRAINT constraint_tarea_bloque;
       gestion            adrian    false    215    215            �           2606    20477    tareas constraint_tarea_estado 
   CONSTRAINT     o   ALTER TABLE ONLY gestion.tareas
    ADD CONSTRAINT constraint_tarea_estado UNIQUE (idtarea, estados_idestado);
 I   ALTER TABLE ONLY gestion.tareas DROP CONSTRAINT constraint_tarea_estado;
       gestion            adrian    false    215    215            �           2606    20473 '   tareasusuario constraint_tareas_usuario 
   CONSTRAINT     �   ALTER TABLE ONLY gestion.tareasusuario
    ADD CONSTRAINT constraint_tareas_usuario UNIQUE (tareas_idtarea_id, usuarios_idusuario_id);
 R   ALTER TABLE ONLY gestion.tareasusuario DROP CONSTRAINT constraint_tareas_usuario;
       gestion            adrian    false    217    217            �           2606    20655 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY gestion.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 Q   ALTER TABLE ONLY gestion.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       gestion            adrian    false    239            �           2606    20539 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY gestion.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 p   ALTER TABLE ONLY gestion.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       gestion            adrian    false    225    225            �           2606    20537 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY gestion.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 W   ALTER TABLE ONLY gestion.django_content_type DROP CONSTRAINT django_content_type_pkey;
       gestion            adrian    false    225            �           2606    20256 (   django_migrations django_migrations_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY gestion.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 S   ALTER TABLE ONLY gestion.django_migrations DROP CONSTRAINT django_migrations_pkey;
       gestion            adrian    false    203            �           2606    20684 "   django_session django_session_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY gestion.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 M   ALTER TABLE ONLY gestion.django_session DROP CONSTRAINT django_session_pkey;
       gestion            adrian    false    240            �           2606    20388    estados estados_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY gestion.estados
    ADD CONSTRAINT estados_pkey PRIMARY KEY (idestado);
 ?   ALTER TABLE ONLY gestion.estados DROP CONSTRAINT estados_pkey;
       gestion            adrian    false    207            �           2606    20466 @   historialModificacionesTareas historialModificacionesTareas_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY gestion."historialModificacionesTareas"
    ADD CONSTRAINT "historialModificacionesTareas_pkey" PRIMARY KEY (idhistorico);
 o   ALTER TABLE ONLY gestion."historialModificacionesTareas" DROP CONSTRAINT "historialModificacionesTareas_pkey";
       gestion            adrian    false    223            �           2606    20396    prioridades prioridades_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY gestion.prioridades
    ADD CONSTRAINT prioridades_pkey PRIMARY KEY (idprioridad);
 G   ALTER TABLE ONLY gestion.prioridades DROP CONSTRAINT prioridades_pkey;
       gestion            adrian    false    209            �           2606    20407    proyectos proyectos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY gestion.proyectos
    ADD CONSTRAINT proyectos_pkey PRIMARY KEY (idproyecto);
 C   ALTER TABLE ONLY gestion.proyectos DROP CONSTRAINT proyectos_pkey;
       gestion            adrian    false    211            �           2606    20458 4   registroEntradaUsuarios registroEntradaUsuarios_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY gestion."registroEntradaUsuarios"
    ADD CONSTRAINT "registroEntradaUsuarios_pkey" PRIMARY KEY (idregistroacceso);
 c   ALTER TABLE ONLY gestion."registroEntradaUsuarios" DROP CONSTRAINT "registroEntradaUsuarios_pkey";
       gestion            adrian    false    221            �           2606    20415    roles roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY gestion.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (idrol);
 ;   ALTER TABLE ONLY gestion.roles DROP CONSTRAINT roles_pkey;
       gestion            adrian    false    213            �           2606    20426    tareas tareas_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY gestion.tareas
    ADD CONSTRAINT tareas_pkey PRIMARY KEY (idtarea);
 =   ALTER TABLE ONLY gestion.tareas DROP CONSTRAINT tareas_pkey;
       gestion            adrian    false    215            �           2606    20434     tareasusuario tareasusuario_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY gestion.tareasusuario
    ADD CONSTRAINT tareasusuario_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY gestion.tareasusuario DROP CONSTRAINT tareasusuario_pkey;
       gestion            adrian    false    217            �           2606    20445    usuarios usuarios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY gestion.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (idusuario);
 A   ALTER TABLE ONLY gestion.usuarios DROP CONSTRAINT usuarios_pkey;
       gestion            adrian    false    219            �           1259    20676    auth_group_name_a6ea08ec_like    INDEX     i   CREATE INDEX auth_group_name_a6ea08ec_like ON gestion.auth_group USING btree (name varchar_pattern_ops);
 2   DROP INDEX gestion.auth_group_name_a6ea08ec_like;
       gestion            adrian    false    229            �           1259    20613 (   auth_group_permissions_group_id_b120cbf9    INDEX     p   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON gestion.auth_group_permissions USING btree (group_id);
 =   DROP INDEX gestion.auth_group_permissions_group_id_b120cbf9;
       gestion            adrian    false    231            �           1259    20614 -   auth_group_permissions_permission_id_84c5c92e    INDEX     z   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON gestion.auth_group_permissions USING btree (permission_id);
 B   DROP INDEX gestion.auth_group_permissions_permission_id_84c5c92e;
       gestion            adrian    false    231            �           1259    20599 (   auth_permission_content_type_id_2f476e4b    INDEX     p   CREATE INDEX auth_permission_content_type_id_2f476e4b ON gestion.auth_permission USING btree (content_type_id);
 =   DROP INDEX gestion.auth_permission_content_type_id_2f476e4b;
       gestion            adrian    false    227            �           1259    20629 "   auth_user_groups_group_id_97559544    INDEX     d   CREATE INDEX auth_user_groups_group_id_97559544 ON gestion.auth_user_groups USING btree (group_id);
 7   DROP INDEX gestion.auth_user_groups_group_id_97559544;
       gestion            adrian    false    235            �           1259    20628 !   auth_user_groups_user_id_6a12ed8b    INDEX     b   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON gestion.auth_user_groups USING btree (user_id);
 6   DROP INDEX gestion.auth_user_groups_user_id_6a12ed8b;
       gestion            adrian    false    235            �           1259    20643 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON gestion.auth_user_user_permissions USING btree (permission_id);
 F   DROP INDEX gestion.auth_user_user_permissions_permission_id_1fbb5f2c;
       gestion            adrian    false    237            �           1259    20642 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     v   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON gestion.auth_user_user_permissions USING btree (user_id);
 @   DROP INDEX gestion.auth_user_user_permissions_user_id_a95ead1b;
       gestion            adrian    false    237            �           1259    20670     auth_user_username_6821ab7c_like    INDEX     o   CREATE INDEX auth_user_username_6821ab7c_like ON gestion.auth_user USING btree (username varchar_pattern_ops);
 5   DROP INDEX gestion.auth_user_username_6821ab7c_like;
       gestion            adrian    false    233            �           1259    20529 $   bloques_proyecto_idproyecto_d27ce5b6    INDEX     h   CREATE INDEX bloques_proyecto_idproyecto_d27ce5b6 ON gestion.bloques USING btree (proyecto_idproyecto);
 9   DROP INDEX gestion.bloques_proyecto_idproyecto_d27ce5b6;
       gestion            adrian    false    205            �           1259    20666 )   django_admin_log_content_type_id_c4bce8eb    INDEX     r   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON gestion.django_admin_log USING btree (content_type_id);
 >   DROP INDEX gestion.django_admin_log_content_type_id_c4bce8eb;
       gestion            adrian    false    239            �           1259    20667 !   django_admin_log_user_id_c564eba6    INDEX     b   CREATE INDEX django_admin_log_user_id_c564eba6 ON gestion.django_admin_log USING btree (user_id);
 6   DROP INDEX gestion.django_admin_log_user_id_c564eba6;
       gestion            adrian    false    239            �           1259    20686 #   django_session_expire_date_a5c62663    INDEX     f   CREATE INDEX django_session_expire_date_a5c62663 ON gestion.django_session USING btree (expire_date);
 8   DROP INDEX gestion.django_session_expire_date_a5c62663;
       gestion            adrian    false    240            �           1259    20685 (   django_session_session_key_c0390e0f_like    INDEX        CREATE INDEX django_session_session_key_c0390e0f_like ON gestion.django_session USING btree (session_key varchar_pattern_ops);
 =   DROP INDEX gestion.django_session_session_key_c0390e0f_like;
       gestion            adrian    false    240            �           1259    20528 5   historialModificacionesTareas_tareas_idtarea_51abfa7e    INDEX     �   CREATE INDEX "historialModificacionesTareas_tareas_idtarea_51abfa7e" ON gestion."historialModificacionesTareas" USING btree (tareas_idtarea);
 L   DROP INDEX gestion."historialModificacionesTareas_tareas_idtarea_51abfa7e";
       gestion            adrian    false    223            �           1259    20522 2   registroEntradaUsuarios_usuario_idusuario_33006b35    INDEX     �   CREATE INDEX "registroEntradaUsuarios_usuario_idusuario_33006b35" ON gestion."registroEntradaUsuarios" USING btree (usuario_idusuario);
 I   DROP INDEX gestion."registroEntradaUsuarios_usuario_idusuario_33006b35";
       gestion            adrian    false    221            �           1259    20501     tareas_bloques_idbloque_491b72ae    INDEX     `   CREATE INDEX tareas_bloques_idbloque_491b72ae ON gestion.tareas USING btree (bloques_idbloque);
 5   DROP INDEX gestion.tareas_bloques_idbloque_491b72ae;
       gestion            adrian    false    215            �           1259    20502     tareas_estados_idestado_de765172    INDEX     `   CREATE INDEX tareas_estados_idestado_de765172 ON gestion.tareas USING btree (estados_idestado);
 5   DROP INDEX gestion.tareas_estados_idestado_de765172;
       gestion            adrian    false    215            �           1259    20503 '   tareas_prioridades_idprioridad_c64ef060    INDEX     n   CREATE INDEX tareas_prioridades_idprioridad_c64ef060 ON gestion.tareas USING btree (prioridades_idprioridad);
 <   DROP INDEX gestion.tareas_prioridades_idprioridad_c64ef060;
       gestion            adrian    false    215            �           1259    20509 (   tareasusuario_tareas_idtarea_id_e0305dcc    INDEX     p   CREATE INDEX tareasusuario_tareas_idtarea_id_e0305dcc ON gestion.tareasusuario USING btree (tareas_idtarea_id);
 =   DROP INDEX gestion.tareasusuario_tareas_idtarea_id_e0305dcc;
       gestion            adrian    false    217            �           1259    20516 ,   tareasusuario_usuarios_idusuario_id_1759be13    INDEX     x   CREATE INDEX tareasusuario_usuarios_idusuario_id_1759be13 ON gestion.tareasusuario USING btree (usuarios_idusuario_id);
 A   DROP INDEX gestion.tareasusuario_usuarios_idusuario_id_1759be13;
       gestion            adrian    false    217            �           1259    20515    usuarios_roles_idrol_671fe408    INDEX     Z   CREATE INDEX usuarios_roles_idrol_671fe408 ON gestion.usuarios USING btree (roles_idrol);
 2   DROP INDEX gestion.usuarios_roles_idrol_671fe408;
       gestion            adrian    false    219            �           2606    20608 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES gestion.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY gestion.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       gestion          adrian    false    227    3252    231            �           2606    20603 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES gestion.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY gestion.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       gestion          adrian    false    3257    229    231            �           2606    20594 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES gestion.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY gestion.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       gestion          adrian    false    227    3247    225            �           2606    20623 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES gestion.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY gestion.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       gestion          adrian    false    3257    235    229            �           2606    20618 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES gestion.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY gestion.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       gestion          adrian    false    3265    235    233            �           2606    20637 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES gestion.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY gestion.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       gestion          adrian    false    3252    227    237            �           2606    20632 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES gestion.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY gestion.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       gestion          adrian    false    237    3265    233            �           2606    20467 D   bloques bloques_proyecto_idproyecto_d27ce5b6_fk_proyectos_idproyecto    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.bloques
    ADD CONSTRAINT bloques_proyecto_idproyecto_d27ce5b6_fk_proyectos_idproyecto FOREIGN KEY (proyecto_idproyecto) REFERENCES gestion.proyectos(idproyecto) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY gestion.bloques DROP CONSTRAINT bloques_proyecto_idproyecto_d27ce5b6_fk_proyectos_idproyecto;
       gestion          adrian    false    205    211    3211            �           2606    20656 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES gestion.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY gestion.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       gestion          adrian    false    239    3247    225            �           2606    20661 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES gestion.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY gestion.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       gestion          adrian    false    233    3265    239            �           2606    20523 W   historialModificacionesTareas historialModificacio_tareas_idtarea_51abfa7e_fk_tareas_id    FK CONSTRAINT     �   ALTER TABLE ONLY gestion."historialModificacionesTareas"
    ADD CONSTRAINT "historialModificacio_tareas_idtarea_51abfa7e_fk_tareas_id" FOREIGN KEY (tareas_idtarea) REFERENCES gestion.tareas(idtarea) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY gestion."historialModificacionesTareas" DROP CONSTRAINT "historialModificacio_tareas_idtarea_51abfa7e_fk_tareas_id";
       gestion          adrian    false    215    223    3223            �           2606    20517 T   registroEntradaUsuarios registroEntradaUsuar_usuario_idusuario_33006b35_fk_usuarios_    FK CONSTRAINT     �   ALTER TABLE ONLY gestion."registroEntradaUsuarios"
    ADD CONSTRAINT "registroEntradaUsuar_usuario_idusuario_33006b35_fk_usuarios_" FOREIGN KEY (usuario_idusuario) REFERENCES gestion.usuarios(idusuario) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY gestion."registroEntradaUsuarios" DROP CONSTRAINT "registroEntradaUsuar_usuario_idusuario_33006b35_fk_usuarios_";
       gestion          adrian    false    221    219    3232            �           2606    20486 ;   tareas tareas_bloques_idbloque_491b72ae_fk_bloques_idbloque    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.tareas
    ADD CONSTRAINT tareas_bloques_idbloque_491b72ae_fk_bloques_idbloque FOREIGN KEY (bloques_idbloque) REFERENCES gestion.bloques(idbloque) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY gestion.tareas DROP CONSTRAINT tareas_bloques_idbloque_491b72ae_fk_bloques_idbloque;
       gestion          adrian    false    205    215    3202            �           2606    20491 ;   tareas tareas_estados_idestado_de765172_fk_estados_idestado    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.tareas
    ADD CONSTRAINT tareas_estados_idestado_de765172_fk_estados_idestado FOREIGN KEY (estados_idestado) REFERENCES gestion.estados(idestado) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY gestion.tareas DROP CONSTRAINT tareas_estados_idestado_de765172_fk_estados_idestado;
       gestion          adrian    false    207    3207    215            �           2606    20496 8   tareas tareas_prioridades_idpriori_c64ef060_fk_prioridad    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.tareas
    ADD CONSTRAINT tareas_prioridades_idpriori_c64ef060_fk_prioridad FOREIGN KEY (prioridades_idprioridad) REFERENCES gestion.prioridades(idprioridad) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY gestion.tareas DROP CONSTRAINT tareas_prioridades_idpriori_c64ef060_fk_prioridad;
       gestion          adrian    false    215    3209    209            �           2606    20504 H   tareasusuario tareasusuario_tareas_idtarea_id_e0305dcc_fk_tareas_idtarea    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.tareasusuario
    ADD CONSTRAINT tareasusuario_tareas_idtarea_id_e0305dcc_fk_tareas_idtarea FOREIGN KEY (tareas_idtarea_id) REFERENCES gestion.tareas(idtarea) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY gestion.tareasusuario DROP CONSTRAINT tareasusuario_tareas_idtarea_id_e0305dcc_fk_tareas_idtarea;
       gestion          adrian    false    217    3223    215            �           2606    20446 F   tareasusuario tareasusuario_usuarios_idusuario_i_1759be13_fk_usuarios_    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.tareasusuario
    ADD CONSTRAINT tareasusuario_usuarios_idusuario_i_1759be13_fk_usuarios_ FOREIGN KEY (usuarios_idusuario_id) REFERENCES gestion.usuarios(idusuario) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY gestion.tareasusuario DROP CONSTRAINT tareasusuario_usuarios_idusuario_i_1759be13_fk_usuarios_;
       gestion          adrian    false    217    219    3232            �           2606    20510 5   usuarios usuarios_roles_idrol_671fe408_fk_roles_idrol    FK CONSTRAINT     �   ALTER TABLE ONLY gestion.usuarios
    ADD CONSTRAINT usuarios_roles_idrol_671fe408_fk_roles_idrol FOREIGN KEY (roles_idrol) REFERENCES gestion.roles(idrol) DEFERRABLE INITIALLY DEFERRED;
 `   ALTER TABLE ONLY gestion.usuarios DROP CONSTRAINT usuarios_roles_idrol_671fe408_fk_roles_idrol;
       gestion          adrian    false    3213    219    213            �      x������ � �      �      x������ � �      �   �  x���I��0E��)|��<�s� c1nn�-�	|�����iy'���'U���
]�:��*^���*7��c����[������]<�ɂyJ���?}�k�Ǆ@6����>]\Mj2�Z΀�S�N���݋�!�Qq�<�vu	ҳ��Z�����N��ZT
@(7lp��Zx<�������3�ѻ�����(�ֹ�㝏�2�_m5ݯ�m� S�_���!���?��k�|�Iװ[�1�-	c�k�wa�ɘI�`�cLe] �bD���>n��H(|m"�t
d��d
�B��@��)t���$|c��L
d�L
�2��@R}�4�]��!�2��ɷ����$]����2��|��)�t��)���g�<���

Ƃ�<X?!�d��z�A�P��!�]����ѷ&�(B��&רC��*Ш��T�$Oa��U����oM���`L����`T�� ��b���07W5bS&�f��J/�v���d��h[YS?Y�b/���������_���ny���g.{�pბ��ԏӐ��� k���Q��L,5)����91K}Jx��g���R��/z�i{���Ϋ�����c8�w|�i��0���ݭ9����-�3��U?���~����Fol�׏o��      �      x������ � �      �      x������ � �      �      x������ � �      l      x������ � �      �      x������ � �      �   �   x�U�I�0E��a�2݁#�1�	�ڸ�ɢ�'P`���g�0��� �R�6K���td3�ۅD�2A��b��s��\��<��
�;�w�}8����)�� �Bpl�,c850)�r� ~�e�>xߘ� ~�dF%��V�`��kFC�o/�lY���2�-�^����q�}=l�yY�?Tr4      j   �  x���[n� E��U��j��<��.��%�A��5�/8.�G�d��x����w��!��6Y��zC���>�G�;a�H��Ȏ4{?$3�tM|")��$i��t�NP*$W%�}���a�JDJ��F8��B�����@��}8�3�@D�2蕑s�������`�v���Z��iq���W�l@فA�f�U����h�L�ф��XJ*y��/83t��*J�yA���j�y1��n�"�P0�v�)�\�Ӻ��b��+��e8Sqosk�[�:�T��E��Rx��3�P���X{ h�:��O�Tr��t�!��7!� ��Qwωj�aaVir�͆e�xK/u����=����&���hAu�O�s!�2wQ1�120�{����(��+�D���|�IBg�_�����O�      �      x������ � �      n      x������ � �      ~      x������ � �      p      x������ � �      r      x������ � �      |      x������ � �      t      x������ � �      v      x������ � �      x      x������ � �      z      x������ � �     