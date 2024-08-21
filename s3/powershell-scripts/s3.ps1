Import-Module AWS.Tools.S3

$region = "us-west-2"

$bucketName = Read-Host -Prompt 'Enter the S3 bucket name'

echo "AWS Region: $region"
echo "S3 Bucket: $bucketName"

function BucketExists {
    $bucket = Get-S3Bucket -BucketName $bucketName -ErrorAction SilentlyContinue
    return $null -ne $bucket
}

if (-not (BucketExists)) {
    Write-Host "Bucket does not exist..."
    New-S3Bucket -BucketName $bucketName -Region $region
} else {
    Write-Host "Bucket already exists..."
}

# Create a new file

$fileName = 'myFile.txt'
$fileContent = 'Hello Warudo!'
Set-Content -Path $fileName -Value $fileContent

Write-S3Object -BucketName $bucketName -File $fileName -Key $fileName