What the what
============

Where's this base image i don't see anything? Well that's because it's built with linuxkit! The docker.yml file here is the spec to build a bootable container based iso that runs docker. That we can have join as workers to the master. It's still quite primitive in terms of capabilities. Still need to manually run the join command. Working on that. Plus there's no volume support and I still need stress test the network. So it shouldn't be used to maintain data (yet maybe I'll add flocker support or something.

### Building
1. Install moby, see linuxkit or moby on github.
2. get a join token from a master in the swarm and put it in a script in the `<swarm token here>` inside the docker.yml
3. run `moby build docker`
4. look a wild .iso has appeared.
5. boot that somewhere (preferably in our datacenter)
6. in the console run `runc exec -t docker sh /etc/swarm/join.sh`
7. realize that magic happened.
