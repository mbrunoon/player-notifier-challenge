# Players Notifier Challenge
Every football supporter wants to know what’s happening with their favorite players. In this challenge you’ll be able to do just that!

# Installing

- Ruby 3.2
- Ruby on Rails 7.0.4

### Database seed

Run `rails db:seed` to do the first database populate;

  
###  There should be two different frontend applications consuming the api endpoints[](https://realfevr.github.io/challenge/#there-should-be-two-different-frontend-applications-consuming-the-api-endpoints)

- ☑️ An admin one, responsible for managing players and trigger notifications
- ☑️ An user one, responsible for listing all the players and subscribing to notifications regarding some of them

### The API endpoints should deliver[](https://realfevr.github.io/challenge/#the-api-endpoints-should-deliver)

- ☑️ crud endpoints for players
- ☑️ crud endpoints for notifications
- ☑️ subscribing notifications

## Models

- ✅ Players:
  - name:
  - number
  - nationality
  - age
  - position
- ✅ Notifications:
  - Player
  - message
- ✅ 🆕 Teams:
  - name
  - acronym
 - ✅ 🆕 User
	 - Name
	 - E-mail
	 - Password
	 - Role (Admin, Supporter)
 - ☑️ 🆕 User Favorite Players
	 - User
	 - Player 

  

# Tasks

Tasks created to be runned by background jobs.
  
#### ✅ Update Players
Update players data directly from API data. Command:
```
rails players:update
```


#### ☑️ there should be a task responsible for deleting notifications older then one week[](https://realfevr.github.io/challenge/#there-should-be-a-task-responsible-for-deleting-notifications-older-then-one-week)

  

#### ☑️ a user should be notified when a notification for the players he subscribed is triggered[](https://realfevr.github.io/challenge/#a-user-should-be-notified-when-a-notification-for-the-players-he-subscribed-is-triggered)

  

## Bonus
- ☑️ Sorting on player’s listing based on position, nationality or age
- ☑️ Players listing pagination
- ☑️ Endpoints documentation

  

## Expectations:

- ☑️ Good testing coverage
- ☑️ Well documented code
- ☑️ Good design options
- ☑️ How to install and run the code

Ideally the stack on the challenge should be similar to the one used on Realfevr or feel morebut some other options are also going to be accepted (feel free to use what you feel more comfortable with).

- Ruby
- React
- JSON

---  

### pro tips:
- Don’t waste to much time on the layout and on the testing part of the frontend
- The notifications could be sent with some mock emailer
- Send us github repos links or if you prefere you can zip all the projects folders and send us with a README instructions. Just use git on each one to see your commits progress.
- Take the time you need, don’t feel pressured on time, we know you’re working and have a life too, so take the time you need for sending a solution.
- Any doubts about the challenge can be sent to tiago.bem at realfevr.com and bruno.coelho at realfevr.com with the subject **HELP with Challenge**, as soon as we can we’ll reply to you.


source: https://realfevr.github.io/challenge/