.PHONY: install-kind
install-kind:
	./scripts/install-kind.sh

.PHONY: shard-%
shard-%:
	./scripts/e2e-kind.sh $@

.PHONY: control-plane
control-plane:
	./scripts/e2e-cp.sh

#.PHONY: install
#control-plane:
#	./scripts/e2e-cp.sh

.PHONY: install-cno-kind
install-cno-kind:
	./scripts/install-cno-kind.sh
