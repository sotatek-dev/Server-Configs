FROM minio/minio:RELEASE.2025-07-23T15-54-02Z

COPY setup /setup
RUN chmod +x /setup/setup-minio.sh

# Entrypoint: run MinIO server and setup script in background
ENTRYPOINT ["/bin/sh", "-c", "/setup/setup-minio.sh & exec minio server /data --console-address :9001"]