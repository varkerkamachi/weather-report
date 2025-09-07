# README

This README documents the necessary steps to get the application up and running, as well as it's usage, known limitations and future roadap. Enjoy!

## Getting started
To set up this project and run it locally, you'll need the following installed

### Prerequisites
Ruby version 3.2.2
Rails version 8.0.2.1
rvm version 1.29.12

### Installation
1. Install the necessary ruby, using rvm or direct download from [rubylang:] (https://www.ruby-lang.org/en/downloads/)
```sh
    rvm install 3.2.2 
    rvm use 3.2.2
```
2. Create a `weather-report` gemset
```sh
    rvm gemset create weather-report
    rvm use 3.2.2@weather-report
```

3. Install rails
```sh
    gem install rails -N
```

4. Clone this repo into a local directory

5. bundle install
```sh
    bundle install
```

6. The weather service being used is from weatherapi.com. You can find the docs [here:] (https://app.swaggerhub.com/apis-docs/WeatherAPI.com/WeatherAPI/1.0.2#/APIs/forecast-weather)

I created an API key and embedded it in the constants.rb file, so no additional setup should be needed to use the application. If you wish, you may create your own API key and replace the value of `KEY_WEATHER_API_ACCESS_KEY` in `config > initializers > constants.rb`.

7. No database is used in the current version of the application.

8. Running `rails s` should bring up the UI at `localhost:3000` 


## Usage
You can use the search form input at the root url to input either a city and state, or a zip code, to retrieve the current weather and 5-day extended forecast for that location.

### Testing
To run the test suite, simply run `rspec spec`. 

## Roadmap
Not all aspects of this application were fully fleshed out, as it is a POC done under limited time constraints. To more fully round out the application, a number of aspects can be enhanced and/or improved. 

1. Functionality. Some functionality currently not in the users' control is:
    * the toggle/selection of air quality index setting
    * the selection of extended forecast settings - whether enabled or not, and the number of days

2. Additional validation and error handling. 
    * Currently, this service's API supports a maximum of 8 days for the extended forecast, and although it will not return more, there is no validation in the application to limit the value of the user's selection. 
    * There are zip codes which return no data, and this error handling is not fully operational as of now.

3. UX. Additional improvements to the UX could include:
    * addition of a clear functionality, or other way to better make the reuse of the form clearer for the user, rather than a full page refresh
    * a preloader to display when the API fetch is in progress

4. Database support. To support caching and reusable queries, customized dashboards or other features, I'd add postgres support for storage/retrieval of data.

5. DRYing up the code and reusability. Some examples here include:
    * Adding reusable helpers for rendering error and success responses
    * Refactors to CSS to make it more reusable, and the introduction of SCSS or SASS, Tailwind, or other library

6. Test coverage. Additional tests to cover more edge cases across all layers of the application would be beneficial



