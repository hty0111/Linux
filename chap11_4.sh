#!/bin/bash

# environmental variable & redirect
today=$(date +%y%m%d)
ls /usr/bin -al > log.$today
