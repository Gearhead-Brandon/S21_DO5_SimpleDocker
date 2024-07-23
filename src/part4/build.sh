#!/bin/bash

sudo docker build -t img .

sudo docker run -d -p 80:81 --name mac img


