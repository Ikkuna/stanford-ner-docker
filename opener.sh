#!/bin/bash

function argv {
    for a in ${BASH_ARGV[*]} ; do
      echo -n "$a "
	$a
    done
    echo
}

function start {
	/bin/sh -c 'docker run -p 172.17.42.1:9000:9000 -i ikkuna:opener language-identifier-server -p 9000' &
	/bin/sh -c 'docker run -p 172.17.42.1:9001:9001 -i ikkuna:opener tokenizer-server -p 9001' &
	/bin/sh -c 'docker run -p 172.17.42.1:9002:9002 -i ikkuna:opener pos-tagger-server -p 9002' &
	/bin/sh -c 'docker run -p 172.17.42.1:9003:9003 -i ikkuna:opener constituent-parser-server -p 9003' &
	/bin/sh -c 'docker run -p 172.17.42.1:9004:9004 -ti ikkuna:opener ner-server -p 9004' &
	/bin/sh -c 'docker run -p 172.17.42.1:9005:9005 -ti ikkuna:opener ned-server -p 9005' &
	/bin/sh -c 'docker run -p 172.17.42.1:9006:9006 -ti ikkuna:opener coreference-server -p 9006' &
	/bin/sh -c 'docker run -p 172.17.42.1:9007:9007 -ti ikkuna:opener kaf2json-server -p 9007' &
}

function build {
	docker build -t ikkuna:opener .
}

function stop {
	docker ps -a | awk '$2~/ikkuna:opener/ {print $1}' |xargs -r docker stop
}

function remove {
	docker ps -a | awk '$2~/ikkuna:opener/ {print $1}' |xargs -r docker rm
}

function restart {
	stop
	remove
	start
}

argv
