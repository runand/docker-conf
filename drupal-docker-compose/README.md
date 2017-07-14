# HOWTO Guide

## Dependencies
* docker
* docker-compose
* realpath (linux users: smile, osx users: brew tap iveney/mocha; brew install realpath)

## Setup this project

    Git clone this project to your prefered workspace
    
    Add the init-docker to your path.

    export PATH={path/to/drupal-docker-compose}/bin:$PATH
    
    Add ddrush alias
    
    alias ddrush="docker-compose run --rm drush"

## Run the project

    cd path/to/project
    
    Run "init-docker" to initialise the docker setup.
    
    Edit ./docker-sync.yml and replace [your-site] with your project name.
    
    Use: "docker-sync-stack start" to run docker



## Up and running
When dependencies have been installed run following:

    docker-compose create

## Commands
When images have been build you can use following commands:

### Start
To spin up apache/php/memcache/solr setup:

    docker-start-checkout

### Stop
To shutdown containers again:

    docker-stop-checkout

## For Drupal 8
Setup a symlink from your webroot folder to html.

    Copy docker-compose-d8.yml to your project root.

    Rename to docker-compose.yml

    ln -s ./web html

    Run: docker-compose up

#### Docker for Mac
Running Docker on OSX seems very slow.
Some of the reason could be the shared file system has some issues.
To speed it up a bit you can install docker-sync.
Note that this project is using Unison for syncing currently.
Follow the Wiki on: https://github.com/EugenMayer/docker-sync

Note that this need Ruby to be v2.1.0+
To upgrate Ruby follow the guide here: https://shellzero.wordpress.com/tag/how-to-update-ruby-2-0-to-the-latest-version-on-mac-os-x-yosemite/

To use it:

    Copy docker-compose-dev-d8.yml to your project root.

    Rename to docker-compose-dev.yml

    Copy docker-sync-d8.yml to your project root.

    Rename to docker-sync.yml

    Run: docker-sync-stack start

**Important**
It is very important that following is changed to prevent docker to sync projects together.

In docker-compose-dev.yml and docker-sync.yml replace all occurences of [your-site] with a unique string to this site.

## Initializing a fresh DB instance

When a container is started for the first time, a new database with the specified name will be created and initialized with the provided configuration variables.
Furthermore, it will execute files with extensions .sh, .sql and .sql.gz that are found in /docker-entrypoint-initdb.d. Files will be executed in alphabetical order.
You can easily populate your mysql services by mounting a SQL dump into that directory and provide custom images with contributed data.