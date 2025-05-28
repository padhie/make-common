help:
	@grep -h -E '^[a-zA-Z0-9_-]+:.*?' $(MAKEFILE_LIST) | \
		awk '{ \
			indexTargetEnd = index($$0, ":"); \
			target = substr($$0, 0, indexTargetEnd-1); \
			param = desc = ""; \
			\
			indexParamStart = index($$0, "##@"); \
			if (indexParamStart > 0) { \
				indexParamEnd = index($$0, "## "); \
				indexParamLen = indexParamEnd-indexParamStart-3; \
				param = substr($$0, indexParamStart+3, indexParamLen); \
			} \
			\
			indexDescStart = index($$0, "## "); \
			if (indexDescStart > 0) { \
				desc = substr($$0, indexDescStart+3); \
			} \
			print target, param, desc; \
		}'
