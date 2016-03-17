There's a need to specify the override file again on the machine, order matters.
docker-compose.override.yml is a file that only exists on the server.

```
docker-compose -f docker-compose.devlop.yml -f docker-compose.override.yml up -d
```

"this is currently just scratch. Will be cleaned up" ~Timbrook
