## Creata bucket

```sh
aws s3api create-bucket \
--bucket acl-example-mho \
--create-bucket-configuration LocationConstraint=us-west-2
```

## Turn off Block Public Access for ACLs
```sh
aws s3api put-public-access-block \
--bucket acl-example-mho \
--public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```

## Change Bucket Owwnership
### https://docs.aws.amazon.com/cli/latest/reference/s3api/put-bucket-ownership-controls.html
```sh
aws s3api put-bucket-ownership-controls \
--bucket acl-example-mho \
--ownership-controls Rules=[{ObjectOwnership=BucketOwnerPreferred}]
```

## Change ACLs to allow for 2 users in other aws accounts via email and/or id
### https://docs.aws.amazon.com/cli/latest/reference/s3api/put-bucket-acl.html
```sh
aws s3api put-bucket-acl \
--bucket acl-example-mho \
--grant-full-control emailaddress=user1@example.com,id=canonical-id-in-security-credentials
```

## Cleanup
```sh
aws s3api delete-bucket --bucket acl-example-mho
```