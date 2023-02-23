.PHONY: all
all: doc

export DBNAME=contacts
export DBUSER=admin
export DBPASS=password

define PROMPT
@echo ""
@echo "**********************************************************"
@echo "*"
@echo "*    $1"
@echo "*"
@echo "**********************************************************"
@echo ""
endef

.PHONY: doc
doc: schema
	$(call PROMPT, $@)
	tbls doc --rm-dist

.PHONY: up
up:
	$(call PROMPT, $@)
	docker-compose up -d
	until docker-compose exec -T db psql $(DBNAME) $(DBUSER) -c "select 1" > /dev/null 2>&1; do \
		echo "Waiting for database to start..."; \
		sleep 1; \
	done

.PHONY: schema
schema: up
	$(call PROMPT, $@)
	docker-compose exec -T db psql $(DBNAME) $(DBUSER) < schema.sql

.PHONY: down
down:
	$(call PROMPT, $@)
	docker-compose down -v

.PHONY: sql
sql:
	$(call PROMPT, $@)
	docker-compose exec db psql $(DBNAME) $(DBUSER)

.PHONY: clean
clean:
	$(call PROMPT, $@)
	rm -rf docs