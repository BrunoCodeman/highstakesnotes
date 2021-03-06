Welcome to Notes App!
===================
----------
Configuration
-------------
> **To configure the project and run locally, follow these steps:**
> - Install the prerequisites (Ruby 2.3, Rails 5 and PostgreSQL)
> - Clone this repo
> - Fill <i>config.action_mailer.smtp_settings</i> with your SMTP data in <i>environments/development.rb</i>
> - Fill your database connection settings in <i>config.database.yml</i>
> - Access your project folder using Terminal or Bash and run <i>bundle install</i> to install project dependencies
> - Run <i>rake db:migrate</i> to generate the database
> - Start the application running <i>rails s</i> in your terminal

----------
Routes
-------------

| path | method | purpose |
|:-----|:-------|:--------|
| /auth    | POST   | Email registration. Requires **`email`**, **`password`**, and **`password_confirmation`** params.|
| /auth | DELETE | Account deletion. This route will destroy users identified by their **`uid`**, **`access_token`** and **`client`** headers. |
| /auth | PUT | Account updates. This route will update an existing user's account settings. The default accepted params are **`password`** and **`password_confirmation`**.|
| /auth/sign_in | POST | Email authentication. Requires **`email`** and **`password`** as params. This route will return a JSON representation of the `User` model on successful login along with the `access-token`, `uid`, and `client` in the header of the response. These fields are required in each request header after login.|
| /auth/sign_out | DELETE | Use this route to end the user's current session. This route will invalidate the user's authentication token. You must pass in **`uid`**, **`client`**, and **`access-token`** in the request headers. |
| /auth/validate_token | GET | Use this route to validate tokens on return visits to the client. Requires **`uid`**, **`client`**, and **`access-token`** as params. These values should correspond to the columns in your `User` table of the same names. |
| /auth/password | POST | Use this route to send a password reset confirmation email to users that registered by email. Accepts **`email`** and **`redirect_url`** as params. The user matching the `email` param will be sent instructions on how to reset their password. `redirect_url` is the url to which the user will be redirected after visiting the link contained in the email. |
| /auth/password | PUT | Use this route to change users' passwords. Requires **`password`** and **`password_confirmation`** as params.|
| /auth/password/edit | GET | Verify user by password reset token. This route is the destination URL for password reset confirmation. This route must contain **`reset_password_token`** and **`redirect_url`** params. These values will be set automatically by the confirmation email that is generated by the password reset request. |
| /notes/:id | GET | Show a note from the current user with the informed id (e.g /notes/123) | 
| /notes | GET | List all notes from the current user | 
| /notes | POST | Create a new note with the content of the JSON param (e.g {"content": "Hello friend!"}) | 
| /notes/:id | PUT | Update the note specified id with the content of the JSON param (e.g send  {"content": "Goodbye friend!"} to /notes/123) | 
| /notes/:id | DELETE | Delete the note with specific ID  (e.g /notes/123) | 


