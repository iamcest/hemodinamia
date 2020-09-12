#!/bin/sh
psql angio_dev < definitions_data.sql 
psql angio_dev <  defs_sentences_data.sql
psql angio_dev < defs_options_data.sql 
psql angio_dev <  defs_codes_data.sql 


psql angio_dev <  opts_codes_data.sql
psql angio_dev <  opts_sentences_data.sql
psql angio_dev < defs_tables_data.sql
psql angio_dev <  languages_data.sql 
psql angio_dev < countries_data.sql 
psql angio_dev < tree_native.sql 






