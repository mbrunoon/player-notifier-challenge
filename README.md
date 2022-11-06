
# Player Notifier Challenge

Every football supporter wants to know what’s happening with their favorite players. In this challenge you’ll be able to do just that!

Deployed app address: https://players-notifier-challenge.herokuapp.com/

# Stacks

- Ruby 3.1.2
- Ruby on Rails 7.0.4

# Environment Variables

```
MAILER_DEFAULT_FROM = email@email.com
MAILER_USERNAME = email@email.com
MAILER_PASSWORD = mailerpassword
MAILER_DOMAIN = domain.com
MAILER_ADDRESS = smtp-address.com
MAILER_PORT = 587
DEVISE_JWT_SECRET_KEY = yourrandomsecurecharacteres
```

# Installing proccess:
- Run `git clone https://github.com/mbrunoon/player-notifier-challenge.git` to copy this project;
- Run `bundle install` to install all necessary gems;
- Run `gem install rails -v 7.0.4` to install the Ruby on Rails;
- Create and configure your database credentials on file `config/database.yml`;
- Run `rails db:create`to create the database;
- Run `rails db:migrate`to create the database tables;
- Run `rails db:seed` to do the first database populate;

# API

There are  two different frontend applications consuming the API endpoints:

- An admin one, responsible for managing players and trigger notifications;
- An user one, responsible for listing all the players and subscribing to notifications regarding some of them;

The API endpoints you can:

- CRUD endpoints for players
- CRUD endpoints for notifications
- Subscribing notifications

## Documentation

You can find examples and more information on how to access the API and the endpoints on the application's main page (localhost:3000) or by accessing the demo application: https://players-notifier-challenge.herokuapp.com/

Or a Postman API calls sample can be accessed at: [https://www.postman.com/mbrunoon/workspace/player-notifier-challenge](https://www.postman.com/mbrunoon/workspace/player-notifier-challenge)

# User access

A login method used JWT was implemented. For correct API access, it is necessary to register to obtain a Token.

For new Admin users, the permission must be changed directly in the database in the "role" field of the "User" model.

By default, a Admin is created when `rails db:seed` is run:
```
email: "admin@admin.com"
password: "admin@admin"
````

# Endpoints samples

## Admin

**Players**

| URL | Method |
| --- | --- |
| /admin/players | GET, CREATE |
| /admin/players/:id | PATCH, DELETE |

**Notifications**

| URL | Method |
| --- | --- |
| /admin/notifications | GET, CREATE |
| /admin/notifications/:id | PATCH, DELETE |

**Teams**

| URL | Method |
| --- | --- |
| /admin/teams | GET, CREATE |
| /admin/teams/:id | PATCH, DELETE |

**Favorite Players**

| URL | Method |
| --- | --- |
| /admin/user_favorite_players | GET, CREATE |
| /admin/user_favorite_players/:id | PATCH, DELETE |

**Trigger**

| URL | Method |
| --- | --- |
| /admin/trigger/notification/:id | PATCH |

## Supporter

**Players**

| URL | Method |
| --- | --- |
| /admin/players | GET |

**Notifications**

| URL | Method |
| --- | --- |
| /admin/notifications | GET, CREATE |

**Favorite Players**

| URL | Method |
| --- | --- |
| /admin/user_favorite_players | GET, CREATE |
| /admin/user_favorite_players/:id | DELETE |

## Models

- Players:
    - name:
    - number
    - nationality
    - age
    - position
- Notifications:
    - Player
    - message
- Teams:
    - name
    - acronym
- User
    - Name
    - E-mail
    - Password
    - Role (Admin, Supporter)
- User Favorite Players
    - User
    - Player

# Tasks

Tasks created to be run in background jobs.

### Update Players

Update players data directly from API data. Command:

```
rails players:update
```

## Delete Old Notifications

There should be a task responsible for deleting notifications older then one week.

To delete all read notifications, run:

```
rails notifications:delete_older
```

## Trigger Notification Read

A user should be notified when a notification for the players he subscribed is triggered.

A notification (email) will be send to the user when that register received a value at “read_at” field. This can be done using the Admin Trigger endpoint (/admin/trigger/notification/:id) sending a PATCH request. The Notification will be updated automatically and the email will be send to the user.

---

Source: [https://realfevr.github.io/challenge/](https://realfevr.github.io/challenge/)