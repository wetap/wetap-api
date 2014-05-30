S3_CREDENTIALS = {
  access_key_id: ENV['AWS_ACCESS_KEY_ID'] || 'fake-access-key-id',
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] || 'fake-secret-access-key',
  bucket: ENV['AWS_S3_BUCKET'] || 'fake-aws-s3-bucket'
}
