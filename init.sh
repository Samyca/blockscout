#!/bin/sh
echo "COPY ENVS FILES"
cp ./example.env ./.env

cp ./envs/example_common-blockscout.env ./envs/common-blockscout.env
cp ./envs/example_common-db.env ./envs/common-db.env
cp ./envs/example_common-frontend.env ./envs/common-frontend.env
cp ./envs/example_common-proxy.env ./envs/common-proxy.env
cp ./envs/example_common-smart-contract-verifier.env ./envs/common-smart-contract-verifier.env
cp ./envs/example_common-stats.env ./envs/common-stats.env
cp ./envs/example_common-user-ops-indexer.env ./envs/common-user-ops-indexer.env
cp ./envs/example_common-visualizer.env ./envs/common-visualizer.env

cp ./proxy/example_default.conf.template ./proxy/default.conf.template
cp ./proxy/example_microservices.conf.template ./proxy/microservices.conf.template

echo "COPY ENVS FILES END"
