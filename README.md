# Player Notifier Challenge

Every football supporter wants to know what’s happening with their favorite players. In this challenge you’ll be able to do just that!

# Stacks

- Ruby 3.2
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

# Database seed

Run `rails db:seed` to do the first database populate;

# API

There should be two different frontend applications consuming the API endpoints

- An admin one, responsible for managing players and trigger notifications
- An user one, responsible for listing all the players and subscribing to notifications regarding some of them

The API endpoints should deliver:

- crud endpoints for players
- crud endpoints for notifications
- subscribing notifications

A Postman API calls sample can be accessed at: [https://www.postman.com/mbrunoon/workspace/player-notifier-challenge](https://www.postman.com/mbrunoon/workspace/player-notifier-challenge)

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

## Bonus

- ☑️ Sorting on player’s listing based on position, nationality or age
- ☑️ Players listing pagination
- ☑️ Endpoints documentation

## Expectations:

- ☑️ Good testing coverage
- ☑️ Well documented code
- ☑️ Good design options
- ☑️ How to install and run the code

---

Source: [https://realfevr.github.io/challenge/](https://realfevr.github.io/challenge/)