# Sweater Weather: A Turing 2110 BE Mod 3 Project

![languages](https://img.shields.io/github/languages/top/Turing-MarketMap/market-map-fe?color=red)
![PRs](https://img.shields.io/github/issues-pr-closed/kevingloss/sweater_weather_api)
![rspec](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![simplecov](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov) <!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/contributors-1-orange.svg?style=flat)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

## Background & Description:

'Sweater Weather' is a solo project built over the course of 5 days in Turing's module 3 backend program. The application is meant to return weather data and route info for given start and end locations. This project is set up as a Service Oriented Architecture (SOA) and caters to the needs of a fictitious front end team. The app consumes several external API's and then exposes the needed data as JSON for the front end team.

## Features
- Consume external API's including: 
  - [MapQuest](https://developer.mapquest.com/documentation/) 
  - [Flickr](https://www.flickr.com/services/api/)
  - [OpenWeather](https://openweathermap.org/api/one-call-api#current)
- Create Internal Endpoints to:
  -  Get the weather forecast for a city
  -  Get a background image to a city
  -  Allow a user to register
  -  Allow a user to sign in
  -  Allow a user to create a road trip
- Built to conform with SOA

## Requirements and Setup (for Mac):
### Ruby and Rails
- Ruby -V 2.7.2
- Rails -V 5.2.6

### Gems Utilized
- rspec
- pry
- shoulda-matchers
- simplecov
- webmock
- vcr
- jsonapi-serializer
- email-validator
- faraday
- figaro

### Setup
1. Fork and/or Clone this Repo from GitHub.
2. In your terminal use `$ git clone <ssh or https path>`
3. Change into the cloned directory using `$ cd sweater_weather_api`
4. Install the gem packages using `$ bundle install`
5. Database Migrations can be setup by running:
```shell
$ rails rake db:{create,migrate}
```
6. Startup and Access require the server to be running locally and a web browser opened.
  - Start Server
```shell
$ rails s
```
 - Open Web Browser and visit http://localhost:3000/
   - Please visit below endpoints to see JSON data being exposed

## Testing
 - Test using the terminal utilizing RSpec
 ```shell
 $ rspec spec/<follow directory path to test specific files>
 ```
   or test the whole suite with `$ rspec`
 - Testing can also be performed by entering the url and request body to Postman while the server is running.

## Endpoints
### Landing Page
- Retrieve weather for a city
- Example Request:
```shell
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
```
- Example Response: 
```shell
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2022-03-08 16:06:26 -0700",
                "sunrise": "2022-03-08 06:22:28 -0700",
                "sunset": "2022-03-08 17:59:10 -0700",
                "temperature": 38.91,
                "feels_like": 38.91,
                "humidity": 27,
                "uvi": 0.67,
                "visibility": 10000,
                "conditions": "clear sky",
                "icon": "01d"
            },
            "daily_weather": [
                {
                    "date": "2022-03-08",
                    "sunrise": "2022-03-08 06:22:28 -0700",
                    "sunset": "2022-03-08 17:59:10 -0700",
                    "max_temp": 38.91,
                    "min_temp": 20.25,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                etc...
            ],
            "hourly_weather": [
                {
                    "time": "16:00:00",
                    "temperature": 38.91,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                etc...
            ]
        }
    }
}
```
### Retrieve background image for a city
- Example Request:
```shell
GET /api/v1/backgrounds?location=denver,co
Content-Type: application/json
Accept: application/json
```
- Example Response: 
```shell
{
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "image": {
                "location": "denver,co",
                "image_url": "https://live.staticflickr.com/65535/51806988903_f7d213e696.jpg"
            },
            "credit": {
                "author": "ID: 182882235@N04",
                "source": "flickr.com"
            }
        }
    }
}
```
### User Registration
- Create a new user
- Example Request:
```shell
POST /api/v1/users
Content-Type: application/json
Accept: application/json
# pass below information inside body of request
{
  "email": "jsonmaster@gmail.com",
  "password": "password",
  "password_confirmation": "password"
}
```
- Example Response: 
```shell
{
    "data": {
        "id": "5",
        "type": "users",
        "attributes": {
            "email": "jsonmaster@gmail.com",
            "api_key": "8492c140b07a0591b70367f43d96da4e"
        }
    }
}
```
### User Login
- Login as a registered user
- Example Request:
```shell
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json
# pass below information inside body of request
{
  "email": "jsonmaster@gmail.com",
  "password": "password"
}
```
- Example Response: 
```shell
{
    "data": {
        "id": "5",
        "type": "users",
        "attributes": {
            "email": "jsonmaster@gmail.com",
            "api_key": "8492c140b07a0591b70367f43d96da4e"
        }
    }
}
```
### Road Trip
- Create a road trip with a valid key
- Example Request:
```shell
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Denver,CO",
  "destination": "Boston,MA",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```
- Example Response: 
```shell
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "Boston,MA",
            "travel_time": "Trip duration is 30 hours and 33 minutes.",
            "weather_at_eta": {
                "temperature": 33.42,
                "conditions": "overcast clouds"
            }
        }
    }
}
```
## Further Project Information
- [Turing Sweater Weather Overview](https://backend.turing.edu/module3/projects/sweater_weather/)
- [Turing Sweater Weather Requirements](https://backend.turing.edu/module3/projects/sweater_weather/requirements)

## **Contributors** ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/kevingloss"><img src="https://avatars.githubusercontent.com/u/83426676?s=96&v=4" width="100px;" alt=""/><br /><sub><b>Kevin (he/him)</b></sub></a><br /><a href="https://github.com/kevingloss/sweater_weather_api/commits?author=kevingloss" title="Code">💻</a> <a href="#ideas-kevingloss" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/kevingloss/sweater_weather_api/commits?author=kevingloss" title="Tests">⚠️</a> <a href="https://github.com/kevingloss/sweater_weather_api/pulls?q=is%3Apr+reviewed-by%3Ajkevingloss" title="Reviewed Pull Requests">👀</a></td>

  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification.
<!--
