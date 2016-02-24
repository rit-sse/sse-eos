# sse-eos

### What is EOS?
EOS is the SSE's deployment strategy for our web services, it's simple a collection of scripts responsible for deploying and building the webpage. Which can be used for both local dev or production deployment.

#### The parts
EOS it's self is light, it mainly relies on docker, and a few bash util scrips. run-bootstrap.sh clones down everything needed to make the dev compose files usable. All the other repos will be build automaticly by docker hub, so the prod compose file can be used without cloning everything.
