## Create a new s3 bucket

```md
aws s3 mb s3://checksums-examples-mho
```

## Create afile that we will do a checksum on

```
echo "Hello Warudo" > myfile.txt
```

## Get a checksum of a file for md5
md5sum myfile.txt
# f1bc512502d934130725ef1e22a23f22 *myfile.txt

## Upload our file and look at its etag
```
aws s3 cp myfile.txt s3://checksums-examples-mho
aws s3api head-object --bucket checksums-examples-mho --key myfile.txt
```

## Create a different checksum (CRC32) with WSL/Ubuntu
```
crc32 /mnt/c/AWS/FreeCodeCamp-AWS-Examples-Repo/AWS-SAA-C03-Practice/s3/checksums/myfile.txt
04f5c633
# Encode to base 64
echo -n 04f5c633 | xxd -r -p | base64
BPXGMw==
```

## Upload a file with a different kind of checksum
```
aws s3api put-object \
--bucket checksums-examples-mho \
--key myfilecrc32.txt \
--body myfile.txt \
--checksum-algorithm CRC32 \
--checksum-crc32 04f5c63
```