# Dwell

This is a Ruby on Rails API back end for Dwell, an application that allows users to book an hour-long workspace for productivity at any WiFi cafe in Manhattan.

**This API has been deployed to Heroku and can be found _[here](https://dwell-api.herokuapp.com/api/v1/workspaces)_.**

The front end code, build in React and Redux, as well as a link to the working demo can be found at [this](https://github.com/laurkim/DwellFrontEnd) repository.

The database is built on PostgreSQL. The domain for this application is comprised of Authorization (for authorization and authentication to prohibit viewing of other user's information), Users, Bookings, Workspaces, and Favorites.

The user's interactions with the React/Redux front end application will trigger specific controller actions, depending on the HTTP verb including in the API calls from the client-side.

Active Model Serializers have been implemented to limit the data included in the response to the Javascript front end.
