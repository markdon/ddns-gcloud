#!/bin/bash

gcloud auth activate-service-account ddns00@md-id-au.iam.gserviceaccount.com --key-file=gcloud.key.json --project=$ZONE

while true
do
    EXISTING=`gcloud dns record-sets list --zone=$ZONE | grep $DOMAIN | awk '{print $4}'`
    echo "EXISTING: $EXISTING"

    NEW=`curl -s icanhazip.com`
    echo "NEW:$NEW"

    if [ "$EXISTING" != "$NEW" ]; then
        gcloud dns record-sets transaction start -z=$ZONE
        gcloud dns record-sets transaction remove -z=$ZONE \
            --name="$DOMAIN." \
            --type=A \
            --ttl=300 "$EXISTING"
        gcloud dns record-sets transaction add -z=$DOMAIN \
        --name="$DOMAIN." \
        --type=A \
        --ttl=300 "$NEW"
        gcloud dns record-sets transaction execute -z=$ZONE
    fi
    sleep 3600
done