# sumologic-amazon-waf

This solution creates resources for processing and sending Amazon WAF logs to Sumo logic.

Made with ❤️ by Sumo Logic AppDev Team. Available on the [AWS Serverless Application Repository](https://aws.amazon.com/serverless)

## Setup
1. Go to https://serverlessrepo.aws.amazon.com/applications.
2. Search for sumologic-amazon-waf and click on deploy.
3. In Configure application parameters panel paste the HTTP collector endpoint previously configured.
    - KinesisDestinationS3BucketName - Enter the S3 bucket name to collect logs for WAFs you need to monitor.
    - CreateKinesisDestinationS3Bucket - Yes if you need SAM app to create the bucket for you else no.
    - CompressionFormat - compression format for your S3 bucket.
    - S3BackupMode - If backup needed.
    - DeliveryStreamName - Kinesis Delivery stream name for your WAF.
    - RemoveSumoResourcesOnDeleteStack - True if you need to remove all the resource created when SAM app was installed else false.
    - SumoDeployment - Enter the SumoLogic deployment.
    - SumoAccessID - Enter the SumoLogic Access ID for the entered deployment.
    - SumoAccessKey - Enter the SumoLogic Access Key for the entered deployment.
    - CollectorName - Enter or update the existing SumoLogic collector name.
    - ExternalID - Enter the account ID in format as deployment:accountID.
    - PathExpression - Enter the path expression for log files you want to collect.
    - SourceName - Enter the Source Name.
    - SourceCategoryName - Enter the Source Category.
4. Click on Deploy

## License

Apache License 2.0 (Apache-2.0)

## Support
Requests & issues should be filed on GitHub: https://github.com/SumoLogic/sumologic-aws-lambda/issues
