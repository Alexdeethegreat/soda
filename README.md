# README - Song of the Day Application (SODA!)

Welcome to SODA!

SODA is a crowdsourcing application for users of our platform to find the new, popular song of the day! 

Given the openness and sharing qualities in the music community, we want to tap into that to share new music to our users!

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

To get start, you need to clone our git files onto your local machine. 
	- Set up a local folder to store the project in
	- git clone https://github.com/brpthomas/soda.git 

Step 1) Install Ruby! (MAC OS-X)
In terminal, run the following:
`$ brew install ruby`

Step 2) Install dependencies! 
In terminal, run the following:
`$ sudo bundle install` 

Step 3) Install simple-form gem!
In terminal, run the following:
`$ gem 'simple_form' `
`$ bundle install`
`rails generate simple_form:install --bootstrap`

Step 4) Go to the soda application files and access it

Step 5) Set up your migration files! 
In terminal, run the following:
`rails db:migrate`

Step 6) Run the seed files!
In terminal, run the following:
`rails db:seed`

Step 7) You're close, so start running your servers! 
In terminal, run the following:
`$ rails s`


### Prerequisites

Language:
Ruby v2.4.1

Framework:
Rails 


### Step-by-step usage of the application

A step by step series of examples that tell you have to get a development env running

Say what the step will be

Step 1) Head to our application! 

```
Visit https://song-of-the-day-app.herokuapp.com
```
Step 2) Sign Up! 

```
Sign up into our application with a valid email and password 
```
Step 3) Update your profile now or later! 

```
Step 4) Once you're at your profile, you can add your favorite song by searching for it! Once you add it, it should appear in your favorite song link in your profile page. 

```
Step 5) Vote! 
```
Let your voice be heard by voting for your favorite song! 
```
At the end of each day, the song with the most votes will be shared to all users of our platform!
```

## Heroku deployment

Add additional notes about how to deploy this on a live system

SODA was deploy on Heroku!
1. Set up your git

2. Make sure you are using postgresql

3. Set up your app to use ES6

4. Push changed app to dev branch

4.5 Merge your dev branch with your master branch
	heroku pushes what you have within your master branch so merge the new file structure with the master before you push to heroku.

5. Create your heroku app

heroku create <NAME-OF-APP-GOES-HERE>

6. Push your app to heroku
	1. git add .

 	2. git commit -m "heroku deployment is fun"

	3. git push heroku master

7. Set up environmental variables
	In your heroku GUI, add any environmental variables you may need

8. Set up your database

	1. run heroku run rails db:migrate to migrate your database on heroku
	2. run heroku run rails db:seed to seed your database on heroku




## Built With

* Rails - The web framework used
* Ruby - language 

## Contributing

Please reach out to the following on github; brpthomas, agottlie, Alexdeethegreat, antrev) for details on our code of conduct, and the process for submitting pull requests to us.


## Authors

* Peter Hoang, Andrew Gottlieb, Alex Rishkevich, Anton Revich

## License

This project is licensed under the MIT License 

## Acknowledgments

* Hat tip to anyone who's code was used
* Thanks to Trevor Preston for checking in on the team and keeping the pace!
* Thanks to Jackie Casper for help with Heroku deployment!

