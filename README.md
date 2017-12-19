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


  rails c
  @recipe = Recipe.last //grabs the last recipe for us, we notice that the user_id is nil
  TO SOLVE THE BCRYPT ERROR IN WINDOWS
  I solve it with uninstall all bcrypt gem versions with gem uninstall bcrypt and select option 3 (if exist) and uninstall all bcrypt-ruby gem versions with gem uninstall bcrypt-ruby and select option 3 (if exist) then install bcrypt using gem install bcrypt --platform=ruby then add this line gem 'bcrypt', platforms: :ruby to Gemfile

  We now go to the controller and change the create method