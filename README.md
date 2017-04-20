![/resources/EOS.gif](/resources/EOS.gif)
### What is EOS?
A collection of all our docker-compose files for all the parts of the sse webpage. And the documentation around bootstraping it.

### Background
Are you really confused at this point? You probably have a few questions. You're gonna need a few things to get started with EOS, one is [docker toolbox](https://www.docker.com/products/docker-toolbox). Docker is magical and this isn't the place to learn about that ecosystem, they have great documentation and tutorials for that.

Anything else you have questions on PLEASE open a git issue and we'll get it answered and back into the docs somewhere.

### PEMDAS (Order of Operations)
1. Run the `bootstrap_swarm.sh` script, this is where any global are defined that are used in cross app things. Note that you'll need to specify a data node in your cluster. Add the label db=true to a SINGLE node.
2. Start up the loadbalancer and edge gateway (Traefik). Run `./deploy` in that directory.
3. From here you can start any service you'd like.
    * SSEPROD: `HOST=sseprod.se.rit.edu ./deploy` running this will also prompt you for any secrets that aren't created. Have those on hand (details in their respective repo)
    * allendoesphysic: `HOST=allendoesphysics.com ./deploy` is enough


#### Notes
If running locally, you will want to updated the `traefik.frontend.rule=Host:...` label on the service to be able to access them from localhost. or a localhost host record.
Setting HOST environment var will override this
