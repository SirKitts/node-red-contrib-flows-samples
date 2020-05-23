aws rekognition compare-faces \
--source-image '{"S3Object":{"Bucket":"name-of-your-s3-bucket-123","Name":"source.jpg"}}' \
--target-image '{"S3Object":{"Bucket":"name-of-your-s3-bucket-123","Name":"target.jpg"}}'
