# config.mk include PRPJECT_ID
include config.mk

SUFFIX := $(shell date '+%Y%m%d')
DATASET := babyname
NAME_TABLE := name
INITIAL_TABLE := initial_count

bq-list-dataset:
	bq ls --project_id $(PRPJECT_ID)

bq-mk-dataset:
	bq mk --dataset --default_table_expiration 172800 $(PRPJECT_ID):$(DATASET)$(SUFFIX) 

bq-mk-name-table:
	bq mk --table $(PRPJECT_ID):$(DATASET)$(SUFFIX).$(NAME_TABLE) ./data/name.json

bq-mk-initial-table:
	bq mk --table $(PRPJECT_ID):$(DATASET)$(SUFFIX).$(INITIAL_TABLE) ./data/initial_count.json

bq-load:
	bq load --source_format=CSV $(PRPJECT_ID):$(DATASET)$(SUFFIX).$(NAME_TABLE) ./data/name-data.csv  

bq-mk-load: bq-mk-dataset bq-mk-name-table bq-load bq-mk-initial-table