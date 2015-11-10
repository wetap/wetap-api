WeTap API
=========

A json API to waterfountain data.


Example Usage
-------------


Get Fountain
------------

### Parameters

**public_token** To get your public token, request an api key from info@wetap.org.
**bbox** bounding latitude and longitude of your query &lt;east&gt;,&lt;north&gt;,&lt;west&gt;

Returns all fountains (up to 50) within the specified bounding box.

Example Usage (fountains near Downtown Los Angeles)

    GET /api/v1/water_fountains.json?public_token=XXXXXXXXXXX&bbox=-118.27528953552245,34.02456524266325,-118.22456359863281,34.06723627618082

Example Response (truncated for brevity)

    [
      {
        "id":127105,
        "created_at":"2015-10-07T19:34:50.772Z",
        "updated_at":"2015-10-07T19:34:50.772Z",
        "location":{
          "type":"Point",
          "coordinates":[
            -118.2384244619418,
            34.05724804042726
          ]
        },
        "user_id":2,
        "user_name":"change@me.com",
        "working":true,
        "filling_station":false,
        "dog_bowl":false,
        "flow":"good",
        "url":"http://wetap.herokuapp.com/api/v1/water_fountains/127105.json",
        "image_url":"http://wetap-production-images.s3.amazonaws.com/water_fountains/images/000/127/105/thumb/73914fed-811a-4a84-b9f5-bec92c5d4b3c.jpg?1444246481"
      },
      {
        "id":73948,
        "created_at":"2015-07-10T20:00:56.856Z",
        "updated_at":"2015-07-10T20:00:56.856Z",
        "location":{
          "type":"Point",
          "coordinates":[
            -118.23861,
            34.049297
          ]
        },
        "user_id":null,
        "user_name":"unknown",
        "working":null,
        "filling_station":null,
        "dog_bowl":null,
        "flow":null,
        "url":"http://wetap.herokuapp.com/api/v1/water_fountains/73948.json",
        "image_url":null
      }
    ]

**Note:** Some response fields are optional. `user_id`, `working`,
`filling_station`, `dog_bowl`, `flow`, and `image_url` may be null.


Development
===========

## CI

To restart a failed Jenkins CI job for a PR, make a comment on GitHub that contains:

```
retest this please
```

The regex is `.*test\W+this\W+please.*`

* http://ci.endoftheworl.de:8080/job/WeTap-API-develop/
* http://ci.endoftheworl.de:8080/job/WeTap-API-develop-pr/
* http://ci.endoftheworl.de:8080/job/WeTap-API-master/

- [x] on new commits to master ==> WeTap-API-master
- [x] on new commits to develop ==> WeTap-API-develop
     - [ ] trigger WeTap-iOS
- [x] on PR against develop ==> WeTap-API-develop-pr (merged into 'develop')

### Dependencies

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

We depend on some environment variables that you'll need to set for a fully functioning app.

    (localhost)➜ cp .env-template .env
    (localhost)➜ vim .env #fill in appropriately.

If it passes, start the server

    (localhost)➜ vagrant ssh
    (vagranthost)➜ cd /vagrant
    (vagranthost)➜ bundle exec foreman start

Verify that you're good to go!

    # There are no water fountains by default, so you should see an
    # empty JSON list.
    (localhost)➜ curl localhost:4000/api/v1/water_fountains.json
    []

Start Server for Local Calabash iOS Testing
==========

```
$ vagrant up
$ vagrant ssh
$ cd /vagrant
$ RAILS_ENV=test bundle exec rake db:test:prepare db:seed
$ RAILS_ENV=test bundle exec rails server
```

If you encounter problems standing up the server locally, do the following:

```
$ script/vbox-powerdown
```

and in Activity Monitor, search for VBox and kill all active processes.
