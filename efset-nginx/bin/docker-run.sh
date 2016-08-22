#!/bin/sh
shutdown(){
	nginx -s stop
}

trap shutdown HUP TERM ABRT ALRM KILL QUIT
nginx -g 'daemon off;'
