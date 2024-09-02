## Creata bucket
```sh
aws s3 mb s3://cors-mho
```

## Change block public access
```sh
aws s3api put-public-access-block \
--bucket cors-mho \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create bucket policy
```sh
aws s3api put-bucket-policy --bucket cors-mho --policy file://bucket-policy.json
```

## Turn on static website hosting
```sh
aws s3api put-bucket-website --bucket cors-mho --website-configuration file://website.json
```

## Upload our index.html file and include a resource that woudl be cross-origin (CORS)
```sh
aws s3 cp index.html s3://cors-mho
```

## View website to seee if index.html is there
```sh
http://cors-mho.s3-website-us-west-2.amazonaws.com
```

## Create API Gateway with mock response and test endpoint
```sh
curl -X POST -H "Content-Type: application/json" https://1fxoo0e2t6.execute-api.us-west-2.amazonaws.com/prod/hello
```

## Apply a CORS policy on bucket
```sh
aws s3api put-bucket-cors --bucket cors-mho --cors-configuration file://cors.json
```


## Cleanup
```sh
aws s3 rm s3://cors-mho/index.html
aws s3 rb s3://cors-mho
```