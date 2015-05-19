#!/usr/bin/env bash

SERVER_1=$1
SERVER_2=$2
SERVER_3=$3

echo "rs.initiate({
  \"_id\" : \"rs0\",
  \"version\" : 1,
  \"members\" : [
    {
      \"_id\" : 0,
      \"host\" : \"$SERVER_1\",
      \"arbiterOnly\" : false,
      \"buildIndexes\" : true,
      \"hidden\" : false,
      \"priority\" : 1,
      \"tags\" : {},
      \"slaveDelay\" : 0,
      \"votes\" : 1
    },
    {
      \"_id\" : 1,
      \"host\" : \"$SERVER_2\",
      \"arbiterOnly\" : false,
      \"buildIndexes\" : true,
      \"hidden\" : false,
      \"priority\" : 1,
      \"tags\" : {},
      \"slaveDelay\" : 0,
      \"votes\" : 1
    },
    {
      \"_id\" : 2,
      \"host\" : \"$SERVER_3\",
      \"arbiterOnly\" : true,
      \"buildIndexes\" : true,
      \"hidden\" : false,
      \"priority\" : 1,
      \"tags\" : {},
      \"slaveDelay\" : 0,
      \"votes\" : 1
	}
  ],
  \"settings\" : {
    \"chainingAllowed\" : true,
    \"heartbeatTimeoutSecs\" : 10,
    \"getLastErrorModes\" : {},
    \"getLastErrorDefaults\" : {
      \"w\" : 1,
      \"wtimeout\" : 0
    }
  }
})" | mongo

sleep 10

echo "rs.status()" | mongo