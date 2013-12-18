housesimulator
==============
To run the app, we need to have ruby 2.0.0 with the gem bundler installed, this can be achieved with http://gorails.com/setup/ubuntu/13.10 or any other tutorial. We also need to have postgreSQL installed.

After setting up the environment, we can now run the app
First, install all gems by running the command:
bundle install

We need to add an user for the postgres user, and set its password to simulator, with the command, password will be asked:
sudo -u postgres createuser -d -R -P simulator

Then we need to create the database, by running the following command:
rake db:create

Then we need to create the tables and populate the database, with the commands:
rake db:schema:load
rake db:seed

Now we can start the server by running:
rails s


