# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - seems obvious
- [x] Use ActiveRecord for storing information in a database - stores Users as well as their tasks
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) - Users and Tasks
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts) - each user can have many tasks, but tasks can only have one owner
- [x] Include user accounts - each user has their own account, not sure if these are supposed to be viewable by anyone
- [x] Ensure that users can't modify content created by other users - is_loggedin?
- [x] Include user input validations - using validates as well as required in some areas
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) - done on /tasks/new
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
