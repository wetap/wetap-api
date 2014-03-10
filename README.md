WeTap API
=========

A json API to waterfountain data.


Installing
==========

Clone the repo

    ➜ git clone git@github.com:svevang/wetap-api.git

We use [Vagrant](https://www.vagrantup.com/) to provision our development environment. 
Make sure you are running at least Vagrant 1.5

    (localhost)➜ vagrant --version
    Vagrant 1.5.0
    (localhost)➜ vagrant up
    Bringing machine 'default' up with 'virtualbox' provider...
    ==> default: Box 'bdon/geo' could not be found. Attempting to find and install...
        default: Box Provider: virtualbox
        default: Box Version: >= 0
    ...

Get yourself a cup of coffee while your machine downloads and builds -
it should take 5-10 minutes.


Install Ruby and Gems

    (localhost)➜ vagrant ssh
    (vagranthost)➜ cd /vagrant
    (vagranthost)➜ rbenv install
    (vagranthost)➜ gem install bundler
    (vagranthost)➜ bundle

Create the database and run the server

    (vagranthost)➜ bundle exec rake db:setup
    (vagranthost)➜ bundle exec rails s

Verify that you're good to go!

    (localhost)➜ curl localhost:4000/water_fountains
    {
      water_fountains: [
        {
          id: 1234,
          lat: 1.23,
          lon: 3.45
        }
      ]
    }

