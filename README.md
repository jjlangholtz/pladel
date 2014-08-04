# Summary
Pladel is a dashboard lifestyle application for health accountability and
 improvement.

## Setting-up
1. Fork an instance of the project.
2. ``git clone git@github.com:YOUR-USERNAME/pladel.git``
3. ``cd pladel``
4. ``bundle install``
5. ``rake db:create db:migrate db:seed``
6. ``rails s`` for the smoke test!

__Git set-up__

Add the original repository as your upstream.
```
git remote add upstream https://github.com/jjlangholtz/pladel.git
```
Create a new git branch with your initials.
```
git checkout -b <your initials>
```

## Contributing
Frequently make sure the test suite is green.
```
bundle exec rspec
```
Add your improvements and commit your changes with descriptive messages
Fetch changes from the original repo and rebase. Resolve any conflicts if
 necessary.
```
git fetch upstream
git rebase upstream/master
```
Test one last time then push your branch to your repo.
```
git push
```
Make a Github pull request from your forked repo. Make sure you compare your forked branch
 and original master. Ask someone to review your code.
