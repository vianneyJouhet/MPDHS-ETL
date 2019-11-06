INSERT INTO i2b2metadata.table_access(
	c_table_cd, c_table_name, c_protected_access, c_ontology_protection, c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_totalnum, c_basecode, c_metadataxml, c_facttablecolumn, c_dimtablename, c_columnname, c_columndatatype, c_operator, c_dimcode, c_comment, c_tooltip, c_entry_date, c_change_date, c_status_cd, valuetype_cd)
	VALUES ('mphds', 'mphds', 'N', 'N', 0, '\\mphds\\', 'MPHDS', 'N', 'FA', null, null, null, 'CONCEPT_CD', 'CONCEPT_DIMENSION', 'CONCEPT_PATH', 'T', 'LIKE', '\\mphds\\', null, null, null, null, null, null);


  -- Table: i2b2metadata.icd10_icd9

  -- DROP TABLE i2b2metadata.icd10_icd9;

  CREATE TABLE i2b2metadata.mphds
  (
      c_hlevel integer NOT NULL,
      c_fullname character varying(700) COLLATE pg_catalog."default" NOT NULL,
      c_name character varying(2000) COLLATE pg_catalog."default" NOT NULL,
      c_synonym_cd character(1) COLLATE pg_catalog."default" NOT NULL,
      c_visualattributes character(3) COLLATE pg_catalog."default" NOT NULL,
      c_totalnum integer,
      c_basecode character varying(50) COLLATE pg_catalog."default",
      c_metadataxml text COLLATE pg_catalog."default",
      c_facttablecolumn character varying(50) COLLATE pg_catalog."default" NOT NULL,
      c_tablename character varying(50) COLLATE pg_catalog."default" NOT NULL,
      c_columnname character varying(50) COLLATE pg_catalog."default" NOT NULL,
      c_columndatatype character varying(50) COLLATE pg_catalog."default" NOT NULL,
      c_operator character varying(10) COLLATE pg_catalog."default" NOT NULL,
      c_dimcode character varying(700) COLLATE pg_catalog."default" NOT NULL,
      c_comment text COLLATE pg_catalog."default",
      c_tooltip character varying(900) COLLATE pg_catalog."default",
      m_applied_path character varying(700) COLLATE pg_catalog."default" NOT NULL,
      update_date timestamp without time zone NOT NULL,
      download_date timestamp without time zone,
      import_date timestamp without time zone,
      sourcesystem_cd character varying(50) COLLATE pg_catalog."default",
      valuetype_cd character varying(50) COLLATE pg_catalog."default",
      m_exclusion_cd character varying(25) COLLATE pg_catalog."default",
      c_path character varying(700) COLLATE pg_catalog."default",
      c_symbol character varying(50) COLLATE pg_catalog."default",
      plain_code character varying(25) COLLATE pg_catalog."default"
  )
  WITH (
      OIDS = FALSE
  )
  TABLESPACE pg_default;

  ALTER TABLE i2b2metadata.mphds
      OWNER to i2b2metadata;

  -- Index: meta_appl_path_icd10_icd9_idx

  -- DROP INDEX i2b2metadata.meta_appl_path_icd10_icd9_idx;

  CREATE INDEX meta_appl_path_mphds_idx
      ON i2b2metadata.icd10_icd9 USING btree
      (m_applied_path COLLATE pg_catalog."default")
      TABLESPACE pg_default;

  -- Index: meta_exclusion_icd10_icd9_idx

  -- DROP INDEX i2b2metadata.meta_exclusion_icd10_icd9_idx;

  CREATE INDEX meta_exclusion_mphds_idx
      ON i2b2metadata.icd10_icd9 USING btree
      (m_exclusion_cd COLLATE pg_catalog."default")
      TABLESPACE pg_default;

  -- Index: meta_fullname_idx_icd10_icd9

  -- DROP INDEX i2b2metadata.meta_fullname_idx_icd10_icd9;

  CREATE INDEX meta_fullname_idx_mphds
      ON i2b2metadata.icd10_icd9 USING btree
      (c_fullname COLLATE pg_catalog."default")
      TABLESPACE pg_default;

  -- Index: meta_hlevel_icd10_icd9_idx

  -- DROP INDEX i2b2metadata.meta_hlevel_icd10_icd9_idx;

  CREATE INDEX meta_hlevel_mphds_idx
      ON i2b2metadata.icd10_icd9 USING btree
      (c_hlevel)
      TABLESPACE pg_default;

  -- Index: meta_synonym_icd10_icd9_idx

  -- DROP INDEX i2b2metadata.meta_synonym_icd10_icd9_idx;

  CREATE INDEX meta_synonym_mphds_idx
      ON i2b2metadata.icd10_icd9 USING btree
      (c_synonym_cd COLLATE pg_catalog."default")
      TABLESPACE pg_default;

  DELETE FROM i2b2metadata.mphds;
  INSERT INTO i2b2metadata.mphds(
    	c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_totalnum, c_basecode, c_metadataxml, c_facttablecolumn, c_tablename, c_columnname, c_columndatatype, c_operator, c_dimcode, c_comment, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd, valuetype_cd, m_exclusion_cd, c_path, c_symbol, plain_code)
    	VALUES (0,'\\mphds\\','MPHDS', 'N', 'FA', null, null, null, 'CONCEPT_CD', 'CONCEPT_DIMENSION', 'CONCEPT_PATH', 'T', 'LIKE', '\\mphds\\', null,null,'@', DATE '01JAN01', null, null, null, null, null,null,null,null),
          		(1,'\\mphds\\test\\','test', 'N', 'LA', null, 'TEST:TEST', null, 'CONCEPT_CD', 'CONCEPT_DIMENSION', 'CONCEPT_PATH', 'T', 'LIKE', '\\mphds\\test\\', null,null,'@', DATE '01JAN01', null, null, null, null, null,null,null,null);

  COMMIT;				
