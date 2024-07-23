#!/bin/bash

sudo docker build -t img:new .

sudo docker run -d -p 80:81 --name mac img:new
