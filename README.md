WeTap API
=========

A json API to waterfountain data.

CI
=========

* http://ljs-jenkins.ngrok.com/job/WeTap-API/ 
    - on commits to master
* http://ljs-jenkins.ngrok.com/job/WeTap-API-Pull-Requests/ 
    - new pull-requests and new commits to existing pull requests

Dependencies
------------

You must have vagrant and ansible installed in order to run ci
    
    brew install ansible

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
sure to reprovision the box to install any missing packages, update your
ruby environment, etc.

    (localhost)➜ vagrant provision

Make sure everything is cool by running the tests

    (localhost)➜ script/ci

If it passes, start the server

    (localhost)➜ vagrant ssh
    (vagranthost)➜ cd /vagrant
    (vagranthost)➜ bundle exec rails server

Verify that you're good to go!

    # There are no water fountains by default, so you should see an
    # empty JSON list.
    (localhost)➜ curl localhost:4000/water_fountains.json
    []
