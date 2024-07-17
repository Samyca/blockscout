#!/bin/sh
echo "COPY ENVS FILES"
cp ./envs/example_common-blockscout.env ./envs/common-blockscout.env
cp ./envs/example_common-frontend.env ./envs/common-frontend.env
cp ./envs/example_common-smart-contract-verifier.env ./envs/common-smart-contract-verifier.env
cp ./envs/example_common-stats.env ./envs/common-stats.env
cp ./envs/example_common-user-ops-indexer.env ./envs/common-user-ops-indexer.env
cp ./envs/example_common-visualizer.env ./envs/common-visualizer.env
