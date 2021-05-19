# This makefile is an archive of corepop executables from which a Poplog
# system can be built.
#

.PHONEY: help
help:
	# The valid targets for this Makefile are as follows:
	#     corepop - finds the most modern working corepop
	#     clean - remove all artefacts (e.g. corepop)
	#

.PHONEY: clean
clean:
	rm -f corepop

# This target will search the collection of corepop images and
# find the most recent working version and leave it in the file
# called corepop at top-level.
corepop:
	mv $(shell /bin/sh ./find.sh) corepop
	test -e corepop
	
