#!/bin/bash

git clone https://github.com/raspberrypi/picotool.git
mkdir picotool/build
cd picotool/build

cmake .. -G Ninja
ninja