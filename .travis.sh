#!/bin/bash

REVISION=$(git rev-parse --short HEAD)
BRANCH=$(git rev-parse --abbrev-ref HEAD)
REVISION=$(git rev-parse --short HEAD)
LAST_COMMIT_DATE=$(git log -1 --date=short --format="%cd")
TARGET_FILE=obj/cleanflight_${TARGET}
TRAVIS_REPO_SLUG=${TRAVIS_REPO_SLUG:=$USER/undefined}
BUILDNAME=${BUILDNAME:=travis}
TRAVIS_BUILD_NUMBER=${TRAVIS_BUILD_NUMBER:=undefined}

CURLBASEOPTS="--retry 10
	--retry-delay 10
	--retry-max-time 120
	--form \"revision=${REVISION}\"
	--form \"branch=${BRANCH}\"
	--form \"last_commit_date=${LAST_COMMIT_DATE}\"
	--form \"travis_build_number=${TRAVIS_BUILD_NUMBER}\"
	--form \"github_repo=${TRAVIS_REPO_SLUG}\"
	--form \"build_name=${BUILDNAME}\""

# A hacky way of running the unit tests at the same time as the normal builds.
if [ $RUNTESTS ] ; then
	cd ./src/test && make test

# A hacky way of building the docs at the same time as the normal builds.
elif [ $PUBLISHDOCS ] ; then
	if [ $PUBLISH_URL ] ; then

		sudo apt-get install zlib1g-dev libssl-dev wkhtmltopdf libxml2-dev libxslt-dev #ruby-rvm

		# Patch Gimli to fix underscores_inside_words
		curl -L https://github.com/walle/gimli/archive/v0.5.9.tar.gz | tar zxf -

		sed -i 's/).render(/, :no_intra_emphasis => true).render(/' gimli-0.5.9/ext/github_markup.rb

		cd gimli-0.5.9/
		gem build gimli.gemspec && rvmsudo gem install gimli
		cd ../

		./build_docs.sh

		curl -k ${CURLBASEOPTS} --form "manual=@docs/Manual.pdf" ${PUBLISH_URL} || true
	fi

elif [ $PUBLISHMETA ] ; then
	if [ $PUBLISH_URL ] ; then
		RECENT_COMMITS=$(git shortlog -n25)
		curl -k ${CURLBASEOPTS} --form "recent_commits=${RECENT_COMMITS}" ${PUBLISH_URL} || true
	fi

else
	if [ $PUBLISH_URL ] ; then
		make -j2
		if   [ -f ${TARGET_FILE}.bin ] ; then
			TARGET_FILE=${TARGET_FILE}.bin
		elif [ -f ${TARGET_FILE}.hex ] ; then
			TARGET_FILE=${TARGET_FILE}.hex
		else
			echo "build artifact (hex or bin) for ${TARGET_FILE} not found, aborting";
			exit 1
		fi

		curl -k ${CURLBASEOPTS} --form "file=@${TARGET_FILE}" ${PUBLISH_URL} || true
		exit 0;
	else
		make -j2
	fi
fi
