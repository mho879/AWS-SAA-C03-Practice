## Create a Bucket
```sh
aws s3 mb s3://encryption-fun-mho
```

## Create a file and put object with SS3-S3
```sh
touch hello.txt
aws s3 cp hello.txt s3://encryption-fun-mho
```

## Put object with encryption KMS
### https://us-west-2.console.aws.amazon.com/kms/home?region=us-west-2#/kms/defaultKeys
```sh
aws s3api put-object \
--bucket encryption-fun-mho \
--key hello.txt \
--body hello.txt \
--server-side-encryption aws:kms \
--ssekms-key-id 8fabb9cd-5647-4876-ac09-f4e26fcef4fe
```

## Put object with SSE-C [Failed Attempt]
```sh
export BASE64_ENCODED_KEY=$(openssl rand -base64 32)
echo $BASE64_ENCODED_KEY
export MD5_VALUE=$(echo $BASE64_ENCODED_KEY | base64 --decode | md5sum | awk '{print $1}' | base64 -w0)
echo $MD5_VALUE

aws s3api put-object \
--bucket encryption-fun-mho \
--key hello.txt \
--body hello.txt \
--sse-customer-algorithm AES256 \
--sse-customer-key $ENCODED_KEY \
--sse-customer-key-md5 $MD5_value
```

### Put Object with SSE-C via aws S3
```sh
openssl rand -out ssec.key 32
aws s3 cp hello.txt s3://encryption-fun-mho/hello.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key
```

## Cleanup
```sh
aws s3 rm s3://encryption-fun-mho/hello.txt
aws s3 rb s3://encryption-fun-mho
```
