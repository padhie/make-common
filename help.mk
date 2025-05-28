help:
	@grep -h -E '^[a-zA-Z0-9_-]+:(.*?## .*)?$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":(.*?## )?"}; {printf "  %-15s %s\n", $$1, $$2}'
