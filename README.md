# Simple User Authentication

## Quickstart

First, clone this repository

```bash
> git clone https://github.com/makersacademy/simple_user_auth.git
> cd simple_user_auth
> bundle install
```
Then, create the development and test databases
```
> createdb user_auth_development
> createdb user_auth_test
> rake db:auto_migrate
> rake db:auto_migrate RACK_ENV=test
```
And then, to run locally
```
> rackup # Start the server at localhost:9292
```

## To run tests
```
> bundle exec rspec
```

# Instructions


### 1. Diagramming

1. Diagram the flow of data through this application by writing down the sequence of line numbers for each line of code that gets executed (in order) for each of the three feature specs

2. Find another pair and compare your work

### 2. Specs

1. Write specs for `User.authenticate`
    - if user doesn’t exist
    - If user does, but password incorrect
    - If user does and password correct

2. Write a feature test for a user signing up twice with the same email, and a unit test for validating uniqueness of email property

3. Write a feature test for a user using a password of at least 6 characters, and a unit test for validating this

#### Resources
- [DataMapper Validations](http://datamapper.org/docs/validations.html)

### 3. Flash Messages

1. Update one feature spec at a time to assert that the user is shown helpful messages, and then implement it.
  - A user should be shown information about why they succeeded or failed at signing up or in.

#### Resources
- [Sinatra Flash](https://github.com/SFEley/sinatra-flash)

### 4. Restful Routes

1. Read [this snippet](https://github.com/makersacademy/course/blob/master/pills/rest.md) and play around with this interactive tool https://sjmog.github.io/rest.

2. Rename the routes in this app to be restful and then separate `app.rb` into controllers that deal with one resource
    - Conventionally
        - Registrations controller ( get/post signup) eg: `get ‘/registrations/new’`, `post ‘/registrations`
        - Sessions controller (get/post signin/out)
        - Home controller ( get index)
        - App controller ( helper methods)

### 5. Further

1. Add user auth to your messaging app.
2. See Ed
