-- tables
-- Table: AMET
CREATE TABLE AMET (
    amet_ID int  NOT NULL,
    amet_nimi varchar(60)  NOT NULL,
    amet_alates date  NOT NULL,
    amet_kuni date  NULL,
    amet_palk decimal(6,2)  NOT NULL,
    amet_kommentaar text  NULL,
    CONSTRAINT AMET_pk PRIMARY KEY (amet_ID)
);

-- Table: AMET_LEPINGUS
CREATE TABLE AMET_LEPINGUS (
    amet_lepingus_ID int  NOT NULL,
    amet_lepingus_alates date  NOT NULL,
    amet_lepingus_kuni date  NULL,
    amet_lepingus_kommentaar text  NULL,
    LEPING_leping_ID int  NOT NULL,
    AMET_amet_ID int  NULL,
    CONSTRAINT AMET_LEPINGUS_pk PRIMARY KEY (amet_lepingus_ID)
);

-- Table: BILANSS
CREATE TABLE BILANSS (
    bilanss_ID int  NOT NULL,
    bilanss_kuupaev date  NOT NULL,
    bilanssi_periodi_alates date  NOT NULL,
    bilanssi_periodi_kuni date  NOT NULL,
    bilanssi_aktiva decimal(14,2)  NOT NULL,
    bilanssi_passiva decimal(14,2)  NOT NULL,
    bilanssi_kapital decimal(14,2)  NOT NULL,
    bilanss_jaotamata_kasum decimal(14,2)  NOT NULL,
    bilanssi_kommentaar text  NULL,
    FOND_fond_ID int  NULL,
    FIRMA_firma_ID int  NULL,
    CONSTRAINT BILANSS_pk PRIMARY KEY (bilanss_ID)
);

-- Table: FIRMA
CREATE TABLE FIRMA (
    firma_ID int  NOT NULL,
    firma_nimi varchar(60)  NOT NULL,
    firma_alates date  NOT NULL,
    firma_kuni date  NULL,
    fira_reg_kood varchar(20)  NOT NULL,
    FIRMA_LIIK_firma_liik_ID int  NOT NULL,
    CONSTRAINT FIRMA_pk PRIMARY KEY (firma_ID)
);

-- Table: FIRMA_LIIK
CREATE TABLE FIRMA_LIIK (
    firma_liik_ID int  NOT NULL,
    firma_liik_nimi varchar(35)  NOT NULL,
    firma_liik_alates date  NOT NULL,
    firma_liik_kuni date  NULL,
    kommentaar text  NULL,
    CONSTRAINT FIRMA_LIIK_pk PRIMARY KEY (firma_liik_ID)
);

-- Table: FOND
CREATE TABLE FOND (
    fond_ID int  NOT NULL,
    fond_nimi varchar(35)  NOT NULL,
    fond_alates date  NOT NULL,
    fond_kuni date  NULL,
    fond_kommentaar text  NULL,
    CONSTRAINT FOND_pk PRIMARY KEY (fond_ID)
);

-- Table: FONDI_FIRMA_SEOS
CREATE TABLE FONDI_FIRMA_SEOS (
    fondi_firma_seos_ID int  NOT NULL,
    fondi_firma_seos_alates date  NOT NULL,
    fondi_firma_seos_kuni date  NULL,
    fondi_firma_seos_kommentaar text  NULL,
    FOND_fond_ID int  NOT NULL,
    FONDI_FIRMA_SEOSE_LIIK_fondi_firma_seose_liik_ID int  NOT NULL,
    FIRMA_firma_ID int  NOT NULL,
    CONSTRAINT FONDI_FIRMA_SEOS_pk PRIMARY KEY (fondi_firma_seos_ID)
);

-- Table: FONDI_FIRMA_SEOSE_LIIK
CREATE TABLE FONDI_FIRMA_SEOSE_LIIK (
    fondi_firma_seose_liik_ID int  NOT NULL,
    fondi_firma_seose_liik_alates date  NOT NULL,
    fondi_firma_seose_liik_kuni date  NULL,
    fondi_firma_seose_liik_nimi varchar(55)  NOT NULL,
    fondi_firma_seose_liik_kommentaar text  NULL,
    CONSTRAINT FONDI_FIRMA_SEOSE_LIIK_pk PRIMARY KEY (fondi_firma_seose_liik_ID)
);

-- Table: FONDI_KULUD
CREATE TABLE FONDI_KULUD (
    fondi_kulud_ID int  NOT NULL,
    fondi_kulud_summa decimal(14,2)  NOT NULL,
    fondi_kulud_alates date  NOT NULL,
    fondi_kulu_kuni date  NOT NULL,
    fondi_kulud_kommentaar text  NULL,
    FONDI_KULUD_LIIK_fondi_kulud_liik int  NOT NULL,
    TOOREIS_tooreis_ID int  NOT NULL,
    FOND_fond_ID int  NOT NULL,
    CONSTRAINT FONDI_KULUD_pk PRIMARY KEY (fondi_kulud_ID)
);

-- Table: FONDI_KULUD_LIIK
CREATE TABLE FONDI_KULUD_LIIK (
    fondi_kulud_liik_ID int  NOT NULL,
    fondi_kulud_liik_nimi varchar(60)  NOT NULL,
    fondi_kulud_liik_kommentaar text  NULL,
    CONSTRAINT FONDI_KULUD_LIIK_pk PRIMARY KEY (fondi_kulud_liik_ID)
);

-- Table: FONDI_OMAMINE
CREATE TABLE FONDI_OMAMINE (
    fondi_omamine_ID int  NOT NULL,
    fondi_omamine_alates date  NOT NULL,
    fondi_omamine_kuni date  NULL,
    fondi_omamine_kommentar text  NULL,
    FONDI_OMANIK_fondi_omanik_ID int  NOT NULL,
    FOND_fond_ID int  NOT NULL,
    CONSTRAINT FONDI_OMAMINE_pk PRIMARY KEY (fondi_omamine_ID)
);

-- Table: FONDI_OMANIK
CREATE TABLE FONDI_OMANIK (
    fondi_omanik_ID int  NOT NULL,
    fondi_omanik_alates date  NOT NULL,
    fondi_omanik_kuni date  NULL,
    fondi_omanik_kommentaar text  NULL,
    fondi_omanik_omaluse_protsent decimal(4,2)  NOT NULL,
    ISIK_isik_ID int  NOT NULL,
    CONSTRAINT FONDI_OMANIK_pk PRIMARY KEY (fondi_omanik_ID)
);

-- Table: FONDI_PORFELL
CREATE TABLE FONDI_PORFELL (
    fondi_portfell_ID int  NOT NULL,
    fondi_portfell_alates date  NOT NULL,
    fondi_portfell_kuni date  NULL,
    fondi_portfell_kommentaar text  NULL,
    PORTFELL_portfell_ID int  NOT NULL,
    FOND_fond_ID int  NOT NULL,
    CONSTRAINT FONDI_PORFELL_pk PRIMARY KEY (fondi_portfell_ID)
);

-- Table: FONDI_TULUD
CREATE TABLE FONDI_TULUD (
    fondi_tulud_ID int  NOT NULL,
    fondi_tulud_kuupaev date  NOT NULL,
    fondi_tulud_summa decimal(12,2)  NOT NULL,
    fondi_tulud_kommentaar text  NULL,
    FONDI_TULUD_LIIK_fondi_tulud_liik_ID int  NOT NULL,
    PORTFELL_portfell_ID int  NOT NULL,
    FONDI_KULUD_fondi_kulud_ID int  NOT NULL,
    CONSTRAINT FONDI_TULUD_pk PRIMARY KEY (fondi_tulud_ID)
);

-- Table: FONDI_TULUD_LIIK
CREATE TABLE FONDI_TULUD_LIIK (
    fondi_tulud_liik_ID int  NOT NULL,
    fondi_tulud_liik_nimi varchar(60)  NOT NULL,
    fondi_tulud_liik_kommentaar text  NULL,
    CONSTRAINT FONDI_TULUD_LIIK_pk PRIMARY KEY (fondi_tulud_liik_ID)
);

-- Table: FONDI_TULUD_MAKSUD
CREATE TABLE FONDI_TULUD_MAKSUD (
    fondi_tulud_maksud_ID int  NOT NULL,
    fondi_tulud_maksud_summa decimal(12,2)  NULL,
    fondi_tulud_maksud_kuupaev date  NULL,
    fondi_tulud_maksud_kommentaar text  NULL,
    fondi_tulud_maksud_protsent decimal(4,2)  NULL,
    MAKSUD_maksud_ID int  NOT NULL,
    FONDI_TULUD_fondi_tulud_ID int  NOT NULL,
    CONSTRAINT FONDI_TULUD_MAKSUD_pk PRIMARY KEY (fondi_tulud_maksud_ID)
);

-- Table: FOND_OFFSHORE_ESINDAJA
CREATE TABLE FOND_OFFSHORE_ESINDAJA (
    fond_offshore_esindaja_ID int  NOT NULL,
    fond_offshore_esindaja_alates date  NOT NULL,
    fond_offshore_esindaja_kuni date  NULL,
    fond_offshore_esindaja_kommentaar text  NULL,
    FOND_fond_ID int  NOT NULL,
    OFFSHORE_ESINDAJA_offshore_esindaja_ID int  NOT NULL,
    CONSTRAINT FOND_OFFSHORE_ESINDAJA_pk PRIMARY KEY (fond_offshore_esindaja_ID)
);

-- Table: FOND_PANGAS
CREATE TABLE FOND_PANGAS (
    fond_pangas_ID int  NOT NULL,
    fond_pangas_alates date  NOT NULL,
    fond_pangas_kuni date  NULL,
    fond_pangas_kommentaar text  NULL,
    FOND_fond_ID int  NOT NULL,
    PANK_pank_ID int  NOT NULL,
    CONSTRAINT FOND_PANGAS_pk PRIMARY KEY (fond_pangas_ID)
);

-- Table: INVESTEERING_PORTFELLIS
CREATE TABLE INVESTEERING_PORTFELLIS (
    investeering_portfellis_ID int  NOT NULL,
    investeering_portfellis_summa decimal(10,2)  NOT NULL,
    investeering_portfellis_alates date  NOT NULL,
    investeering_portfellis_kuni date  NULL,
    investeering_portfellis_iintress decimal(5,2)  NULL,
    investeering_portfellis_tootlus decimal(5,2)  NULL,
    investeering_portfellis_kommentaar text  NULL,
    PORTFELL_portfell_ID int  NOT NULL,
    INVESTEERING_PORTFELLIS_LIIK_investeering_portfellis_liik_ID int  NOT NULL,
    CONSTRAINT INVESTEERING_PORTFELLIS_pk PRIMARY KEY (investeering_portfellis_ID)
);

-- Table: INVESTEERING_PORTFELLIS_LIIK
CREATE TABLE INVESTEERING_PORTFELLIS_LIIK (
    investeering_portfellis_liik_ID int  NOT NULL,
    investeering_portfellis_liik_nimi varchar(60)  NOT NULL,
    investeering_portfellis_liik_kirjeldus int  NULL,
    CONSTRAINT INVESTEERING_PORTFELLIS_LIIK_pk PRIMARY KEY (investeering_portfellis_liik_ID)
);

-- Table: ISIK
CREATE TABLE ISIK (
    isik_ID int  NOT NULL,
    isik_nimi varchar(35)  NOT NULL,
    isik_isikukood varchar(16)  NOT NULL,
    isik_alates date NOT NULL,
    isik_kuni date NULL,
    CONSTRAINT ISIK_pk PRIMARY KEY (isik_ID)
);

-- Table: KONTOR
CREATE TABLE KONTOR (
    kontor_ID int  NOT NULL,
    kontor_nimi varchar(60)  NOT NULL,
    kontor_alates date  NOT NULL,
    kontor_kuni date  NULL,
    kontor_kommentaar text  NULL,
    CONSTRAINT KONTOR_pk PRIMARY KEY (kontor_ID)
);

-- Table: KONTOR_FIRMAS
CREATE TABLE KONTOR_FIRMAS (
    kontor_firmas_ID int  NOT NULL,
    kontor_firmas_alates date  NOT NULL,
    kontor_firmas_kuni date  NULL,
    kontor_firmas_kommentaar text  NULL,
    KONTOR_kontor_ID int  NOT NULL,
    FIRMA_firma_ID int  NOT NULL,
    CONSTRAINT KONTOR_FIRMAS_pk PRIMARY KEY (kontor_firmas_ID)
);

-- Table: LEPING
CREATE TABLE LEPING (
    leping_ID int  NOT NULL,
    leping_alates date  NOT NULL,
    leping_kuni date  NULL,
    leping_aktiivne bool  NOT NULL,
    leping_kaugtoo_voimalus bool  NOT NULL,
    FOND_fond_ID int  NULL,
    FIRMA_firma_ID int  NULL,
    ISIK_isik_ID int  NULL,
    LEPING_LIIK_leping_liik_ID int  NOT NULL,
    CONSTRAINT LEPING_pk PRIMARY KEY (leping_ID)
);

-- Table: LEPING_LIIK
CREATE TABLE LEPING_LIIK (
    leping_liik_ID int  NOT NULL,
    leping_liik_tyyp varchar(55)  NOT NULL,
    leping_liik_alates date  NOT NULL,
    leping_liik_kuni date  NULL,
    leping_liik_kommentaar text  NULL,
    CONSTRAINT LEPING_LIIK_pk PRIMARY KEY (leping_liik_ID)
);

-- Table: MAKSUD
CREATE TABLE MAKSUD (
    maksud_ID int  NOT NULL,
    maksud_protsent decimal(4,2)  NOT NULL,
    maksud_alates date  NOT NULL,
    maksud_kuni date  NOT NULL,
    maksud_kommentaar text  NULL,
    MAKSUDE_LIIK_maksude_liik_ID int  NOT NULL,
    RIIK_riik_ID int  NOT NULL,
    CONSTRAINT MAKSUD_pk PRIMARY KEY (maksud_ID)
);

-- Table: MAKSUDE_LIIK
CREATE TABLE MAKSUDE_LIIK (
    maksude_liik_ID int  NOT NULL,
    maksude_liik_nimi varchar(60)  NOT NULL,
    maksude_liik_kirjeldus text  NOT NULL,
    CONSTRAINT MAKSUDE_LIIK_pk PRIMARY KEY (maksude_liik_ID)
);

-- Table: OBLIGATSIOONI_LISA
CREATE TABLE OBLIGATSIOONI_LISA (
    obligatsiooni_lisa_ID int  NOT NULL,
    obligatsiooni_lisa_alates date  NOT NULL,
    obligatsiooni_lisa_kuni date  NOT NULL,
    obligatsiooni_lisa_kupongi_intress decimal(5,2)  NOT NULL,
    obligatsiooni_lisa_kupongi_period varchar(20)  NOT NULL,
    obligatsiooni_lisa_pohiosa decimal(10,2)  NOT NULL,
    obligatsiooni_lisa_kommentaar text  NULL,
    INVESTEERING_PORTFELLIS_investeering_portfellis_ID int  NOT NULL,
    RIIK_riik_ID int  NOT NULL,
    CONSTRAINT OBLIGATSIOONI_LISA_pk PRIMARY KEY (obligatsiooni_lisa_ID)
);

-- Table: OFFSHORE_ALA
CREATE TABLE OFFSHORE_ALA (
    offshore_ala_ID int  NOT NULL,
    offshore_ala_nimi varchar(70)  NOT NULL,
    offshore_ala_kommentaar text  NULL,
    RIIK_riik_ID int  NOT NULL,
    CONSTRAINT OFFSHORE_ALA_pk PRIMARY KEY (offshore_ala_ID)
);

-- Table: OFFSHORE_ESINDAJA
CREATE TABLE OFFSHORE_ESINDAJA (
    offshore_esindaja_ID int  NOT NULL,
    offshore_esindaja_alate date  NOT NULL,
    offshore_esindaja_kuni date  NULL,
    offshore_esindaja_tasu decimal(8,2)  NOT NULL,
    offshore_esindaja_kommentaar text  NULL,
    OFFSHORE_ALA_offshore_ala_ID int  NOT NULL,
    ISIK_isik_ID int  NULL,
    FIRMA_firma_ID int  NULL,
    CONSTRAINT OFFSHORE_ESINDAJA_pk PRIMARY KEY (offshore_esindaja_ID)
);

-- Table: PANK
CREATE TABLE PANK (
    pank_ID int  NOT NULL,
    pank_nimi varchar(35)  NOT NULL,
    pank_alates date  NOT NULL,
    pank_kuni date  NULL,
    pank_kommentaar text  NULL,
    CONSTRAINT PANK_pk PRIMARY KEY (pank_ID)
);

-- Table: PORTFELL
CREATE TABLE PORTFELL (
    portfell_ID int  NOT NULL,
    portfell_nimi varchar(60)  NOT NULL,
    portfell_vaartus decimal(10,2)  NOT NULL,
    portfell_alates date  NOT NULL,
    portfell_kuni date  NULL,
    portfell_kommentaar text  NULL,
    PORTFELLI_LIIK_portfelli_liik_ID int  NOT NULL,
    CONSTRAINT PORTFELL_pk PRIMARY KEY (portfell_ID)
);

-- Table: PORTFELLI_LIIK
CREATE TABLE PORTFELLI_LIIK (
    portfelli_liik_ID int  NOT NULL,
    portfelli_liik_nimi varchar(60)  NOT NULL,
    portfelli_liik_kommentaar text  NULL,
    CONSTRAINT PORTFELLI_LIIK_pk PRIMARY KEY (portfelli_liik_ID)
);

-- Table: RIIK
CREATE TABLE RIIK (
    riik_ID int  NOT NULL,
    riik_nimi varchar(35)  NOT NULL,
    riik_iso_kood varchar(15)  NOT NULL,
    riik_alates date  NOT NULL,
    riik_kuni date  NULL,
    riik_kommentaar text  NULL,
    CONSTRAINT RIIK_pk PRIMARY KEY (riik_ID)
);

-- Table: SEOS_RIIGIGA
CREATE TABLE SEOS_RIIGIGA (
    seos_riigiga_ID int  NOT NULL,
    seos_riigiga_alates date  NOT NULL,
    seos_riigiga_kuni date  NULL,
    seos_riigiga_kommentaar text  NULL,
    RIIK_riik_ID int  NOT NULL,
    SEOS_RIIGIGA_LIIK_seos_riigiga_liik_ID int  NOT NULL,
    FOND_fond_ID int  NULL,
    ISIK_isik_ID int  NULL,
    FIRMA_firma_ID int  NULL,
    KONTOR_kontor_ID int  NULL,
    PANK_pank_ID int  NOT NULL,
    CONSTRAINT SEOS_RIIGIGA_pk PRIMARY KEY (seos_riigiga_ID)
);

-- Table: SEOS_RIIGIGA_LIIK
CREATE TABLE SEOS_RIIGIGA_LIIK (
    seos_riigiga_liik_ID int  NOT NULL,
    seos_riigiga_liik_nimi varchar(35)  NOT NULL,
    seos_riigiga_liik_kommentaar text  NULL,
    CONSTRAINT SEOS_RIIGIGA_LIIK_pk PRIMARY KEY (seos_riigiga_liik_ID)
);

-- Table: TEENUS
CREATE TABLE TEENUS (
    teenus_ID int  NOT NULL,
    teenus_nimi varchar(60)  NOT NULL,
    teenus_hind decimal(12,2)  NOT NULL,
    teenus_alates date  NOT NULL,
    teenus_kuni date  NULL,
    teenus_kommentaar text  NULL,
    TEENUSE_LIIK_teenuse_liik_ID int  NOT NULL,
    CONSTRAINT TEENUS_pk PRIMARY KEY (teenus_ID)
);

-- Table: TEENUSE_LIIK
CREATE TABLE TEENUSE_LIIK (
    teenuse_liik_ID int  NOT NULL,
    teenuse_liik_nimi varchar(60)  NOT NULL,
    teenuse_liik_kommentaar text  NOT NULL,
    CONSTRAINT TEENUSE_LIIK_pk PRIMARY KEY (teenuse_liik_ID)
);

-- Table: TEENUS_LEPINGUS
CREATE TABLE TEENUS_LEPINGUS (
    teenue_lepingus_ID int  NOT NULL,
    teenus_lepingus_alates date  NOT NULL,
    teenus_lepingus_kuni date  NULL,
    teenus_lepingus_status varchar(50)  NOT NULL,
    LEPING_leping_ID int  NOT NULL,
    TEENUS_teenus_ID int  NULL,
    CONSTRAINT TEENUS_LEPINGUS_pk PRIMARY KEY (teenue_lepingus_ID)
);

-- Table: TOOREIS
CREATE TABLE TOOREIS (
    tooreis_ID int  NOT NULL,
    tooreis_alates date  NOT NULL,
    tooreis_kuni date  NOT NULL,
    tooreis_eesmark varchar(60)  NOT NULL,
    tooreis_kommentaar text  NULL,
    TOOREIS_LIIK_tooreis_liik_ID int  NOT NULL,
    CONSTRAINT TOOREIS_pk PRIMARY KEY (tooreis_ID)
);

-- Table: TOOREIS_KOHT
CREATE TABLE TOOREIS_KOHT (
    tooreis_koht_ID int  NOT NULL,
    tooreis_koht_sihtkoht varchar(60)  NOT NULL,
    tooreis_koht_alates date  NOT NULL,
    tooreis_koht_kuni date  NOT NULL,
    TOOREIS_tooreis_ID int  NOT NULL,
    CONSTRAINT TOOREIS_KOHT_pk PRIMARY KEY (tooreis_koht_ID)
);

-- Table: TOOREIS_LIIK
CREATE TABLE TOOREIS_LIIK (
    tooreis_liik_ID int  NOT NULL,
    tooreis_liik_nimi varchar(60)  NOT NULL,
    tooreis_liik_kommentaar text  NULL,
    CONSTRAINT TOOREIS_LIIK_pk PRIMARY KEY (tooreis_liik_ID)
);

-- Table: TOOTAJA_TOOREISIS
CREATE TABLE TOOTAJA_TOOREISIS (
    tootaja_tooreisis_ID int  NOT NULL,
    tootaja_tooreisis_alates date  NOT NULL,
    tootaja_tooreisis_kuni date  NOT NULL,
    tootaja_tooreisis_kommentaar text  NULL,
    TOOREIS_tooreis_ID int  NOT NULL,
    ISIK_isik_ID int  NOT NULL,
    CONSTRAINT TOOTAJA_TOOREISIS_pk PRIMARY KEY (tootaja_tooreisis_ID)
);

-- Table: TOOTAJA_TOOREISIS_KULUD
CREATE TABLE TOOTAJA_TOOREISIS_KULUD (
    tootaja_tooreisis_kulud_ID int  NOT NULL,
    tootaja_tooreisis_kulud_summa decimal(6,2)  NOT NULL,
    tootaja_tooreisis_kulud_alates date  NOT NULL,
    tootaja_tooreisis_kulud_kuni date  NOT NULL,
    tootaja_tooreisis_kulud_kommentaar text  NULL,
    TOOTAJA_TOOREISIS_KULUD_LIIK_tootaja_tooreisis_kulud_liik_ID int  NOT NULL,
    TOOTAJA_TOOREISIS_tootaja_tooreisis_ID int  NOT NULL,
    FONDI_KULUD_fondi_kulud_ID int  NOT NULL,
    CONSTRAINT TOOTAJA_TOOREISIS_KULUD_pk PRIMARY KEY (tootaja_tooreisis_kulud_ID)
);

-- Table: TOOTAJA_TOOREISIS_KULUD_LIIK
CREATE TABLE TOOTAJA_TOOREISIS_KULUD_LIIK (
    tootaja_tooreisis_kulud_liik_ID int  NOT NULL,
    tootaja_tooreisis_kulud_liik_nimi varchar(60)  NOT NULL,
    tootaja_tooreisis_kulud_liik_kommentaar text  NULL,
    CONSTRAINT TOOTAJA_TOOREISIS_KULUD_LIIK_pk PRIMARY KEY (tootaja_tooreisis_kulud_liik_ID)
);

-- foreign keys
-- Reference: AMET_LEPINGUS_AMET (table: AMET_LEPINGUS)
ALTER TABLE AMET_LEPINGUS ADD CONSTRAINT AMET_LEPINGUS_AMET FOREIGN KEY AMET_LEPINGUS_AMET (AMET_amet_ID)
    REFERENCES AMET (amet_ID);

-- Reference: AMET_LEPINGUS_LEPING (table: AMET_LEPINGUS)
ALTER TABLE AMET_LEPINGUS ADD CONSTRAINT AMET_LEPINGUS_LEPING FOREIGN KEY AMET_LEPINGUS_LEPING (LEPING_leping_ID)
    REFERENCES LEPING (leping_ID);

-- Reference: BILANSS_FIRMA (table: BILANSS)
ALTER TABLE BILANSS ADD CONSTRAINT BILANSS_FIRMA FOREIGN KEY BILANSS_FIRMA (FIRMA_firma_ID)
    REFERENCES FIRMA (firma_ID);

-- Reference: BILANSS_FOND (table: BILANSS)
ALTER TABLE BILANSS ADD CONSTRAINT BILANSS_FOND FOREIGN KEY BILANSS_FOND (FOND_fond_ID)
    REFERENCES FOND (fond_ID);

-- Reference: FIRMA_FIRMA_LIIK (table: FIRMA)
ALTER TABLE FIRMA ADD CONSTRAINT FIRMA_FIRMA_LIIK FOREIGN KEY FIRMA_FIRMA_LIIK (FIRMA_LIIK_firma_liik_ID)
    REFERENCES FIRMA_LIIK (firma_liik_ID);

-- Reference: FONDI_FIRMA_SEOS_FIRMA (table: FONDI_FIRMA_SEOS)
ALTER TABLE FONDI_FIRMA_SEOS ADD CONSTRAINT FONDI_FIRMA_SEOS_FIRMA FOREIGN KEY FONDI_FIRMA_SEOS_FIRMA (FIRMA_firma_ID)
    REFERENCES FIRMA (firma_ID);

-- Reference: FONDI_FIRMA_SEOS_FOND (table: FONDI_FIRMA_SEOS)
ALTER TABLE FONDI_FIRMA_SEOS ADD CONSTRAINT FONDI_FIRMA_SEOS_FOND FOREIGN KEY FONDI_FIRMA_SEOS_FOND (FOND_fond_ID)
    REFERENCES FOND (fond_ID);

-- Reference: FONDI_FIRMA_SEOS_FONDI_FIRMA_SEOSE_LIIK (table: FONDI_FIRMA_SEOS)
ALTER TABLE FONDI_FIRMA_SEOS ADD CONSTRAINT FONDI_FIRMA_SEOS_FONDI_FIRMA_SEOSE_LIIK FOREIGN KEY FONDI_FIRMA_SEOS_FONDI_FIRMA_SEOSE_LIIK (FONDI_FIRMA_SEOSE_LIIK_fondi_firma_seose_liik_ID)
    REFERENCES FONDI_FIRMA_SEOSE_LIIK (fondi_firma_seose_liik_ID);

-- Reference: FONDI_KULUD_FOND (table: FONDI_KULUD)
ALTER TABLE FONDI_KULUD ADD CONSTRAINT FONDI_KULUD_FOND FOREIGN KEY FONDI_KULUD_FOND (FOND_fond_ID)
    REFERENCES FOND (fond_ID);

-- Reference: FONDI_KULUD_FONDI_KULUD_LIIK (table: FONDI_KULUD)
ALTER TABLE FONDI_KULUD ADD CONSTRAINT FONDI_KULUD_FONDI_KULUD_LIIK FOREIGN KEY FONDI_KULUD_FONDI_KULUD_LIIK (FONDI_KULUD_LIIK_fondi_kulud_liik)
    REFERENCES FONDI_KULUD_LIIK (fondi_kulud_liik_ID);

-- Reference: FONDI_KULUD_TOOREIS (table: FONDI_KULUD)
ALTER TABLE FONDI_KULUD ADD CONSTRAINT FONDI_KULUD_TOOREIS FOREIGN KEY FONDI_KULUD_TOOREIS (TOOREIS_tooreis_ID)
    REFERENCES TOOREIS (tooreis_ID);

-- Reference: FONDI_OMAMINE_FOND (table: FONDI_OMAMINE)
ALTER TABLE FONDI_OMAMINE ADD CONSTRAINT FONDI_OMAMINE_FOND FOREIGN KEY FONDI_OMAMINE_FOND (FOND_fond_ID)
    REFERENCES FOND (fond_ID);

-- Reference: FONDI_OMAMINE_FONDI_OMANIK (table: FONDI_OMAMINE)
ALTER TABLE FONDI_OMAMINE ADD CONSTRAINT FONDI_OMAMINE_FONDI_OMANIK FOREIGN KEY FONDI_OMAMINE_FONDI_OMANIK (FONDI_OMANIK_fondi_omanik_ID)
    REFERENCES FONDI_OMANIK (fondi_omanik_ID);

-- Reference: FONDI_OMANIK_ISIK (table: FONDI_OMANIK)
ALTER TABLE FONDI_OMANIK ADD CONSTRAINT FONDI_OMANIK_ISIK FOREIGN KEY FONDI_OMANIK_ISIK (ISIK_isik_ID)
    REFERENCES ISIK (isik_ID);

-- Reference: FONDI_PORFELL_FOND (table: FONDI_PORFELL)
ALTER TABLE FONDI_PORFELL ADD CONSTRAINT FONDI_PORFELL_FOND FOREIGN KEY FONDI_PORFELL_FOND (FOND_fond_ID)
    REFERENCES FOND (fond_ID);

-- Reference: FONDI_PORFELL_PORTFELL (table: FONDI_PORFELL)
ALTER TABLE FONDI_PORFELL ADD CONSTRAINT FONDI_PORFELL_PORTFELL FOREIGN KEY FONDI_PORFELL_PORTFELL (PORTFELL_portfell_ID)
    REFERENCES PORTFELL (portfell_ID);

-- Reference: FONDI_TULUD_FONDI_KULUD (table: FONDI_TULUD)
ALTER TABLE FONDI_TULUD ADD CONSTRAINT FONDI_TULUD_FONDI_KULUD FOREIGN KEY FONDI_TULUD_FONDI_KULUD (FONDI_KULUD_fondi_kulud_ID)
    REFERENCES FONDI_KULUD (fondi_kulud_ID);

-- Reference: FONDI_TULUD_FONDI_TULUD_LIIK (table: FONDI_TULUD)
ALTER TABLE FONDI_TULUD ADD CONSTRAINT FONDI_TULUD_FONDI_TULUD_LIIK FOREIGN KEY FONDI_TULUD_FONDI_TULUD_LIIK (FONDI_TULUD_LIIK_fondi_tulud_liik_ID)
    REFERENCES FONDI_TULUD_LIIK (fondi_tulud_liik_ID);

-- Reference: FONDI_TULUD_MAKSUD_FONDI_TULUD (table: FONDI_TULUD_MAKSUD)
ALTER TABLE FONDI_TULUD_MAKSUD ADD CONSTRAINT FONDI_TULUD_MAKSUD_FONDI_TULUD FOREIGN KEY FONDI_TULUD_MAKSUD_FONDI_TULUD (FONDI_TULUD_fondi_tulud_ID)
    REFERENCES FONDI_TULUD (fondi_tulud_ID);

-- Reference: FONDI_TULUD_MAKSUD_MAKSUD (table: FONDI_TULUD_MAKSUD)
ALTER TABLE FONDI_TULUD_MAKSUD ADD CONSTRAINT FONDI_TULUD_MAKSUD_MAKSUD FOREIGN KEY FONDI_TULUD_MAKSUD_MAKSUD (MAKSUD_maksud_ID)
    REFERENCES MAKSUD (maksud_ID);

-- Reference: FONDI_TULUD_PORTFELL (table: FONDI_TULUD)
ALTER TABLE FONDI_TULUD ADD CONSTRAINT FONDI_TULUD_PORTFELL FOREIGN KEY FONDI_TULUD_PORTFELL (PORTFELL_portfell_ID)
    REFERENCES PORTFELL (portfell_ID);

-- Reference: FOND_OFFSHORE_ESINDAJA_FOND (table: FOND_OFFSHORE_ESINDAJA)
ALTER TABLE FOND_OFFSHORE_ESINDAJA ADD CONSTRAINT FOND_OFFSHORE_ESINDAJA_FOND FOREIGN KEY FOND_OFFSHORE_ESINDAJA_FOND (FOND_fond_ID)
    REFERENCES FOND (fond_ID);

-- Reference: FOND_OFFSHORE_ESINDAJA_OFFSHORE_ESINDAJA (table: FOND_OFFSHORE_ESINDAJA)
ALTER TABLE FOND_OFFSHORE_ESINDAJA ADD CONSTRAINT FOND_OFFSHORE_ESINDAJA_OFFSHORE_ESINDAJA FOREIGN KEY FOND_OFFSHORE_ESINDAJA_OFFSHORE_ESINDAJA (OFFSHORE_ESINDAJA_offshore_esindaja_ID)
    REFERENCES OFFSHORE_ESINDAJA (offshore_esindaja_ID);

-- Reference: FOND_PANGAS_FOND (table: FOND_PANGAS)
ALTER TABLE FOND_PANGAS ADD CONSTRAINT FOND_PANGAS_FOND FOREIGN KEY FOND_PANGAS_FOND (FOND_fond_ID)
    REFERENCES FOND (fond_ID);

-- Reference: FOND_PANGAS_PANK (table: FOND_PANGAS)
ALTER TABLE FOND_PANGAS ADD CONSTRAINT FOND_PANGAS_PANK FOREIGN KEY FOND_PANGAS_PANK (PANK_pank_ID)
    REFERENCES PANK (pank_ID);

-- Reference: INVESTEERING_PORTFELLIS_INVESTEERING_PORTFELLIS_LIIK (table: INVESTEERING_PORTFELLIS)
ALTER TABLE INVESTEERING_PORTFELLIS ADD CONSTRAINT INVESTEERING_PORTFELLIS_INVESTEERING_PORTFELLIS_LIIK FOREIGN KEY INVESTEERING_PORTFELLIS_INVESTEERING_PORTFELLIS_LIIK (INVESTEERING_PORTFELLIS_LIIK_investeering_portfellis_liik_ID)
    REFERENCES INVESTEERING_PORTFELLIS_LIIK (investeering_portfellis_liik_ID);

-- Reference: INVESTEERING_PORTFELLIS_PORTFELL (table: INVESTEERING_PORTFELLIS)
ALTER TABLE INVESTEERING_PORTFELLIS ADD CONSTRAINT INVESTEERING_PORTFELLIS_PORTFELL FOREIGN KEY INVESTEERING_PORTFELLIS_PORTFELL (PORTFELL_portfell_ID)
    REFERENCES PORTFELL (portfell_ID);

-- Reference: KONTOR_FIRMAS_FIRMA (table: KONTOR_FIRMAS)
ALTER TABLE KONTOR_FIRMAS ADD CONSTRAINT KONTOR_FIRMAS_FIRMA FOREIGN KEY KONTOR_FIRMAS_FIRMA (FIRMA_firma_ID)
    REFERENCES FIRMA (firma_ID);

-- Reference: KONTOR_FIRMAS_KONTOR (table: KONTOR_FIRMAS)
ALTER TABLE KONTOR_FIRMAS ADD CONSTRAINT KONTOR_FIRMAS_KONTOR FOREIGN KEY KONTOR_FIRMAS_KONTOR (KONTOR_kontor_ID)
    REFERENCES KONTOR (kontor_ID);

-- Reference: LEPING_FIRMA (table: LEPING)
ALTER TABLE LEPING ADD CONSTRAINT LEPING_FIRMA FOREIGN KEY LEPING_FIRMA (FIRMA_firma_ID)
    REFERENCES FIRMA (firma_ID);

-- Reference: LEPING_FOND (table: LEPING)
ALTER TABLE LEPING ADD CONSTRAINT LEPING_FOND FOREIGN KEY LEPING_FOND (FOND_fond_ID)
    REFERENCES FOND (fond_ID);

-- Reference: LEPING_ISIK (table: LEPING)
ALTER TABLE LEPING ADD CONSTRAINT LEPING_ISIK FOREIGN KEY LEPING_ISIK (ISIK_isik_ID)
    REFERENCES ISIK (isik_ID);

-- Reference: LEPING_LEPING_LIIK (table: LEPING)
ALTER TABLE LEPING ADD CONSTRAINT LEPING_LEPING_LIIK FOREIGN KEY LEPING_LEPING_LIIK (LEPING_LIIK_leping_liik_ID)
    REFERENCES LEPING_LIIK (leping_liik_ID);

-- Reference: MAKSUD_MAKSUDE_LIIK (table: MAKSUD)
ALTER TABLE MAKSUD ADD CONSTRAINT MAKSUD_MAKSUDE_LIIK FOREIGN KEY MAKSUD_MAKSUDE_LIIK (MAKSUDE_LIIK_maksude_liik_ID)
    REFERENCES MAKSUDE_LIIK (maksude_liik_ID);

-- Reference: MAKSUD_RIIK (table: MAKSUD)
ALTER TABLE MAKSUD ADD CONSTRAINT MAKSUD_RIIK FOREIGN KEY MAKSUD_RIIK (RIIK_riik_ID)
    REFERENCES RIIK (riik_ID);

-- Reference: OBLIGATSIOONI_LISA_INVESTEERING_PORTFELLIS (table: OBLIGATSIOONI_LISA)
ALTER TABLE OBLIGATSIOONI_LISA ADD CONSTRAINT OBLIGATSIOONI_LISA_INVESTEERING_PORTFELLIS FOREIGN KEY OBLIGATSIOONI_LISA_INVESTEERING_PORTFELLIS (INVESTEERING_PORTFELLIS_investeering_portfellis_ID)
    REFERENCES INVESTEERING_PORTFELLIS (investeering_portfellis_ID);

-- Reference: OBLIGATSIOONI_LISA_RIIK (table: OBLIGATSIOONI_LISA)
ALTER TABLE OBLIGATSIOONI_LISA ADD CONSTRAINT OBLIGATSIOONI_LISA_RIIK FOREIGN KEY OBLIGATSIOONI_LISA_RIIK (RIIK_riik_ID)
    REFERENCES RIIK (riik_ID);

-- Reference: OFFSHORE_ALA_RIIK (table: OFFSHORE_ALA)
ALTER TABLE OFFSHORE_ALA ADD CONSTRAINT OFFSHORE_ALA_RIIK FOREIGN KEY OFFSHORE_ALA_RIIK (RIIK_riik_ID)
    REFERENCES RIIK (riik_ID);

-- Reference: OFFSHORE_ESINDAJA_FIRMA (table: OFFSHORE_ESINDAJA)
ALTER TABLE OFFSHORE_ESINDAJA ADD CONSTRAINT OFFSHORE_ESINDAJA_FIRMA FOREIGN KEY OFFSHORE_ESINDAJA_FIRMA (FIRMA_firma_ID)
    REFERENCES FIRMA (firma_ID);

-- Reference: OFFSHORE_ESINDAJA_ISIK (table: OFFSHORE_ESINDAJA)
ALTER TABLE OFFSHORE_ESINDAJA ADD CONSTRAINT OFFSHORE_ESINDAJA_ISIK FOREIGN KEY OFFSHORE_ESINDAJA_ISIK (ISIK_isik_ID)
    REFERENCES ISIK (isik_ID);

-- Reference: OFFSHORE_ESINDAJA_OFFSHORE_ALA (table: OFFSHORE_ESINDAJA)
ALTER TABLE OFFSHORE_ESINDAJA ADD CONSTRAINT OFFSHORE_ESINDAJA_OFFSHORE_ALA FOREIGN KEY OFFSHORE_ESINDAJA_OFFSHORE_ALA (OFFSHORE_ALA_offshore_ala_ID)
    REFERENCES OFFSHORE_ALA (offshore_ala_ID);

-- Reference: PORTFELL_PORTFELLI_LIIK (table: PORTFELL)
ALTER TABLE PORTFELL ADD CONSTRAINT PORTFELL_PORTFELLI_LIIK FOREIGN KEY PORTFELL_PORTFELLI_LIIK (PORTFELLI_LIIK_portfelli_liik_ID)
    REFERENCES PORTFELLI_LIIK (portfelli_liik_ID);

-- Reference: SEOS_RIIGIGA_FIRMA (table: SEOS_RIIGIGA)
ALTER TABLE SEOS_RIIGIGA ADD CONSTRAINT SEOS_RIIGIGA_FIRMA FOREIGN KEY SEOS_RIIGIGA_FIRMA (FIRMA_firma_ID)
    REFERENCES FIRMA (firma_ID);

-- Reference: SEOS_RIIGIGA_FOND (table: SEOS_RIIGIGA)
ALTER TABLE SEOS_RIIGIGA ADD CONSTRAINT SEOS_RIIGIGA_FOND FOREIGN KEY SEOS_RIIGIGA_FOND (FOND_fond_ID)
    REFERENCES FOND (fond_ID);

-- Reference: SEOS_RIIGIGA_ISIK (table: SEOS_RIIGIGA)
ALTER TABLE SEOS_RIIGIGA ADD CONSTRAINT SEOS_RIIGIGA_ISIK FOREIGN KEY SEOS_RIIGIGA_ISIK (ISIK_isik_ID)
    REFERENCES ISIK (isik_ID);

-- Reference: SEOS_RIIGIGA_KONTOR (table: SEOS_RIIGIGA)
ALTER TABLE SEOS_RIIGIGA ADD CONSTRAINT SEOS_RIIGIGA_KONTOR FOREIGN KEY SEOS_RIIGIGA_KONTOR (KONTOR_kontor_ID)
    REFERENCES KONTOR (kontor_ID);

-- Reference: SEOS_RIIGIGA_PANK (table: SEOS_RIIGIGA)
ALTER TABLE SEOS_RIIGIGA ADD CONSTRAINT SEOS_RIIGIGA_PANK FOREIGN KEY SEOS_RIIGIGA_PANK (PANK_pank_ID)
    REFERENCES PANK (pank_ID);

-- Reference: SEOS_RIIGIGA_RIIK (table: SEOS_RIIGIGA)
ALTER TABLE SEOS_RIIGIGA ADD CONSTRAINT SEOS_RIIGIGA_RIIK FOREIGN KEY SEOS_RIIGIGA_RIIK (RIIK_riik_ID)
    REFERENCES RIIK (riik_ID);

-- Reference: SEOS_RIIGIGA_SEOS_RIIGIGA_LIIK (table: SEOS_RIIGIGA)
ALTER TABLE SEOS_RIIGIGA ADD CONSTRAINT SEOS_RIIGIGA_SEOS_RIIGIGA_LIIK FOREIGN KEY SEOS_RIIGIGA_SEOS_RIIGIGA_LIIK (SEOS_RIIGIGA_LIIK_seos_riigiga_liik_ID)
    REFERENCES SEOS_RIIGIGA_LIIK (seos_riigiga_liik_ID);

-- Reference: TEENUS_LEPINGUS_LEPING (table: TEENUS_LEPINGUS)
ALTER TABLE TEENUS_LEPINGUS ADD CONSTRAINT TEENUS_LEPINGUS_LEPING FOREIGN KEY TEENUS_LEPINGUS_LEPING (LEPING_leping_ID)
    REFERENCES LEPING (leping_ID);

-- Reference: TEENUS_LEPINGUS_TEENUS (table: TEENUS_LEPINGUS)
ALTER TABLE TEENUS_LEPINGUS ADD CONSTRAINT TEENUS_LEPINGUS_TEENUS FOREIGN KEY TEENUS_LEPINGUS_TEENUS (TEENUS_teenus_ID)
    REFERENCES TEENUS (teenus_ID);

-- Reference: TEENUS_TEENUSE_LIIK (table: TEENUS)
ALTER TABLE TEENUS ADD CONSTRAINT TEENUS_TEENUSE_LIIK FOREIGN KEY TEENUS_TEENUSE_LIIK (TEENUSE_LIIK_teenuse_liik_ID)
    REFERENCES TEENUSE_LIIK (teenuse_liik_ID);

-- Reference: TOOREIS_KOHT_TOOREIS (table: TOOREIS_KOHT)
ALTER TABLE TOOREIS_KOHT ADD CONSTRAINT TOOREIS_KOHT_TOOREIS FOREIGN KEY TOOREIS_KOHT_TOOREIS (TOOREIS_tooreis_ID)
    REFERENCES TOOREIS (tooreis_ID);

-- Reference: TOOREIS_TOOREIS_LIIK (table: TOOREIS)
ALTER TABLE TOOREIS ADD CONSTRAINT TOOREIS_TOOREIS_LIIK FOREIGN KEY TOOREIS_TOOREIS_LIIK (TOOREIS_LIIK_tooreis_liik_ID)
    REFERENCES TOOREIS_LIIK (tooreis_liik_ID);

-- Reference: TOOTAJA_TOOREISIS_ISIK (table: TOOTAJA_TOOREISIS)
ALTER TABLE TOOTAJA_TOOREISIS ADD CONSTRAINT TOOTAJA_TOOREISIS_ISIK FOREIGN KEY TOOTAJA_TOOREISIS_ISIK (ISIK_isik_ID)
    REFERENCES ISIK (isik_ID);

-- Reference: TOOTAJA_TOOREISIS_KULUD_FONDI_KULUD (table: TOOTAJA_TOOREISIS_KULUD)
ALTER TABLE TOOTAJA_TOOREISIS_KULUD ADD CONSTRAINT TOOTAJA_TOOREISIS_KULUD_FONDI_KULUD FOREIGN KEY TOOTAJA_TOOREISIS_KULUD_FONDI_KULUD (FONDI_KULUD_fondi_kulud_ID)
    REFERENCES FONDI_KULUD (fondi_kulud_ID);

-- Reference: TOOTAJA_TOOREISIS_KULUD_TOOTAJA_TOOREISIS (table: TOOTAJA_TOOREISIS_KULUD)
ALTER TABLE TOOTAJA_TOOREISIS_KULUD ADD CONSTRAINT TOOTAJA_TOOREISIS_KULUD_TOOTAJA_TOOREISIS FOREIGN KEY TOOTAJA_TOOREISIS_KULUD_TOOTAJA_TOOREISIS (TOOTAJA_TOOREISIS_tootaja_tooreisis_ID)
    REFERENCES TOOTAJA_TOOREISIS (tootaja_tooreisis_ID);

-- Reference: TOOTAJA_TOOREISIS_KULUD_TOOTAJA_TOOREISIS_KULUD_LIIK (table: TOOTAJA_TOOREISIS_KULUD)
ALTER TABLE TOOTAJA_TOOREISIS_KULUD ADD CONSTRAINT TOOTAJA_TOOREISIS_KULUD_TOOTAJA_TOOREISIS_KULUD_LIIK FOREIGN KEY TOOTAJA_TOOREISIS_KULUD_TOOTAJA_TOOREISIS_KULUD_LIIK (TOOTAJA_TOOREISIS_KULUD_LIIK_tootaja_tooreisis_kulud_liik_ID)
    REFERENCES TOOTAJA_TOOREISIS_KULUD_LIIK (tootaja_tooreisis_kulud_liik_ID);

-- Reference: TOOTAJA_TOOREISIS_TOOREIS (table: TOOTAJA_TOOREISIS)
ALTER TABLE TOOTAJA_TOOREISIS ADD CONSTRAINT TOOTAJA_TOOREISIS_TOOREIS FOREIGN KEY TOOTAJA_TOOREISIS_TOOREIS (TOOREIS_tooreis_ID)
    REFERENCES TOOREIS (tooreis_ID);
    