if Rails.env.test?
  # So that tests pass when ENV isn't set on ci
  S3_CREDENTIALS = {
    access_key_id: 'fake-access-key-id', 
    secret_access_key: 'fake-secret-access-key',
    bucket: 'fake-aws-s3-bucket'
  }
else
  S3_CREDENTIALS = {
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    bucket: ENV['AWS_S3_BUCKET']
  }
end
