


# Curl Commands

curl -X GET -G "http://localhost:3000" -d "hostid=$hostid"


#curl -X GET -G "http://localhost:3000/msg" -d "hostid=$hostid" -d "buffer='echo hello world'"

curl -X GET -G "http://localhost:3000/msg" -d host="$hostid" --data-urlencode buffer="ls -la"
curl -X GET -G "http://localhost:3000/msg" -d host="$hostid" --data-urlencode buffer="interval=10"