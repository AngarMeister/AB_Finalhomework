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
    
INSERT INTO AMET VALUES
(1, 'Raamatupidaja', '2020-01-01', NULL, 1500.00, 'Näidis kommentaar'),
(2, 'Analüütik', '2020-01-01', NULL, 2000.00, 'Näidis kommentaar'),
(3, 'Projektijuht', '2020-01-01', NULL, 2500.00, 'Näidis kommentaar');
COMMIT;

INSERT INTO FIRMA_LIIK VALUES
(1, 'FINANTS', '2020-01-01', NULL, 'Näidis kommentaar'),
(2, 'LAW', '2020-01-01', NULL, 'Näidis kommentaar'),
(3, 'DOCUEMTNS', '2020-01-01', NULL, 'Näidis kommentaar');
COMMIT;

INSERT INTO RIIK VALUES
(1, 'Eesti', 'EE', '2020-01-01', NULL, 'Näidis kommentaar'),
(2, 'Soome', 'FI', '2021-01-01', NULL, 'Näidis kommentaar'),
(3, 'Läti', 'LV', '2022-01-01', NULL, 'Näidis kommentaar');
COMMIT;

INSERT INTO TEENUSE_LIIK VALUES
(1, 'IT-teenus', 'Näidis kommentaar'),
(2, 'Raamatupidamis-teenus', 'Näidis kommentaar'),
(3, 'Õigusabi-teenus', 'Näidis kommentaar');
COMMIT;

INSERT INTO PORTFELLI_LIIK VALUES
(1, 'Aktsiaportfell', 'Näidis kommentaar'),
(2, 'Võlakirjaportfell', 'Näidis kommentaar'),
(3, 'Segaportfell', 'Näidis kommentaar');
COMMIT;

INSERT INTO MAKSUDE_LIIK VALUES
(1, 'Tulumaks', 'Näidis komm.'),
(2, 'Sotsiaalmaks', 'Näidis komm.'),
(3, 'Käibemaks', 'Näidis komm.');
COMMIT;

INSERT INTO TOOREIS_LIIK VALUES
(1, 'Konverents', 'Näidis kommentaar'),
(2, 'Koolitus', 'Näidis kommentaar'),
(3, 'Koosolek', 'Näidis kommentaar');
COMMIT;

INSERT INTO TOOTAJA_TOOREISIS_KULUD_LIIK VALUES
(1, 'Transport', 'Näidis komm.'),
(2, 'Majutus', 'Näidis komm.'),
(3, 'Lõuna', 'Näidis komm.');
COMMIT;

INSERT INTO ISIK VALUES
(1, 'Mati', '39001010000', '1965-01-01', NULL),
(2, 'Kati', '49001010000', '2000-01-01', NULL),
(3, 'Juhan', '38001010000', '1970-01-01', NULL);
COMMIT;

INSERT INTO OFFSHORE_ALA VALUES
(1, 'Cayman Islands', 'Näidis offshore-kommentaar', 1),
(2, 'Bahamas', 'Näidis offshore-kommentaar', 1),
(3, 'Panama', 'Näidis offshore-kommentaar', 2);
COMMIT;

INSERT INTO PANK VALUES
(1, 'Swedbank', '2020-01-01', NULL, 'Näidis kommentaar'),
(2, 'SEB', '2020-01-01', NULL, 'Näidis kommentaar'),
(3, 'Nordea', '2020-01-01', NULL, 'Näidis kommentaar');
COMMIT;

INSERT INTO LEPING_LIIK VALUES
(1, 'Tähtajaline tööleping', '2020-01-01', NULL, 'Näidis kommentaar'),
(2, 'Määramata tööleping', '2021-01-01', NULL, 'Näidis kommentaar'),
(3, 'Vabakutselise leping', '2022-01-01', NULL, 'Näidis kommentaar');
COMMIT;

INSERT INTO FOND VALUES
(1, 'Pensionifond A', '2020-01-01', NULL, 'Näidis kommentaar'),
(2, 'Investeerimisfond B', '2020-01-01', NULL, 'Näidis kommentaar'),
(3, 'Riskifond C', '2020-01-01', NULL, 'Näidis kommentaar');
COMMIT;

INSERT INTO FIRMA VALUES
(1, 'Firma A', '2020-01-01', NULL, '1234567', 1),
(2, 'Firma B', '2021-05-10', NULL, '2345678', 2),
(3, 'Firma C', '2022-03-15', NULL, '3456789', 3);
COMMIT;

INSERT INTO BILANSS VALUES
(1, '2020-12-31', '2020-01-01', '2020-12-31', 100000.00, 80000.00, 20000.00, 5000.00, 'Bilanss 2020', 1, 1),
(2, '2021-12-31', '2021-01-01', '2021-12-31', 120000.00, 90000.00, 30000.00, 8000.00, 'Bilanss 2021', 2, 2),
(3, '2022-12-31', '2022-01-01', '2022-12-31', 130000.00, 95000.00, 35000.00, 10000.00, 'Bilanss 2022', 3, 3);
COMMIT;

INSERT INTO LEPING VALUES
(1, '2020-06-01', NULL, TRUE, TRUE, 1, 1, 1, 1),
(2, '2021-07-01', NULL, TRUE, FALSE, 2, 2, 2, 2),
(3, '2022-08-01', NULL, FALSE, TRUE, 3, 3, 3, 3);
COMMIT;

INSERT INTO AMET_LEPINGUS VALUES
(1, '2020-06-01', NULL, 'Näidis kommentaar', 1, 1),
(2, '2021-07-01', NULL, 'Näidis kommentaar', 2, 2),
(3, '2022-08-01', NULL, 'Näidis kommentaar', 3, 3);
COMMIT;

INSERT INTO FONDI_FIRMA_SEOSE_LIIK VALUES
(1, '2020-01-01', NULL, 'Lepinguline', 'Näidis kommentaar'),
(2, '2020-01-01', NULL, 'Sponsor', 'Näidis kommentaar'),
(3, '2020-01-01', NULL, 'Partner', 'Näidis kommentaar');
COMMIT;

INSERT INTO FONDI_FIRMA_SEOS VALUES
(1, '2020-05-01', NULL, 'Koostöö algus', 1, 1, 1),
(2, '2021-06-01', NULL, 'Koostöö algus', 2, 2, 2),
(3, '2022-07-01', NULL, 'Koostöö algus', 3, 3, 3);
COMMIT;

INSERT INTO FONDI_KULUD_LIIK VALUES
(1, 'Haldustasu', 'Näidis kommentaar'),
(2, 'Reklaamikulu', 'Näidis kommentaar'),
(3, 'Teenustasu', 'Näidis kommentaar');
COMMIT;

INSERT INTO TOOREIS VALUES
(1, '2020-05-01', '2020-05-05', 'Osalemine konverentsil', 'Näidis kommentaar', 1),
(2, '2021-06-10', '2021-06-15', 'Koolitus IT-alal', 'Näidis kommentaar', 2),
(3, '2022-07-20', '2022-07-22', 'Rahvusvaheline koosolek', 'Näidis kommentaar', 3);
COMMIT;

INSERT INTO FONDI_KULUD VALUES
(1, 1000.00, '2020-05-01', '2020-05-05', 'Seotud konverentsiga', 1, 1, 1),
(2, 2000.00, '2021-06-10', '2021-06-15', 'Seotud koolitusega', 2, 2, 2),
(3, 3000.00, '2022-07-20', '2022-07-22', 'Seotud koosolekuga', 3, 3, 3);
COMMIT;

INSERT INTO FONDI_OMANIK VALUES
(1, '2020-01-01', NULL, 'Näidis kommentaar', 10.00, 1),
(2, '2020-01-01', NULL, 'Näidis kommentaar', 20.00, 2),
(3, '2020-01-01', NULL, 'Näidis kommentaar', 30.00, 3);
COMMIT;

INSERT INTO FONDI_OMAMINE VALUES
(1, '2020-01-01', NULL, 'Osalus A', 1, 1),
(2, '2020-01-01', NULL, 'Osalus B', 2, 2),
(3, '2020-01-01', NULL, 'Osalus C', 3, 3);
COMMIT;

INSERT INTO PORTFELL VALUES
(1, 'Aktsiad X', 10000.00, '2020-01-01', NULL, 'Näidis kommentaar', 1),
(2, 'Võlakirjad Y', 20000.00, '2020-01-01', NULL, 'Näidis kommentaar', 2),
(3, 'Segaportfell Z', 15000.00, '2020-01-01', NULL, 'Näidis kommentaar', 3);
COMMIT;

INSERT INTO FONDI_PORFELL VALUES
(1, '2020-01-01', NULL, 'Fond A investeerib portfelli X', 1, 1),
(2, '2020-01-01', NULL, 'Fond B investeerib portfelli Y', 2, 2),
(3, '2020-01-01', NULL, 'Fond C investeerib portfelli Z', 3, 3);
COMMIT;

INSERT INTO INVESTEERING_PORTFELLIS_LIIK VALUES
(1, 'Aktsia', NULL),
(2, 'Võlakiri', NULL),
(3, 'Fondiosak', NULL);
COMMIT;

INSERT INTO INVESTEERING_PORTFELLIS VALUES
(1, 5000.00, '2020-01-01', NULL, 2.50, 5.00, 'Aktsiainvest.', 1, 1),
(2, 8000.00, '2020-01-01', NULL, 3.00, 6.00, 'Võlakirjainvest.', 2, 2),
(3, 2000.00, '2020-01-01', NULL, 1.00, 2.00, 'Fondiosakud', 3, 3);
COMMIT;

INSERT INTO OBLIGATSIOONI_LISA VALUES
(1, '2020-02-01', '2025-02-01', 2.00, 'aastas', 5000.00, 'Näidis komm.', 2, 1),
(2, '2020-03-01', '2026-03-01', 3.50, 'kvartalis', 8000.00, 'Näidis komm.', 2, 2),
(3, '2020-04-01', '2027-04-01', 1.80, 'poolaastas', 2000.00, 'Näidis komm.', 3, 3);
COMMIT;

INSERT INTO OFFSHORE_ESINDAJA VALUES
(1, '2020-02-01', NULL, 500.00, 'Tasu esindamise eest', 1, 1, 1),
(2, '2021-03-01', NULL, 700.00, 'Tasu esindamise eest', 2, 2, 2),
(3, '2022-04-01', NULL, 1000.00, 'Tasu esindamise eest', 3, 3, 3);
COMMIT;

INSERT INTO FOND_OFFSHORE_ESINDAJA VALUES
(1, '2020-01-01', NULL, 'Näidis kommentaar 1', 1, 1),
(2, '2021-02-01', NULL, 'Näidis kommentaar 2', 2, 2),
(3, '2022-03-01', NULL, 'Näidis kommentaar 3', 3, 3);
COMMIT;

INSERT INTO FOND_PANGAS VALUES
(1, '2020-01-01', NULL, 'Näidis kommentaar 1', 1, 1),
(2, '2021-01-01', NULL, 'Näidis kommentaar 2', 2, 2),
(3, '2022-01-01', NULL, 'Näidis kommentaar 3', 3, 3);
COMMIT;

INSERT INTO FONDI_TULUD_LIIK VALUES
(1, 'Dividendid', 'Näidis komm.'),
(2, 'Intressid', 'Näidis komm.'),
(3, 'Kapitalikasum', 'Näidis komm.');
COMMIT;

INSERT INTO FONDI_TULUD VALUES
(1, '2020-06-01', 500.00, 'Saadud dividendid', 1, 1, 1),
(2, '2021-07-01', 1000.00, 'Saadud intressid', 2, 2, 2),
(3, '2022-08-01', 1500.00, 'Kapitali kasv', 3, 3, 3);
COMMIT;

INSERT INTO MAKSUD VALUES
(1, 20.00, '2020-01-01', '2020-12-31', 'Näidis komm.', 1, 1),
(2, 22.00, '2021-01-01', '2021-12-31', 'Näidis komm.', 2, 2),
(3, 18.00, '2022-01-01', '2022-12-31', 'Näidis komm.', 3, 3);
COMMIT;

INSERT INTO FONDI_TULUD_MAKSUD VALUES
(1, 100.00, '2020-06-02', 'Maks 20%', 20.00, 1, 1),
(2, 220.00, '2021-07-02', 'Maks 22%', 22.00, 2, 2),
(3, 270.00, '2022-08-02', 'Maks 18%', 18.00, 3, 3);
COMMIT;

INSERT INTO KONTOR VALUES
(1, 'Tallinn Office', '2020-01-01', NULL, 'Tallinna kontor'),
(2, 'Tartu Office', '2020-01-01', NULL, 'Tartu kontor'),
(3, 'Helsinki Office', '2020-01-01', NULL, 'Helsingi kontor');
COMMIT;

INSERT INTO KONTOR_FIRMAS VALUES
(1, '2020-01-01', NULL, 'Firma A Tallinna kontor', 1, 1),
(2, '2021-01-01', NULL, 'Firma B Tartu kontor', 2, 2),
(3, '2022-01-01', NULL, 'Firma C Helsingi kontor', 3, 3);
COMMIT;

INSERT INTO SEOS_RIIGIGA_LIIK VALUES
(1, 'Registrijärgne riik', 'Näidis komm.'),
(2, 'Maksukohustuslane', 'Näidis komm.'),
(3, 'Peamine asukoht', 'Näidis komm.');
COMMIT;

INSERT INTO SEOS_RIIGIGA VALUES
(1, '2020-01-01', NULL, 'Eesti registris', 1, 1, 1, 1, 1, 1, 1),
(2, '2021-01-01', NULL, 'Soome maksukohustus', 2, 2, 2, 2, 2, 2, 2),
(3, '2022-01-01', NULL, 'Läti asukoht', 3, 3, 3, 3, 3, 3, 3);
COMMIT;

SELECT * FROM SEOS_RIIGIGA;

INSERT INTO TEENUS VALUES
(1, 'Veebiarendus', 100.00, '2020-01-01', NULL, 'Näidis komm.', 1),
(2, 'Kuuraamatupidamine', 200.00, '2020-01-01', NULL, 'Näidis komm.', 2),
(3, 'Lepingunõustamine', 300.00, '2020-01-01', NULL, 'Näidis komm.', 3);
COMMIT;

INSERT INTO TEENUS_LEPINGUS VALUES
(1, '2020-06-01', NULL, 'aktiivne', 1, 1),
(2, '2021-07-01', NULL, 'aktiivne', 2, 2),
(3, '2022-08-01', NULL, 'lõpetatud', 3, 3);
COMMIT;

INSERT INTO TOOREIS_KOHT VALUES
(1, 'Tallinn', '2020-05-01', '2020-05-05', 1),
(2, 'Tartu', '2021-06-10', '2021-06-15', 2),
(3, 'Helsinki', '2022-07-20', '2022-07-22', 3);
COMMIT;

INSERT INTO TOOTAJA_TOOREISIS VALUES
(1, '2020-05-01', '2020-05-05', 'Näidis komm.', 1, 1),
(2, '2021-06-10', '2021-06-15', 'Näidis komm.', 2, 2),
(3, '2022-07-20', '2022-07-22', 'Näidis komm.', 3, 3);
COMMIT;

INSERT INTO TOOTAJA_TOOREISIS_KULUD VALUES
(1, 50.00, '2020-05-01', '2020-05-05', 'Transport kulud', 1, 1, 1),
(2, 100.00, '2021-06-10', '2021-06-15', 'Majutus kulud', 2, 2, 2),
(3, 80.00, '2022-07-20', '2022-07-22', 'Lõunasöögid', 3, 3, 3);
COMMIT;

-- Päring üle ühe tabeli. Päring tagastab kõik ametid, mille palk on suurem kui 2000. See aitab tuvastada kõrgema palgaga ametipositsioone. --
SELECT amet_nimi, amet_palk FROM AMET WHERE amet_palk > 2000;

-- Päring üle kahe tabeli (LEPING ja FIRMA) --
SELECT L.leping_ID, L.leping_alates, F.firma_nimi
FROM LEPING AS L JOIN FIRMA AS F ON L.FIRMA_firma_ID = F.firma_ID
WHERE L.leping_aktiivne = TRUE AND F.firma_kuni IS NULL;

-- Päring üle kolme tabeli (TOOREIS, TOOREIS_LIIK, TOOREIS_KOHT) --
SELECT T.tooreis_ID, TL.tooreis_liik_nimi, T.tooreis_alates, TK.tooreis_koht_sihtkoht
FROM TOOREIS AS T
JOIN TOOREIS_LIIK AS TL
     ON T.TOOREIS_LIIK_tooreis_liik_ID = TL.tooreis_liik_ID
JOIN TOOREIS_KOHT AS TK
     ON TK.TOOREIS_tooreis_ID = T.tooreis_ID
WHERE TL.tooreis_liik_nimi = 'Konverents';


SELECT * FROM amet;
SELECT * FROM amet_lepingus;
SELECT * FROM bilanss;
SELECT * FROM firma;
SELECT * FROM firma_liik;
SELECT * FROM fond;
SELECT * FROM fond_offshore_esindaja;
SELECT * FROM fond_pangas;
SELECT * FROM fondi_firma_seos;
SELECT * FROM fondi_firma_seose_liik;
SELECT * FROM fondi_kulud;
SELECT * FROM fondi_kulud_liik;
SELECT * FROM fondi_omamine;
SELECT * FROM fondi_omanik;
SELECT * FROM fondi_porfell;
SELECT * FROM fondi_tulud;
SELECT * FROM fondi_tulud_liik;
SELECT * FROM fondi_tulud_maksud;
SELECT * FROM investeering_portfellis;
SELECT * FROM investeering_portfellis_liik;
SELECT * FROM isik;
SELECT * FROM kontor;
SELECT * FROM kontor_firmas;
SELECT * FROM leping;
SELECT * FROM leping_liik;
SELECT * FROM maksud;
SELECT * FROM maksude_liik;
SELECT * FROM obligatsiooni_lisa;
SELECT * FROM offshore_ala;
SELECT * FROM offshore_esindaja;
SELECT * FROM pank;
SELECT * FROM portfell;
SELECT * FROM portfelli_liik;
SELECT * FROM riik;
SELECT * FROM seos_riigiga;
SELECT * FROM seos_riigiga_liik;
SELECT * FROM teenus;
SELECT * FROM teenus_lepingus;
SELECT * FROM teenuse_liik;
SELECT * FROM tooreis;
SELECT * FROM tooreis_koht;
SELECT * FROM tooreis_liik;
SELECT * FROM tootaja_tooreisis;
SELECT * FROM tootaja_tooreisis_kulud;
SELECT * FROM tootaja_tooreisis_kulud_liik;    
    