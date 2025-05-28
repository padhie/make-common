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
				if (indexParamEnd > 0) { \
					indexParamLen = indexParamEnd-indexParamStart-3; \
				} else { \
					indexParamEnd = length($$0); \
				} \
				indexParamLen = indexParamEnd-indexParamStart-3; \
				param = substr($$0, indexParamStart+3, indexParamLen); \
			} \
			\
			indexDescStart = index($$0, "## "); \
			if (indexDescStart > 0) { \
				indexLastCharacter = 0; \
				for (i = indexDescStart - 1; i > 0; i--) { \
					c = substr($$0, i, 1); \
					if (c != " " && c != "\t") { \
						indexLastCharacter = i; \
						break; \
					} \
				} \
				gap = substr($$0, indexLastCharacter + 1, indexDescStart - indexLastCharacter - 1); \
				descText = substr($$0, indexDescStart + 2); \
  				gsub(/^[ \t]+/, "", text); \
				desc = gap descText; \
			} \
			print target, param, desc; \
		}'
