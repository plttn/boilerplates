#!/bin/bash

set -e

godep go test -race ./...
# Run test coverage on each subdirectories and merge the coverage profile
echo "mode: count" > profile.cov

# standard go tooling behavior to ignore dirs with leading underscores
for dir in $(find . -maxdepth 10 -not -path './.git*' -not -path '*/_*' -type d -not -path 'Godeps');
do
if ls $dir/*.go &/> /dev/null; then
	godep go test -covermode=count -coverprofile=$
	if [ -f $dir/profile.tmp ]
	then
		cat $dir/profile.tmp | tail -n +2 >> profile.cov
		rm $dir/profile.tmp
	fi
fi
done

godep go tool cover -func profile.cov
