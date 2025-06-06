docker network create mongoCluster

docker run -d --rm -p 27017:27017 --name mongo1 --network mongoCluster mongo:5 mongod --replSet myReplicaSet --bind_ip localhost,mongo1
docker run -d --rm -p 27018:27017 --name mongo2 --network mongoCluster mongo:5 mongod --replSet myReplicaSet --bind_ip localhost,mongo2
docker run -d --rm -p 27019:27017 --name mongo3 --network mongoCluster mongo:5 mongod --replSet myReplicaSet --bind_ip localhost,mongo3

docker exec -it mongo1 mongosh --eval "rs.initiate({     
 _id: \"myReplicaSet\",
 members: [
   {_id: 0, host: \"mongo1\"},
   {_id: 1, host: \"mongo2\"},
   {_id: 2, host: \"mongo3\"}
 ]
})"

# docker exec -it mongo1 mongsh -eval "rs.reconfig({ _id: "myReplicaSet",
#   members: [ { _id: 0, host: "localhost:27017" }, { _id: 1, host: "localhost:27018" }, { _id: 2, host: "localhost:27019" }] }, { force: true })"

# {
#   ok: 1,
#   '$clusterTime': {
#     clusterTime: Timestamp({ t: 1745907989, i: 1 }),
#     signature: {
#       hash: Binary.createFromBase64('AAAAAAAAAAAAAAAAAAAAAAAAAAA=', 0),
#       keyId: Long('0')
#     }
#   },
#   operationTime: Timestamp({ t: 1745907989, i: 1 })
# }"
