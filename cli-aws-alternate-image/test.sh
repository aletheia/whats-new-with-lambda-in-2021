cp ../app/* .

docker build -t hello-world:latest .
docker run -d -p 9000:8080  hello-world:latest
sleep 1
curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'

