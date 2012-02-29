git-lfnw-2012-s5.html: git-lfnw-2012.txt
	pandoc -w s5 -s $< > $@

git-lfnw-2012-s5-FINAL.html: git-lfnw-2012.txt
	pandoc -w s5 --data-dir=. --self-contained -s $< > $@

.DELETE_ON_ERROR:
