git-lfnw-2012.html: git-lfnw-2012.txt
	pandoc -w slidy -s $< > $@

.DELETE_ON_ERROR:
