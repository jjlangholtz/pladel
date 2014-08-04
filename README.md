# Summary
Pladel is a dashboard lifestyle application for health accountability and
 improvement.

## Setting-up
1. Fork an instance of the project
2. ``git clone git@github.com:YOUR-USERNAME/pladel.git``
3. ``cd pladel``
4. ``bundle install``
5. ``rake db:create db:migrate db:seed``
6. ``rails s`` for the smoke test!

Git set-up:
1. Add the original repository as your upstream
``git remote add upstream https://github.com/jjlangholtz/pladel.git``
2. Create a new git branch with your initials
``git checkout -b <your initials>``

## Contributing
1. Make sure the test suite is green
``bundle exec rspec``
3. Add your improvements and commit your changes then test again
4. Fetch changes from the original repo and rebase, resolve conflicts
```
git fetch upstream
git rebase upstream/master
```
4. Test one last time then push your branch to your repo
``git push``
5. Make a Github pull request from your forked repo, compare your forked branch
 and original master, ask someone to review your code
