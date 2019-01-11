# madcoders_makersbnb #
# Makersbnb #

## Project ##

We are building a web app similar to the Airbnb one, based on the following user story.<br/>

```
As a user
So that I can list properties
I need to be able to sign up
```
```
As a user
So I can access my account
I need to be able to sign in
```
```
As a user
So I can leave my account
I need to be able to sign out
```
```
As a user
So that I can have guests
I need to be able to list a new space
```
```
As a user
So I can have guests at multiple locations
I need to be able to list multiple spaces
```
```
As a user
So I can describe the space and price to my guests
I need to be able to put title, describe space and give £ per night
```
```
As a user
So guests know when they can stay
I need to be able to display a range of dates where the space is available
```
```
As a user
So that I can stay at a property
I need to be able to book
```
```
As a user
So that I can stay at a property
I need to be able to be approved by the owner
```
```
As a user
So that I can vet my guests
I want to have the option of approving or denying user requests to stay
```
```
As a user
So that I don’t double-book guests
I want to be able to block that date from being booked
```
```
As a user
So that I can keep the space open until it’s been booked
I want to be have the space open for booking until the guest approves
```

## Our approach ##

This project is done in a team of 3 people.<br/>
We are using those high level skills :<br/>
1. [XP values](#xp-values) to guide your behaviour<br/>
2. The full [developer workflow](#development-workflow) (Creating issues, branching, reviewing, squirrelling, merging.<br/>
3. Keeping code quality and test coverage using *Rspec*, *Capybara*, *simpleCov*, *Rubocop*<br/>
4. Agile process (diagram, morning stand up, afternoon retro)*

We build our CRC Model based on the user story as following.<br/>

![CRC model](https://user-images.githubusercontent.com/43742795/51039457-44d75900-15ad-11e9-8328-28f7f9f5d4d1.png)

Due to the short time we had to build the app, we decide to prioritise what was Minimum viable product by building our MVP as following :<br/>

1. User is able to sign_up
2. User is able to sign_out
3. User is able to sign_in
4. User is able to choose on his profile page if he wishes to list or book a property (list and book button on profile page)
5. In case of list, user is redirected on list page and is able to fulfil a form about the property he wishes to list.
6. User is able to add the date of the availability for this property
7. User can see on his profile page the list of the properties that he have listed
8. In case of book, useris redirected on a book page, where he is able to enter the dates he wishes to book a property
9. User click on search and a list of the available properties matching his dates is displayed
10. User is able to click on a property to book it and is redirect on a page where he can see a message letting him know that the owner will have to approve his booking.<br/>

The project has been build from this ![mockup](https://user-images.githubusercontent.com/43742795/51042620-a4853280-15b4-11e9-98e3-cc1a6ed273b5.png).

## How to use ##

### Set up ###

1. clone the repo<br/>
Under the repo name click *clone or download*<br/>
Click on *use HTTPs*, copy the clone URL of the repo<br/>
In the terminal go on the working directory where you want the cloned directory to be<br/>
Use the `git clone` command and paste the clone URL then press enter :

```shell
$ git clone https://github.com/your-username/your-repositary.git
```

2. On your local machine go inside of the *madcoders_makersbnb* directory :

```shell
$ cd madcoders_makersbnb
```
3. To install all the *gems* contained in the *Gemfile*, install and run *Bundle* :
Install :

```shell
$ install bundle
```
Run:

```shell
$ bundle
```
4. You can see the different directories, with the `ls` command.

### Database ###

5. If you do not have it already, install *psql* on your local machine. Connect to your database and create two of them to be able to run the test and the app.<br/>
Make one called *makers_bnb_development* and one called *makers_bnb_test*.<br/>

```shell
$ psql
admin= CREATE DATABASE makers_bnb_development;
admin= CREATE DATABASE makers_bnb_test;
```

6. Exit from psql and from the command line run the `rake` command followed by the `db:auto_migrate` command. This will create your tables in your development DB.<br/>

```shell
$ rake db:auto_migrate
```

7. From the command line run the `rake` command followed by the `db:auto_migrate RACK_ENV=test` command. This will create your tables in your test DB.<br/>

```shell
$ rake db:auto_migrate RACK_ENV=test
```

8. Connect to psql and connect to your database using the `\c databasename` command.<br/>
Once you are connected to the database you choose, you can list the tables using the `\dt` command.<br/>

```shell
$ psql
admin= \c makers_bnb_development;
makers_bnb_development= \dt
```
9. You can connect to a specific table by using the `SELECT * FROM tablename` command.<br/>

```shell
makers_bnb_development= SELECT * FROM tablename;
```
### Run the tests ###

1. Check that the codes are passing the test. From the root *madcoders_makersbnb* directory, run the *spec*.<br/>
You can check all the files in one goal:

```shell
$ cd madcoders_makersbnb
$ rspec
```
You can check only one file at a time :

```shell
$ cd madcoders_makersbnb
$ rspec spec/file_name_spec.rb
```

2. Check that the code respect the quality of the *Rubocop* guideline, by running `rubocop` from the *madcoders_makersbnb* directory :

```shell
$ cd madcoders_makersbnb
$ rubocop
```

## Run the app ##

1. On the command line, from the root directory *madcoders_makersbnb*, use the `rackup` command :

```shell
$ cd madcoders_makersbnb
$ rackup
```

You'll be able to see that the localhost port used is *9292*

1. Open your browser and type the url of your *localhost:9292*  <br/>

2. click on sign_in, enter your email address and password and click on `Sign in`.<br/>

3. Choose what you would like to do : list a property or book one (better to start by listing one to have some data in your DB).<br/>
You can then log out and create as many users as you wish and add as many properties as you wish, with many different availabilities.<br/>
Then you can log out, and with one of the existing user (or by creating a new one) you can go on the book section and search for available properties for the dates that you would like to.

4. Enjoy playing around with our app as much as you want :slighty_smiling_face:


## Authors ##

Our 3 fabulous *MadCoders* team members who collaborate to build this app :<br/>
@AlinaGoaga <br/>
@joaoag (João Abbott-Gribben)<br/>
@CelineKaslin


## Acknowledgements ##

Code from sign_in_sign up web app from @dearshrewdwit (Edward Withers)
