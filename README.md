Run mongo DBs with replSet command.

```bash
sudo docker run -d --name mongo1 -p 1111:27017 vfarcic/mongo --replSet rs0
sudo docker run -d --name mongo2 -p 2222:27017 vfarcic/mongo --replSet rs0
sudo docker run -d --name mongo3 -p 3333:27017 vfarcic/mongo --replSet rs0
```

Wait until MongoDB is up and running. That can be seen by monitoring logs. When "waiting for connections on port 27017" is output, DB is ready.

```bash
sudo docker logs -f mongo1
sudo docker logs -f mongo2
sudo docker logs -f mongo3
```

In one of the instances, run following (change IPs to those of your host):

```bash
sudo docker exec mongo1 su - mongodb -c '/set_replica.sh 10.0.42.1:1111 10.0.42.1:2222 10.0.42.1:3333'
```

This will set replica with first host as primary, second and secondary and the third one ar arbiter.