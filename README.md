# SSE-EOS

### What is EOS?
EOS is the SSE's deployment strategy for our web services, it's simple a collection of scripts responsible for deploying and building the webpage. Which can be used for both local dev or production deployment.

#### The parts
EOS it's self is light, it mainly relies on docker, and a few bash util scrips. run-bootstrap.sh clones down everything needed to make the dev compose files usable. All the other repos will be build automatically by docker hub, so the prod compose file can be used without cloning everything.

#### Getting Started Locally
```bash
git clone https://github.com/7imbrook/sse-eos.git && cd sse-eos

# This will clone all needed repos to build all of the site
./scripts/bootstrap-dev.sh

# use the dev compose file to build everything from source (warning can take up to 40 mins)
docker-compose -f docker-compose.dev.yml up
```

##### bootstrap-dev.sh
Options
- [none]: does the initial pull
- [update]: does git pull
- [run <args>]: runs args in all sub projects

### Background
Are you really confused at this point? You probably have a few questions. You're gonna need a few things to get started with EOS, one is [docker toolbox](https://www.docker.com/products/docker-toolbox). Docker is magical and this isn't the place to learn about that ecosystem, they have great documentation and tutorials for that.

Anything else you have questions on PLEASE open a git issue and we'll get it answered and back into the docs somewhere.
