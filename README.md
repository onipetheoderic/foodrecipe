# README

This README would normally document whatever steps are necessary to get the
application up and running.

procedure
=========
rails new foodrecipes --database=postgresql
configure the database.yml file
rake db:create
rails g controller recipes
resources :recipes #to generate the crud routes for our recipes app
root "recipes#index" #to creATE the index file

rails g model Recipe title:string description:text user_id:integer


we need to have the ability to create nested forms
so we use the cocoon gem to achieve this
gem 'cocoon', '~> 1.2', '>= 1.2.9'

//after requiring the cocoon gem  in application.js for nested forms we now create the ingredient model
//rails g model Ingredient name:string recipe:belongs_to

//lets add multiple steps
rails g model Direction steps:text recipe:belongs_to

we now go to the recipe.rb
and type 
has_many :ingredients
has_many :directions
we now copy and paste the accept nested attributes

 rails g devise:install
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  rails g devise:views
  rails g devise User
  rake db:migrate
  
  rules of pushing to heroku from windows:
  firstly make sure all the gems are in the global settings, not on any group
  secondly make sure all the files in the bin folder has a line ending of unix style
  then remove exe from the bundle, rails, rake files, making the header look like #!/usr/bin/env ruby 
  how to upload apps to heroku in windows
  git init
  git add .
  git commit -m ""
  heroku create <name of app>
  git push heroku master
  heroku run db:migrate
 heroku open

  rails c
  @recipe = Recipe.last //grabs the last recipe for us, we notice that the user_id is nil
  TO SOLVE THE BCRYPT ERROR IN WINDOWS
  I solve it with uninstall all bcrypt gem versions with gem uninstall bcrypt and select option 3 (if exist) and uninstall all bcrypt-ruby gem versions with gem uninstall bcrypt-ruby and select option 3 (if exist) then install bcrypt using gem install bcrypt --platform=ruby then add this line gem 'bcrypt', platforms: :ruby to Gemfile

  We now go to the controller and change the create method
  
  
  how to git in windows
  I assume you are on a windows system like me and have GIT installed. You can either run these commands by simple command prompt in the project directory or you can also use GitBash.

Step 1: Create a repository in GIT manually. Give it whatever name you seem fit.

Step 2: Come to your local project directory. If you want to publish your code to this new repository you just created make sure that in the projects root directory there is no folder name .git, if there is delete it. Run command git init

Step 3: Run command git add .

step 4: Run command git commit -m YourCommitName

Step 5: Run command git remote add YourRepositoryName https://github.com/YourUserName/YourRepositoryName.git

Step 6: Run Command git push --set-upstream YourRepositoryName master --force

Please note that I am using the latest version of GIT at the time of writing. Also note that I did not specify any particular branch to push the code into so it went to master. In step 6 the GIT will ask you to authorize the command by asking you to enter username and password in a popup window.

Hope my answer helped.
  
