git-talk-s5.html: git-talk.md
	pandoc -w s5 -s $< > $@

git-talk-s5-FINAL.html: git-talk.md
	pandoc -w s5 --data-dir=. --self-contained -s $< > $@

publish-to-github: git-talk-s5-FINAL.html
	git checkout gh-pages
	mv git-talk-s5-FINAL.html index.html
	git commit -m 'generate new slideshow' index.html
	@echo -------
	@echo to publish to http://meonkeys.github.io/git-talk/ , run
	@echo
	@echo     git push origin gh-pages
	@echo
	@echo -------

clean:
	$(RM) *.html

.DELETE_ON_ERROR:
