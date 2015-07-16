# Shore Sinatra Template
[![Build Status](https://travis-ci.org/shore-gmbh/sinatra-template.svg?branch=master)](https://travis-ci.org/shore-gmbh/sinatra-template)

## Usage

The easiest way to start the project is [`foreman`][1]. After you've installed
`foreman` on your system (i.e. `gem install foreman`), you can start the HTTP
server and all required background jobs with a single command:

```sh
$ foreman start -p 5000
```

[1]: https://github.com/ddollar/foreman

## Git Hooks (powered by [overcommit][1])

You have the run the following command after cloning this repository to activate
our Git Hooks:

```sh
$ bundle exec overcommit --install
```

This project uses two hooks:

1. `pre-push` -- it runs `rspec` before you push. Your push is rejected if one
   or more tests fail. Please fix all failing tests and try again.
2. `pre-commit` -- it runs `rubocop` to lint and style-check the entire
   codebase. Your commit is rejected if `rubocop` detected any offenses. Please
   fix all offenses and try again.

[1]: https://github.com/brigade/overcommit

## Configuration in Deployment Environments

This template expects the following environment variables:

 * `RACK_ENV` - one of `'edge'`, `'staging'`, or `'production'`.
 * `AIRBRAKE_API_KEY` - shared secret for [Airbrake][1].
 * `NEW_RELIC_LICENSE_KEY` - shared secret for [NewRelic RPM][2].
 * `NEW_RELIC_APP_NAME` - name of the application in the NewRelic Web UI.
 * `NEW_RELIC_LOG` - defines how the NewRelic Gem logs. Should always be set to
   `'stdout'` on Heroku.

[1]: https://airbrake.io
[2]: https://rpm.newrelic.com
