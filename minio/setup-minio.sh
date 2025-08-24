#!/bin/sh
set -e

echo "Delay 15s waiting for MinIO to be ready..."
sleep 15

echo "Configuring MinIO client..."
mc alias set myminio http://minio:9000 minio 123@1234

echo "Creating bucket 'ris-bucket'..."
mc mb myminio/ris-bucket || true

echo "Setting bucket policy to public read..."
mc anonymous set download myminio/ris-bucket

echo "Setup complete!"
