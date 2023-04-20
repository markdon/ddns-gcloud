FROM google/cloud-sdk:alpine
WORKDIR /app/
COPY update.sh gcloud.key.json ./
CMD /app/update.sh