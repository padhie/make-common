# make-common
small repository with some helpfull makefile functions to use

## how to use
Add this snippen at the top of your make file   
```bash
help.mk:
	curl -o help.mk https://raw.githubusercontent.com/padhie/make-common/refs/heads/master/help.mk
include help.mk
```

This will download the `help.mk` file if it doesn't exists and include it.   
The `help.mk` file will only download if it doesn't exists (so no multiple downloads).   
