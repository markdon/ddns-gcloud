Requires Docker.

1. Create your domain in GCP DNS
2. Create a service account in GPC that has permission to update the relevant DNS entry. 
3. Download the service account's key.json file as `gcloud.key.json` in to this directory.
4. Create a `docker-compose.yaml` file based on `docker-compose.example.yaml` with the environment variables changed.
5. Run `docker compose up -d --build`.

Open an issue if you run in to a problem or need some help.