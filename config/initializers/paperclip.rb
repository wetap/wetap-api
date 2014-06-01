# If you try to serve images from aws.com/bucket-name, AWS redirects to the bucket-prefixed domain name.
Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'

