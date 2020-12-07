#!/bin/bash
clear
PROGRAM_NAME=hello_rust
docker image build -t $PROGRAM_NAME .
docker container run -it --rm $PROGRAM_NAME
