#!/bin/sh

echo "Delay 15s waiting for MinIO to be ready..."
sleep 15
echo "Configuring MinIO client..."
mc alias set myminio "$MINIO_ALIAS_URL" "$MINIO_ROOT_USER" "$MINIO_ROOT_PASSWORD"

echo "Creating bucket 'ris-bucket'..."
mc mb myminio/ris-bucket || true

echo "Setting bucket policy to public read..."
mc anonymous set download myminio/ris-bucket

echo "Setup complete!"
