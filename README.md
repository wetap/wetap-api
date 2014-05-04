WeTap API
=========

A json API to waterfountain data.

CI
=========

* http://ljs-jenkins.ngrok.com/job/WeTap-API/
* http://ljs-jenkins.ngrok.com/job/WeTap-API-Pull-Requests/

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
    ==> default: Box 'michaelkirk/wetap-api' could not be found. Attempting to find and install...
        default: Box Provider: virtualbox
        default: Box Version: >= 0
    ...

Get yourself a cup of coffee while your machine downloads and builds -
it should take 5-10 minutes.


The app may have changed since the last box snapshot was taken. Make
sure all gems are installed and the latest database migrations have been
run.

    (localhost)➜ vagrant ssh
    (vagranthost)➜ cd /vagrant
    (vagranthost)➜ bundle
    (vagranthost)➜ bundle exec rake db:migrate

Make sure everything looks good on the virtual machine by preparing and
running the test suite

    (vagranthost)➜ bundle exec rake db:test:prepare
    (vagranthost)➜ bundle exec rspec spec

If it passes, start the server

    (vagranthost)➜ bundle exec rails server


Verify that you're good to go!

    # There are no water fountains by default, so you should see an
    # empty JSON list.
    (localhost)➜ curl localhost:4000/water_fountains.json
    []

  
