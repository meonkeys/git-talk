% Git for fun and profit!
% Jesse Keating and Adam Monsen
% April 28, 2013

# Intro

<!--
Conference: LinuxFest Northwest 2013
Target audience: git beginner to intermediate
-->

<!-- Adam -->

- What we'll cover
    - good stuff
- What we won't cover
    - bad stuff

# Credits

<!-- Adam -->

- Thank you, LFNW, thank you BLUG!

# What is git?

<!-- Both -->

- Snapshot management
    - each "commit" is a snapshot of the tree instead of patches

- Distributed
    - Everybody gets a complete copy
    - Awesome for offline use
    - Awesome for contributors to collaborate

- Designed around multiple contributors
    - Tools to easily pass changes around
    - Differentiate between author, committer (and pusher, not recorded)

- Git is better than everything
    - <http://whygitisbetterthanx.com/>

# Get Started (1/2)

<!-- Jesse -->

- git init
<div class="handout">
<pre>
$ mkdir project
$ cd project
$ git init .
</pre>
</div>

- git status
<div class="handout">
<pre>
$ git status
# On branch master
#
# Initial commit
#
nothing to commit (create/copy files and use "git add" to track)
</pre>
</div>

- git add
<div class="handout">
<pre>
$ echo "Hello World" &gt; README
$ git add README
$ git show
</pre>
</div>

<!-- Adam -->

- git commit
    - write [proper commit log messages](http://mifosforge.jira.com/wiki/display/MIFOS/Commit+Log+Guide)
    - and make sure your peers do too!

<!-- Jesse -->

- git log

# Get Started (2/2)

<!-- Jesse -->

- git show
    - git log -p
<div class="handout">
Add a few more files and commits to show more data in the log
</div>

<!-- Adam -->

- git clone
<div class="handout">
<pre>
$ mkdir myclones
$ cd myclones
$ git clone ../project
</pre>
</div>

- git diff
    - wtf is origin?
<div class="handout">
<ul>
  <li>cd back into original project</li>
  <li>Add some changes to existing files to show the diff</li>
  <li>Explore some diff options by looking at git diff --help (opens <code>git-diff(1)</code>manpage)</li>
</div>

- git pull
<div class="handout">
Go back to project/ directory and commit some changes.  Then go to the clone
and do the pull
</div>

<!-- Jesse -->

- git tag
    - lightweight vs annotated
    - with gpg key

# Get a Safety Net

<!-- Jesse -->

- dry runs
    - not an oxymoron
<div class="handout">
Many commands have a --dry-run or -n option. This option can be used to test
an action before doing it. push, rm, add, clean, mv, etc...
</div>

<!-- Adam -->

- git checkout FILE
<div class="handout">
<ol>
    <li>make local changes</li>
    <li>revert changes in one file with <code>git checkout file</code></li>
</ol>
Sometimes <code>git checkout -- file</code> syntax is required.
</div>

- git reset
<div class="handout">
<pre>
$ git reset --help
$ git reset
$ git reset --hard
</pre>
</div>

- git reflog
    - recover lost commits
<div class="handout">
<pre>
# make changes
$ git commit -m 'first'
# make more changes
$ git commit -m 'second'
# whoops! blow away 'second'
$ git reset --hard HEAD^
# hooray, git still has it
$ git reflog
$ git reset --hard HEAD@{1}
</pre>
<p>Note that <code>git merge HEAD@{1}</code> also works. Good luck with that one.</p>
<p>Further reading:
<ol>
  <li><a href="http://gitready.com/intermediate/2009/02/09/reflog-your-safety-net.html">http://gitready.com/intermediate/2009/02/09/reflog-your-safety-net.html</a></li>
  <li><a href="http://gitready.com/advanced/2009/01/17/restoring-lost-commits.html">http://gitready.com/advanced/2009/01/17/restoring-lost-commits.html</a></li>
</p>
</div>

# Get along with other people (1/3)

<!-- Adam -->

- GitHub at a glance
    - very popular, integrates with everything
    - lightning-fast collaboration
    - proprietary, but most data+history are in git
    - if you can use Git, you can use GitHub

# Get along with other people (2/3)

- GitHub pull request demo
    - create branch
    - commit change
    - push change
    - create PR
    - merge PR
    - delete branch

<div class="handout">
<pre>
$ git checkout -b newtitle
$ editor README.md
$ git commit
$ git push -u origin newtitle
</pre>
<p>This section used to be about creating a stand-alone bare clone to share
with others over SSH. This still works, of course, but you'll probably also
want to learn GitHub since so many people use it.</p>
<p>Warning: some data is not in saved your git repo. For instance: pull request
description/body, code reviews. It may be possible to export this.</p>
</div>

<!-- Jesse -->

- Creating patches
    - format-patch
    - git diff
    - git send-email
    - git request-pull
<div class="handout">
<p>Here we will do some of the same things that we did with github, only we
will do them manually to show a bit more of what's going on, and to give you
an idea of how to operate outside of GitHub.</p>
Create some more changes but don't commit.
<pre>
$ git diff &gt; foo.patch
</pre>
Now commit it (and more) and then use format-patch to get the patch(es)
<pre>
$ git format-patch HEAD^
$ git format-patch &lt;hash&gt;^
</pre>
Finally show how you can send email directly with many options
<pre>
$ git send-email --compose --to jkeating@j2solutions.net --subject "Stuff" HEAD^^
</pre>
<p>Git request-pull allows you to create a summary of differences in your fork
of a project. Very similar to a GitHub pull-request.</p>
<pre>
$ git request-pull origin/master jlk ansible
</pre>
</div>

# Get along with other people (3/3)

<!-- Jesse -->

- Applying patches
    - git apply
    - git am
    - signed-off-by
    - format-patch / am is better because context

<div class="handout">
<p>Here is how we can process the patch set. This is also what GitHub is
doing, and again we'll see the details of what happens.</p>
<p>Applying someting created with (git) diff is git apply.</p>
<p>Applying something created with git format-patch is git am</p>
<p>signed-off-by can be used to add a layer of record keeping</p>
<p>format-patch is better as it includes more context than pure diff</p>
</div>

<!-- Adam -->

- Cherry picking
    - diff-and-apply from anywhere to anywhere
    - consider `-x`, as in `git cherry-pick -x COMMIT`
<div class="handout">
<ol>
    <li>commit something to a branch<li>
    <li>cherry-pick it onto another branch<li>
</ol>
</div>

- Conflict resolution
    - software (including git) doesn't help much
    - great communication does!

# Get Clever (1/3)

<!-- Adam -->

- git blame
<div class="handout">
<pre>
$ git blame
</pre>
</div>

- git stash
<div class="handout">
Make some local modifications, then
<pre>
$ git stash
# or
$ git stash save 'WIP almost cracked SHA-512'
$ git stash list
$ git stash show -p
$ git stash pop
# or
$ git stash drop
</pre>
</div>

- interactive commit
    - just like `add -p` followed by commit
<div class="handout">
Make some local modifications, then
<pre>
$ git commit --interactive
</pre>
</div>

<!-- Jesse -->

- rebase
    - interactive
    - rebase to a branch
    - pull --rebase
    - odd name, very useful and easy
<div class="handout">
<ol>
  <li>Make a series of commits on a branch, some fixups, etc..<li>
  <li>Make more nonconflicting changes on master<li>
</ol>
<pre>
$ git rebase -i HEAD^^^
</pre>
<pre>
$ git rebase master
</pre>
</div>

# Get Clever (2/3)

<!-- Jesse -->

- git grep
    - can grep working tree or other treeishs

- git show
    - See content from history or other branches

# Get Clever (3/3)

<!-- Adam -->

- bisect ([demo repo](https://github.com/meonkeys/secret-octo-ironman))
    - binary search for commit introducing bug

# Further reading

<!-- Adam -->

- Read [Pro Git](http://progit.org)!
- Now. Do it now.

<span style="float:right"><a href="http://progit.org"><img src="http://progit.org/images/book-big.jpg" /></a></span>

- [set `core.autocrlf` appropriately!](http://help.github.com/line-endings/)
- [git reference manual](http://schacon.github.com/git/git.html) (man pages)
- [git-enhanced shell prompt and tab-completion](http://git-scm.com/book/en/Git-Basics-Tips-and-Tricks#Auto-Completion)
    - invaluable info included in prompt
- use [snerk-util git scripts](https://github.com/meonkeys/snerk-util/tree/master/git) for operating on many git repositories at once
    - also consider submodules
- [Adam's git config](https://github.com/meonkeys/dotfiles)
- [Interactive revert](http://stackoverflow.com/a/2383361/156060)
- [hand-edited commits](http://stackoverflow.com/a/2333917/156060)


<!--
vim: ft=markdown
-->