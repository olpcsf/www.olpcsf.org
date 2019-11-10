
# www.olpcsf.org

_This is a work in progress._

The website of olpc-sf.

## Development

### Requirements

- [Ruby](https://www.ruby-lang.org/en/) 2.6
- [Bundler](https://bundler.io)


### Setup

Install the Ruby dependencies.

    $ bundle install

Build the Jekyll site.

    $ bundle exec jekyll build

Serve the site locally.

    $ bundle exec jekyll serve

Open your web browser to [localhost:4000/www.olpcsf.org](http://localhost:4000/www.olpcsf.org/).


## Drupal 7 import

Content can be imported from drupal 7.

First, copy the `env.sample` to `.env` and configure your MySQL database
settings. These are found in your Drupal site's settings.php.

    $ cp env.sample .env

Once you have your settings in `.env`, source the environment.

    $ source .env

Run the import script.

    $ ./bin/import.sh

Content is saved to the `src` directory.
