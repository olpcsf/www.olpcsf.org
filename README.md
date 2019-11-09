
# www.olpcsf.org


## Drupal 7 import

Content can be imported from drupal 7.

First, copy the `env.sample` to `.env` and configure your MySQL database
settings. These are found in your Drupal site's settings.php.

    $ cp env.sample .env

Once you have your settings in `.env`, source the environment.

    $ source .env

Open an SSH tunnel to the MySQL database.

    $ ssh -L 3306:localhost:3306 www.olpcsf.org

Run the import script.

    $ ./bin/import.sh

Content is saved to the `src` directory.
