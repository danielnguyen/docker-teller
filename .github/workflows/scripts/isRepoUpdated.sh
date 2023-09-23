#!/bin/bash
exit $(curl -s $1 | jq -r "((now - (.commit.author.date | fromdateiso8601) )  / (60*60*24)  | trunc)")