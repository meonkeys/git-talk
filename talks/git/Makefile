git-talk-s5.html: git-talk.txt
	pandoc -w s5 -s $< > $@

git-talk-s5-FINAL.html: git-talk.txt
	pandoc -w s5 --data-dir=. --self-contained -s $< > $@

.DELETE_ON_ERROR:
