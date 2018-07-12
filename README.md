![/resources/EOS.gif](/resources/EOS.gif)

### What is EOS?

A collection of all our docker-compose files for all the parts of the SSE tech stack. And the documentation around bootstraping it.

### Background

Are you really confused at this point? You probably have a few questions. You're gonna need a few things to get started with EOS, one is [docker toolbox](https://www.docker.com/products/docker-toolbox). Docker is magical and this isn't the place to learn about that ecosystem, they have great documentation and tutorials for that.

Anything else you have questions on PLEASE open a [GitHub Issue](https://github.com/rit-sse/sse-eos/issues) and we'll get it answered and back into the docs somewhere.

### Architecture

Docker, Docker Swarm, Traefik, Node, PostgreSQL. Coming Soon.

### Deploying to Production

When deploying, you'll want the various secrets for each app readily available. If a particular secret hasn't already been created, you'll be prompted to enter it.

Run the `bootstrap_swarm.sh` script to deploy / update all services at once.

To run a particular app, `cd` into its directory and run `./deploy`.

See the `./deploy` files for how to update a particular service of a particular app.

You can override any host by setting the `HOST` environment variable. (eg. `HOST=example.com ./deploy`)

### Deploying to Development

Coming Soon.

### Maintenance

Need to back up the prod Postgres database? Run `backup_prod.sh`.
