# Solution

### Part I

1. Run the container image `infracloudio/csvserver:latest` in background and check if it's running.

```bash
# Start docker container in background
docker run -d --name csvserver infracloudio/csvserver

# Check container status
docker ps
```

2. If it's failing then try to find the reason, once you find the reason, move to the next step.

```bash
# Check all containers
docker ps -a

# Check container logs
docker logs csvserver
```

3. Write a bash script `gencsv.sh` to generate a file named `inputFile`

```bash
# move to solution directory
cd solution

# run the following script to generate inputFile
./gencsv.sh
```

4. Run the container again in the background with file from (3) available inside the container (remember the reason you found in (2)).

```bash
# remove the old container
docker rm csvserver

# start new container with inputFile
docker run -d --name csvserver \
  -v ${PWD}/inputFile:/csvserver/inputdata \
  infracloudio/csvserver
```

5. Get shell access to the container and find the port on which the application is listening. Once done, stop / delete the running container.

```bash
# Get inside container
docker exec -it csvserver bash

# check all tcp and udp ports are active with PID/Program name 
netstat -tulpn

# stop container
docker rm -f csvserver
```

6. The application should be accessible at http://localhost:9393, it should have the 10 entries from inuptFile and the welcome note should have an orange color border.

```bash
# start the container with new parameters
docker run -d --name csvserver \
  -v ${PWD}/inputFile:/csvserver/inputdata \
  -p 9393:9300 -e CSVSERVER_BORDER=Orange \
  infracloudio/csvserver
```
