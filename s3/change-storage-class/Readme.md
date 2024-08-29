## Creata bucket

```sh
aws s3 mb s3://class-fun-mho
```

## Create a file
```sh
echo "Hello Warudo" > hello.txt
aws s3 cp hello.txt s3://class-fun-mho --storage-class STANDARD_IA
```

## Cleanup
```sh
aws s3 rm s3://class-fun-mho/hello.txt
aws s3 rb s3://class-fun-mho
```