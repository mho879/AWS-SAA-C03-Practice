# import dependencies
require 'aws-sdk-s3'
require 'pry'
require 'securerandom'
require 'dotenv'

# load .env file with specific path
Dotenv.load('../../../.env')

# load aws credentials from dotenv
aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
aws_region = ENV['AWS_DEFAULT_REGION']
bucket_name = ENV['BUCKET_NAME']

puts bucket_name

# apply aws credentials
client = Aws::S3::Client.new(
  access_key_id: aws_access_key_id,
  secret_access_key: aws_secret_access_key,
  region: aws_region
)

# Create S3 Bucket
resp = client.create_bucket({
    bucket: bucket_name,
    create_bucket_configuration: {
        location_constraint: aws_region
    }
})
# Debugging option
# binding.pry

# Determine the number of files to create and upload
number_of_files = 1 + rand(10)
puts "number_of_files: #{number_of_files}"

# Loop to create and upload each file
number_of_files.times.each do |i|
    puts "i: #{i}"
    filename = "file_#{i}.txt"
    output_path = "/tmp/#{filename}"

    # Write a iunique UUID to each file
    File.open(output_path, "w") do |file|
        file.write SecureRandom.uuid
    end

    # Open and read file in binary mode, then upload it to S3
    File.open(output_path, 'rb') do |file|
        client.put_object(
            bucket: bucket_name,
            key: filename,
            body: file
        )
    end
end
