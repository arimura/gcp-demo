# config.mk include PRPJECT_ID
include config.mk

SUFFIX := $(shell date '+%Y%m%d')
DATASET := name
bq-list-dataset:
	bq ls --project_id $(PRPJECT_ID)

bq-mk-dataset:
	bq mk --dataset --default_table_expiration 172800 $(PRPJECT_ID):$(DATASET)$(SUFFIX) 
