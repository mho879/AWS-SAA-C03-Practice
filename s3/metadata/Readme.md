## Create bucket
```sh
aws s3 mb s3://example-metadata-mho
```

## Create a new file
```sh
echo "Hello Warudo" > hello.txt
```

## Upload file with metadata
```sh
aws s3api put-object --bucket example-metadata-mho --key hello.txt --body hello.txt --metadata Planet=Earth
```

## Get Metadata through head object
```sh
aws s3api head-object --bucket example-metadata-mho --key hello.txt
```