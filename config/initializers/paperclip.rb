Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:style/:filename'

Paperclip::Attachment.default_options[:s3_host_name] = "s3-#{ENV['AWS_REGION']}.amazonaws.com"
