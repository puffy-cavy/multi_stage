#!/usr/bin/env bash


export PATH=/usr/local/bin:$PATH

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#echo $DIR
STAGE=`basename $DIR`
export STAGE
aws cloudformation deploy --stack-name ${STAGE}-test-wendy --template-file scripts/cloudformation/${STAGE}/template.json --parameter-overrides "BucketNameParameter=${STAGE}-wendy32" --profile default