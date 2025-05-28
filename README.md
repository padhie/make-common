# make-common
small repository with some helpfull makefile functions to use

## how to use
Add this snippen at the top of your make file   
```mk
help.mk:
	curl -o help.mk https://raw.githubusercontent.com/padhie/make-common/refs/heads/master/help.mk
include help.mk
```
This will download the `help.mk` file if it doesn't exists and include it.   
The `help.mk` file will only download if it doesn't exists (so no multiple downloads).   


## help.mk
To add a description just add `## ` after the target
```mk
build:	## build the application
```
```bash
$ make help
 build           build the application
```

## help_with_param.mk
Similar to `help.mk` but with parameter. This can be addet with `##@`
```mk
build:	##@target=	## build the application
```
```bash
$ make help
 build env=               build the application
 help
```
