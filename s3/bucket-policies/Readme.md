## Creata bucket

```sh
aws s3 mb s3://bucket-policy-mho
```

## Create bucket policy
```sh
aws s3api put-bucket-policy --bucket bucket-policy-mho --policy file://policy.json
```

## Create a file in the other account, copy it to the bucket, and list bucket contents
```sh
touch bootcamp.txt
aws s3 cp bootcamp.txt s3://bucket-policy-mho
aws s3 ls s3://bucket-policy-mho
```

## Cleanup
```sh
aws s3 rm s3://bucket-policy-mho/bootcamp.txt
aws s3 rb s3://bucket-policy-mho
```