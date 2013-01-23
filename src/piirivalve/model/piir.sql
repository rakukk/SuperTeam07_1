CREATE TABLE RIIGI_ADMIN_YKSUSE_LIIK (
       riigi_admin_yksuse_liik_id INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       kood                 VARCHAR(10) NOT NULL,
       nimetus              VARCHAR(100) NOT NULL,
       kommentaar           LONGVARCHAR,
       alates               DATE NOT NULL,
       kuni                 DATE NOT NULL,
       PRIMARY KEY (riigi_admin_yksuse_liik_id)
);


CREATE TABLE RIIGI_ADMIN_YKSUS (
       riigi_admin_yksus_ID INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       kood                 VARCHAR(20),
       nimetus              VARCHAR(100),
       kommentaar           LONGVARCHAR,
       alates               DATE NOT NULL,
       kuni                 DATE NOT NULL,
       riigi_admin_yksuse_lik_id INTEGER NOT NULL,
       PRIMARY KEY (riigi_admin_yksus_ID), 
       FOREIGN KEY (riigi_admin_yksuse_lik_id)
                             REFERENCES RIIGI_ADMIN_YKSUSE_LIIK
                             ON DELETE RESTRICT
);



CREATE TABLE VAEOSA (
       vaeosa_ID_id         INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       kood                 VARCHAR(20) NOT NULL,
       nimetus              VARCHAR(100) NOT NULL,
       kommentaar           LONGVARCHAR,
       riigi_admin_yksus_ID INTEGER NOT NULL,
       alates               DATE NOT NULL,
       kuni                 DATE NOT NULL,
       PRIMARY KEY (vaeosa_ID_id), 
       FOREIGN KEY (riigi_admin_yksus_ID)
                             REFERENCES RIIGI_ADMIN_YKSUS
                             ON DELETE RESTRICT
);




CREATE TABLE PIIRIPUNKT (
       piiripunkt_ID        INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       kood                 VARCHAR(20) NOT NULL,
       nimetus              VARCHAR(100) NOT NULL,
       GPS_Longituide       DECIMAL(9) NOT NULL,
       GPS_latitude         DECIMAL(9) NOT NULL,
       korgus_merepinnast   DECIMAL(6) NOT NULL,
       kommentaar           LONGVARCHAR,
       alates               DATE NOT NULL,
       kuni                 DATE NOT NULL,
       PRIMARY KEY (piiripunkt_ID)
);




CREATE TABLE VAHTKOND (
       vahtkond_ID          INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       kood                 VARCHAR(20),
       nimetus              VARCHAR(60),
       kommentaar           LONGVARCHAR,
       alates               DATE,
       kuni                 DATE,
       piiripunkt_ID        INTEGER,
       vaeosa_ID_id         INTEGER,
       PRIMARY KEY (vahtkond_ID), 
       FOREIGN KEY (vaeosa_ID_id)
                             REFERENCES VAEOSA
                             ON DELETE SET NULL, 
       FOREIGN KEY (piiripunkt_ID)
                             REFERENCES PIIRIPUNKT
                             ON DELETE SET NULL
);



CREATE TABLE INTSIDENDI_LIIK (
       intsidendi_liik_ID   INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       kood                 CHAR(18),
       nimetus              VARCHAR(60),
       kommentaar           LONGVARCHAR,
       PRIMARY KEY (intsidendi_liik_ID)
);



CREATE TABLE PIIRILOIK (
       piiriloik_ID         INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       kood                 CHAR(18),
       nimetus              VARCHAR(60),
       GPS_koordinaadid     LONGVARCHAR,
       kommentaar           LONGVARCHAR,
       PRIMARY KEY (piiriloik_ID)
);



CREATE TABLE INTSIDENT (
       intsident_ID         INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       kood                 VARCHAR(20),
       nimetus              VARCHAR(100),
       toimumise_algus      DATE,
       toimumise_lopp       DATE,
       kirjeldus            LONGVARCHAR,
       kommentaar           LONGVARCHAR,
       piiriloik_ID         INTEGER,
       intsidendi_liik_ID   INTEGER NOT NULL,
       GPS_longituud        DECIMAL(9),
       GPS_latituud         DECIMAL(9),
       PRIMARY KEY (intsident_ID), 
       FOREIGN KEY (intsidendi_liik_ID)
                             REFERENCES INTSIDENDI_LIIK
                             ON DELETE RESTRICT, 
       FOREIGN KEY (piiriloik_ID)
                             REFERENCES PIIRILOIK
                             ON DELETE SET NULL
);



CREATE TABLE VAHTKOND_INTSIDENDIS (
       vahtkond_intsidendis_ID INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       alates               DATE,
       kuni                 DATE,
       kirjeldus            LONGVARCHAR,
       kommentaar           LONGVARCHAR,
       intsident_ID         INTEGER NOT NULL,
       vahtkond_ID          INTEGER,
       PRIMARY KEY (vahtkond_intsidendis_ID), 
       FOREIGN KEY (vahtkond_ID)
                             REFERENCES VAHTKOND
                             ON DELETE SET NULL, 
       FOREIGN KEY (intsident_ID)
                             REFERENCES INTSIDENT
                             ON DELETE RESTRICT
);



CREATE TABLE PIIRIVALVUR (
       piirivalvur_ID       INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       isikukood            VARCHAR(20),
       eesnimed             VARCHAR(25),
       perekonnanimi        VARCHAR(35),
       sugu                 CHAR(1),
       soduri_kood          VARCHAR(20),
       kommentaar           LONGVARCHAR,
       PRIMARY KEY (piirivalvur_ID)
);



CREATE TABLE PiIRIVALVUR_INTSIDENDIS (
       piirivalvur_intsidendis_ID INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       alates               DATE,
       kuni                 DATE,
       kirjeldus            LONGVARCHAR,
       kommentaar           LONGVARCHAR,
       intsident_ID         INTEGER,
       piirivalvur_ID       INTEGER NOT NULL,
       vahtkond_intsidendis_ID INTEGER,
       PRIMARY KEY (piirivalvur_intsidendis_ID), 
       FOREIGN KEY (vahtkond_intsidendis_ID)
                             REFERENCES VAHTKOND_INTSIDENDIS
                             ON DELETE SET NULL, 
       FOREIGN KEY (piirivalvur_ID)
                             REFERENCES PIIRIVALVUR
                             ON DELETE RESTRICT, 
       FOREIGN KEY (intsident_ID)
                             REFERENCES INTSIDENT
                             ON DELETE SET NULL
);



CREATE TABLE RUUMIYKSUSE_LIIK (
       ruumiyksuse_liik_ID  INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       kood                 VARCHAR(20),
       nimetus              VARCHAR(60),
       kommentaar           LONGVARCHAR,
       PRIMARY KEY (ruumiyksuse_liik_ID)
);



CREATE TABLE RUUMIYKSUS (
       ruumiyksus_ID        INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       aadress              CHAR(18),
       nimetus              CHAR(18),
       kommentaar           CHAR(18),
       kood                 CHAR(18),
       ruumiyksuse_liik_ID  INTEGER NOT NULL,
       ylem_ruumiyksus_ID   INTEGER,
       riigi_admin_yksus_ID INTEGER,
       PRIMARY KEY (ruumiyksus_ID), 
       FOREIGN KEY (riigi_admin_yksus_ID)
                             REFERENCES RIIGI_ADMIN_YKSUS
                             ON DELETE SET NULL, 
       FOREIGN KEY (ylem_ruumiyksus_ID)
                             REFERENCES RUUMIYKSUS
                             ON DELETE SET NULL, 
       FOREIGN KEY (ruumiyksuse_liik_ID)
                             REFERENCES RUUMIYKSUSE_LIIK
                             ON DELETE RESTRICT
);



CREATE TABLE VOODIKOHT (
       voodikoht_ID         INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       number               VARCHAR(20),
       pikkus               INTEGER,
       laius                INTEGER,
       kommentaar           LONGVARCHAR,
       ruumiyksus_ID        INTEGER NOT NULL,
       PRIMARY KEY (voodikoht_ID), 
       FOREIGN KEY (ruumiyksus_ID)
                             REFERENCES RUUMIYKSUS
                             ON DELETE RESTRICT
);



CREATE TABLE PIIRIVALVUR_VOODIKOHAL (
       piirivalvur_voodikohal_id                  INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       voodikoht_ID         INTEGER NOT NULL,
       piirivalvur_ID       INTEGER NOT NULL,
       alates               DATE,
       kuni                 DATE,
       kommentaar           LONGVARCHAR,
       PRIMARY KEY (piirivalvur_voodikohal_id), 
       FOREIGN KEY (piirivalvur_ID)
                             REFERENCES PIIRIVALVUR
                             ON DELETE RESTRICT, 
       FOREIGN KEY (voodikoht_ID)
                             REFERENCES VOODIKOHT
                             ON DELETE RESTRICT
);



CREATE TABLE VAHTKONNA_LIIGE (
       vahtkonna_liige_ID   INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       vahtkond_ID          INTEGER NOT NULL,
       piirivalvur_ID       INTEGER NOT NULL,
       alates               CHAR(18),
       kuni                 CHAR(18),
       kommentaar           CHAR(18),
       PRIMARY KEY (vahtkonna_liige_ID), 
       FOREIGN KEY (piirivalvur_ID)
                             REFERENCES PIIRIVALVUR
                             ON DELETE RESTRICT, 
       FOREIGN KEY (vahtkond_ID)
                             REFERENCES VAHTKOND
                             ON DELETE RESTRICT
);



CREATE TABLE VAHTKONND_PIIRILOIGUL (
       vahtkond_piiriloiul_ID INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       piiriloik_ID         INTEGER NOT NULL,
       vahtkond_ID          INTEGER NOT NULL,
       alates               DATE,
       kuni                 DATE,
       kommentaar           LONGVARCHAR,
       PRIMARY KEY (vahtkond_piiriloiul_ID), 
       FOREIGN KEY (vahtkond_ID)
                             REFERENCES VAHTKOND
                             ON DELETE RESTRICT, 
       FOREIGN KEY (piiriloik_ID)
                             REFERENCES PIIRILOIK
                             ON DELETE RESTRICT
);



CREATE TABLE OBJEKTI_LIIK (
       objekt_liik_ID       INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       nimetus              VARCHAR(100) NOT NULL,
       kommentaar           LONGVARCHAR,
       kood                 CHAR(18),
       PRIMARY KEY (objekt_liik_ID)
);



CREATE TABLE OBJEKT (
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       nimetus              VARCHAR(100),
       kommentaar           LONGVARCHAR,
       objekt_ID            INTEGER NOT NULL,
       objekt_liik_ID       INTEGER NOT NULL,
       PRIMARY KEY (objekt_ID), 
       FOREIGN KEY (objekt_liik_ID)
                             REFERENCES OBJEKTI_LIIK
                             ON DELETE RESTRICT
);



CREATE TABLE AMET (
       amet_ID              INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       ISCO_kood            VARCHAR(10),
       nimetus              VARCHAR(60),
       kommentaar           LONGVARCHAR,
       PRIMARY KEY (amet_ID)
);


CREATE TABLE AMET_PIIRIPUNKTIS (
       amet_piiripunktis_ID INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       alates               DATE NOT NULL,
       kuni                 DATE NOT NULL,
       kommentaar           LONGVARCHAR,
       piiripunkt_ID        INTEGER NOT NULL,
       amet_ID              INTEGER NOT NULL,
       PRIMARY KEY (amet_piiripunktis_ID), 
       FOREIGN KEY (amet_ID)
                             REFERENCES AMET
                             ON DELETE RESTRICT, 
       FOREIGN KEY (piiripunkt_ID)
                             REFERENCES PIIRIPUNKT
                             ON DELETE RESTRICT
);



CREATE TABLE PIIRIVALVUR_PIIRIPUNKTIS (
       piirivalvur_piiripunktis_ID INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       alates               DATE NOT NULL,
       kuni                 DATE NOT NULL,
       koormus              DECIMAL(5) NOT NULL,
       kommentaar           LONGVARCHAR,
       piirivalvur_ID       INTEGER NOT NULL,
       amet_piiripunktis_ID INTEGER NOT NULL,
       PRIMARY KEY (piirivalvur_piiripunktis_ID), 
       FOREIGN KEY (piirivalvur_ID)
                             REFERENCES PIIRIVALVUR
                             ON DELETE RESTRICT, 
       FOREIGN KEY (amet_piiripunktis_ID)
                             REFERENCES AMET_PIIRIPUNKTIS
                             ON DELETE RESTRICT
);


CREATE TABLE AMET_VAEOSAS (
       amet_vaeosas_ID      INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       alates               DATE NOT NULL,
       kuni                 DATE NOT NULL,
       kommentaar           LONGVARCHAR,
       vaeosa_ID_id         INTEGER NOT NULL,
       amet_ID              INTEGER NOT NULL,
       PRIMARY KEY (amet_vaeosas_ID), 
       FOREIGN KEY (amet_ID)
                             REFERENCES AMET
                             ON DELETE RESTRICT, 
       FOREIGN KEY (vaeosa_ID_id)
                             REFERENCES VAEOSA
                             ON DELETE RESTRICT
);



CREATE TABLE PIIRIPUNKTI_ORG_YKSUS (
       piiripunkti_org_yksus_ID INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       kood                 VARCHAR(20) NOT NULL,
       nimetus              VARCHAR(100) NOT NULL,
       kommentaar           LONGVARCHAR,
       ylem_org_yksus_ID    INTEGER,
       vaeosa_ID_id         INTEGER NOT NULL,
       alates               DATE NOT NULL,
       kuni                 DATE NOT NULL,
       piiripunkt_ID        INTEGER NOT NULL,
       PRIMARY KEY (piiripunkti_org_yksus_ID), 
       FOREIGN KEY (ylem_org_yksus_ID)
                             REFERENCES PIIRIPUNKTI_ORG_YKSUS
                             ON DELETE SET NULL, 
       FOREIGN KEY (piiripunkt_ID)
                             REFERENCES PIIRIPUNKT
                             ON DELETE RESTRICT
);


CREATE TABLE PIIRIVALVUR_VAEOSAS (
       piirivalvur_vaeosas_ID INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       alates               DATE,
       kuni                 DATE,
       koormus              DECIMAL(5),
       kommentaar           LONGVARCHAR,
       piirivalvur_ID       INTEGER NOT NULL,
       amet_vaeosas_ID      INTEGER NOT NULL,
       PRIMARY KEY (piirivalvur_vaeosas_ID), 
       FOREIGN KEY (amet_vaeosas_ID)
                             REFERENCES AMET_VAEOSAS
                             ON DELETE RESTRICT, 
       FOREIGN KEY (piirivalvur_ID)
                             REFERENCES PIIRIVALVUR
                             ON DELETE RESTRICT
);



CREATE TABLE SUGULUSE_ROLLI_LIIK (
       suguluse_rolli_liik_ID INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       nimetus              VARCHAR(60) NOT NULL,
       kommentaar           LONGVARCHAR NOT NULL,
       sugulane_voi_mitte   CHAR(1),
       PRIMARY KEY (suguluse_rolli_liik_ID)
);




CREATE TABLE SEOTUD_KONTAKTISIK (
       piirivalvuri_kontakt_ID INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       kommentaar           LONGVARCHAR NOT NULL,
       piirivalvur_ID       INTEGER NOT NULL,
       suguluse_rolli_liik_ID INTEGER NOT NULL,
       alates               DATE,
       kuni                 DATE,
       PRIMARY KEY (piirivalvuri_kontakt_ID), 
       FOREIGN KEY (suguluse_rolli_liik_ID)
                             REFERENCES SUGULUSE_ROLLI_LIIK
                             ON DELETE RESTRICT, 
       FOREIGN KEY (piirivalvur_ID)
                             REFERENCES PIIRIVALVUR
                             ON DELETE RESTRICT
);



CREATE TABLE KONTAKTI_LIIK (
       kontakti_liik_ID     INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       nimetus              VARCHAR(60) NOT NULL,
       kommentaar           LONGVARCHAR NOT NULL,
       XML_kirjeldus        LONGVARCHAR,
       PRIMARY KEY (kontakti_liik_ID)
);



CREATE TABLE PIIRIVALVURI_KONTAKT (
       piirivalvuri_kontakt_ID INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       kontakt              VARCHAR(120) NOT NULL,
       kommentaar           LONGVARCHAR NOT NULL,
       peamine_kontakt      VARCHAR(1),
       piirivalvur_ID       INTEGER NOT NULL,
       kontakti_liik_ID     INTEGER NOT NULL,
       alates               DATE,
       kuni                 DATE,
       PRIMARY KEY (piirivalvuri_kontakt_ID), 
       FOREIGN KEY (kontakti_liik_ID)
                             REFERENCES KONTAKTI_LIIK
                             ON DELETE RESTRICT, 
       FOREIGN KEY (piirivalvur_ID)
                             REFERENCES PIIRIVALVUR
                             ON DELETE RESTRICT
);


CREATE TABLE AUASTE (
       auaste_ID            INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       kood                 VARCHAR(20),
       nimetus              VARCHAR(60),
       kommentaar           LONGVARCHAR,
       PRIMARY KEY (auaste_ID)
);



CREATE TABLE AUASTME_MUUTUMINE (
       auastme_muutumine_ID INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       piirivalvur_ID       INTEGER NOT NULL,
       auaste_ID            INTEGER NOT NULL,
       alates               DATE,
       kuni                 DATE,
       kommentaar           LONGVARCHAR,
       PRIMARY KEY (auastme_muutumine_ID), 
       FOREIGN KEY (auaste_ID)
                             REFERENCES AUASTE
                             ON DELETE RESTRICT, 
       FOREIGN KEY (piirivalvur_ID)
                             REFERENCES PIIRIVALVUR
                             ON DELETE RESTRICT
);



CREATE TABLE ADMIN_ALLUVUS (
       admin_alluvus_id     INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       alates               CHAR(18),
       kuni                 CHAR(18),
       kommentaar           CHAR(18),
       ylemus_yksus_ID      INTEGER NOT NULL,
       alluv_yksus_ID       INTEGER NOT NULL,
       PRIMARY KEY (admin_alluvus_id), 
       FOREIGN KEY (alluv_yksus_ID)
                             REFERENCES RIIGI_ADMIN_YKSUS
                             ON DELETE RESTRICT, 
       FOREIGN KEY (ylemus_yksus_ID)
                             REFERENCES RIIGI_ADMIN_YKSUS
                             ON DELETE RESTRICT
);



CREATE TABLE PIIRILOIGU_HALDAJA (
       piiriloigu_haldaja_ID INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       piiriloik_ID         INTEGER,
       piiripunkt_ID        INTEGER,
       vaeosa_ID_id         INTEGER NOT NULL,
       alates               DATE,
       kuni                 DATE,
       kommentaar           LONGVARCHAR,
       PRIMARY KEY (piiriloigu_haldaja_ID), 
       FOREIGN KEY (vaeosa_ID_id)
                             REFERENCES VAEOSA
                             ON DELETE RESTRICT, 
       FOREIGN KEY (piiripunkt_ID)
                             REFERENCES PIIRIPUNKT
                             ON DELETE SET NULL, 
       FOREIGN KEY (piiriloik_ID)
                             REFERENCES PIIRILOIK
                             ON DELETE SET NULL
);



CREATE TABLE VOIMALIK_ALLUVUS (
       voimalik_alluvus_id  INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       riigi_admin_yksuse_lik_id INTEGER NOT NULL,
       voimalik_alluv_liik_ID INTEGER NOT NULL,
       kommentaar           LONGVARCHAR,
       PRIMARY KEY (voimalik_alluvus_id), 
       FOREIGN KEY (voimalik_alluv_liik_ID)
                             REFERENCES RIIGI_ADMIN_YKSUSE_LIIK
                             ON DELETE RESTRICT, 
       FOREIGN KEY (riigi_admin_yksuse_lik_id)
                             REFERENCES RIIGI_ADMIN_YKSUSE_LIIK
                             ON DELETE RESTRICT
);



CREATE TABLE PIIRIPUNKTI_ALLUVUS (
       piiripunkti_alluvus_ID INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       alates               CHAR(18),
       kuni                 CHAR(18),
       kommentaar           CHAR(18),
       vaeosa_ID            INTEGER NOT NULL,
       piiripunkt_ID        INTEGER NOT NULL,
       PRIMARY KEY (piiripunkti_alluvus_ID), 
       FOREIGN KEY (piiripunkt_ID)
                             REFERENCES PIIRIPUNKT
                             ON DELETE RESTRICT, 
       FOREIGN KEY (vaeosa_ID)
                             REFERENCES VAEOSA
                             ON DELETE RESTRICT
);



CREATE TABLE VAEOSA_ALLUVUS (
       vaeosa_alluvus_id    INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       ylemus_vaeosa_ID     INTEGER NOT NULL,
       alluva_vaeosa_ID     INTEGER NOT NULL,
       alates               DATE NOT NULL,
       kuni                 DATE NOT NULL,
       kommentaar           LONGVARCHAR,
       PRIMARY KEY (vaeosa_alluvus_id), 
       FOREIGN KEY (alluva_vaeosa_ID)
                             REFERENCES VAEOSA
                             ON DELETE RESTRICT, 
       FOREIGN KEY (ylemus_vaeosa_ID)
                             REFERENCES VAEOSA
                             ON DELETE RESTRICT
);



CREATE TABLE ORG_YKSUS (
       org_yksus_ID         INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       kood                 VARCHAR(20) NOT NULL,
       nimetus              VARCHAR(100) NOT NULL,
       kommentaar           LONGVARCHAR,
       ylem_org_yksus_ID    INTEGER,
       vaeosa_ID_id         INTEGER NOT NULL,
       alates               DATE NOT NULL,
       kuni                 DATE NOT NULL,
       PRIMARY KEY (org_yksus_ID), 
       FOREIGN KEY (vaeosa_ID_id)
                             REFERENCES VAEOSA
                             ON DELETE RESTRICT, 
       FOREIGN KEY (ylem_org_yksus_ID)
                             REFERENCES ORG_YKSUS
                             ON DELETE SET NULL
);



CREATE TABLE SEADUS (
       seaduse_ID           INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       kood                 VARCHAR(20) NOT NULL,
       nimetus              VARCHAR(20) NOT NULL,
       kommentaar           VARCHAR(20) NOT NULL,
       kehtiv_alates        CHAR(18),
       kehtiv_kuni          CHAR(18),
       PRIMARY KEY (seaduse_ID)
);



CREATE TABLE SEADUSE_PUNKT (
       seaduse_punkt_ID     INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       paragrahv            CHAR(18),
       pais                 CHAR(18),
       tekst                CHAR(18),
       kommentaar           CHAR(18),
       kehtiv_alates        CHAR(18),
       kehtiv_kuni          CHAR(18),
       seaduse_ID           INTEGER NOT NULL,
       ylemus_seaduse_punkt_ID INTEGER,
       PRIMARY KEY (seaduse_punkt_ID), 
       FOREIGN KEY (ylemus_seaduse_punkt_ID)
                             REFERENCES SEADUSE_PUNKT
                             ON DELETE SET NULL, 
       FOREIGN KEY (seaduse_ID)
                             REFERENCES SEADUS
                             ON DELETE RESTRICT
);



CREATE TABLE OBJEKT_INTSIDENDIS (
       objekt_intsidendis_ID INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       intsident_ID         INTEGER NOT NULL,
       alates               DATE,
       kuni                 DATE,
       kirjeldus            LONGVARCHAR,
       kommentaar           LONGVARCHAR,
       objekt_ID            INTEGER NOT NULL,
       PRIMARY KEY (objekt_intsidendis_ID), 
       FOREIGN KEY (intsident_ID)
                             REFERENCES INTSIDENT
                             ON DELETE RESTRICT, 
       FOREIGN KEY (objekt_ID)
                             REFERENCES OBJEKT
                             ON DELETE RESTRICT
);



CREATE TABLE PIIRIRIKKUJA (
       piiririkkuja_ID      INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       isikukood            VARCHAR(20),
       kommentaar           LONGVARCHAR,
       eesnimi              VARCHAR(25),
       perek_nimi           VARCHAR(35),
       sugu                 CHAR(1),
       synniaeg             DATE,
       objekt_ID            INTEGER NOT NULL,
       PRIMARY KEY (piiririkkuja_ID), 
       FOREIGN KEY (objekt_ID)
                             REFERENCES OBJEKT
                             ON DELETE RESTRICT
);


CREATE TABLE ISIK_INTSIDENDIS (
       isik_intsidendis_ID  INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       alates               DATE NOT NULL,
       kuni                 DATE NOT NULL,
       kirjeldus            LONGVARCHAR NOT NULL,
       kommentaar           LONGVARCHAR,
       intsident_ID         INTEGER,
       piiririkkuja_ID      INTEGER NOT NULL,
       PRIMARY KEY (isik_intsidendis_ID), 
       FOREIGN KEY (piiririkkuja_ID)
                             REFERENCES PIIRIRIKKUJA
                             ON DELETE RESTRICT, 
       FOREIGN KEY (intsident_ID)
                             REFERENCES INTSIDENT
                             ON DELETE SET NULL
);



CREATE TABLE RIIK (
       riik_ID              INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       ISO_kood             VARCHAR(20) NOT NULL,
       kommentaar           LONGVARCHAR,
       ANSI_kood            CHAR(18),
       PRIMARY KEY (riik_ID)
);



CREATE TABLE ISIKU_SEADUS_INTSIDENDIS (
       isiku_seadus_intsidendis_ID INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       alates               DATE NOT NULL,
       kuni                 DATE NOT NULL,
       kirjeldus            LONGVARCHAR NOT NULL,
       kommentaar           LONGVARCHAR,
       isik_intsidendis_ID  INTEGER NOT NULL,
       seaduse_punkt_ID     INTEGER NOT NULL,
       PRIMARY KEY (isiku_seadus_intsidendis_ID), 
       FOREIGN KEY (seaduse_punkt_ID)
                             REFERENCES SEADUSE_PUNKT
                             ON DELETE RESTRICT, 
       FOREIGN KEY (isik_intsidendis_ID)
                             REFERENCES ISIK_INTSIDENDIS
                             ON DELETE RESTRICT
);



CREATE TABLE OBJEKTI_SEADUS_INTSIDENDIS (
       objekti_seadus_intsidendis_ID INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       alates               DATE NOT NULL,
       kuni                 DATE NOT NULL,
       kirjeldus            LONGVARCHAR NOT NULL,
       kommentaar           LONGVARCHAR,
       objekt_intsidendis_ID INTEGER NOT NULL,
       seaduse_punkt_ID     INTEGER NOT NULL,
       PRIMARY KEY (objekti_seadus_intsidendis_ID), 
       FOREIGN KEY (seaduse_punkt_ID)
                             REFERENCES SEADUSE_PUNKT
                             ON DELETE RESTRICT, 
       FOREIGN KEY (objekt_intsidendis_ID)
                             REFERENCES OBJEKT_INTSIDENDIS
                             ON DELETE RESTRICT
);


CREATE TABLE KODAKONDSUS (
       kodakondsus_ID       INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       kommentaar           LONGVARCHAR,
       alates               DATE,
       kuni                 DATE,
       riik_ID              INTEGER NOT NULL,
       piiririkkuja_ID      INTEGER NOT NULL,
       isikukood            VARCHAR(20),
       PRIMARY KEY (kodakondsus_ID), 
       FOREIGN KEY (piiririkkuja_ID)
                             REFERENCES PIIRIRIKKUJA
                             ON DELETE RESTRICT, 
       FOREIGN KEY (riik_ID)
                             REFERENCES RIIK
                             ON DELETE RESTRICT
);



CREATE TABLE PIIRIVALVURI_SEADUS_INTSIDENDI (
       piirivalvuri_seadus_intsidendi INTEGER,
       avaja                VARCHAR(32) NOT NULL,
       avatud               DATE NOT NULL,
       muutja               VARCHAR(32) NOT NULL,
       muudetud             DATE NOT NULL,
       sulgeja              VARCHAR(32),
       suletud              DATE NOT NULL,
       alates               DATE NOT NULL,
       kuni                 DATE NOT NULL,
       kirjeldus            LONGVARCHAR NOT NULL,
       kommentaar           LONGVARCHAR,
       piirivalvur_intsidendis_ID INTEGER NOT NULL,
       seaduse_punkt_ID     INTEGER NOT NULL,
       PRIMARY KEY (piirivalvuri_seadus_intsidendi), 
       FOREIGN KEY (seaduse_punkt_ID)
                             REFERENCES SEADUSE_PUNKT
                             ON DELETE RESTRICT, 
       FOREIGN KEY (piirivalvur_intsidendis_ID)
                             REFERENCES PIIRIVALVUR_INTSIDENDIS
                             ON DELETE RESTRICT
);
