#!/bin/sh

docker build . -t 10.12.107.150:80/public/monitor-server:20220216-dev
docker push 10.12.107.150:80/public/monitor-server:20220216-dev
docker rmi 10.12.107.150:80/public/monitor-server:20220216-dev

kubectl set image deployment/monitor-server monitor-server=10.12.107.150:80/public/monitor-server:20220216-dev -n gaussdb-monitoring
kubectl rollout restart deployment/monitor-server -n gaussdb-monitoring
kubectl rollout status deployment/monitor-server -n gaussdb-monitoring
