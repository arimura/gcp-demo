# config.mk include PRPJECT_ID
include config.mk

SUFFIX := $(shell date '+%Y%m%d')
DATASET := name
TABLE := name
bq-list-dataset:
	bq ls --project_id $(PRPJECT_ID)

bq-mk-dataset:
	bq mk --dataset --default_table_expiration 172800 $(PRPJECT_ID):$(DATASET)$(SUFFIX) 

bq-mk-table:
	bq mk --table $(PRPJECT_ID):$(DATASET)$(SUFFIX).$(TABLE) ./data/table.json
