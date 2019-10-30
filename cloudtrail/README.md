# sumologic-cloudtrail

This solution installs the CloudTrail App, creates collectors/sources in Sumo Logic platform and deploys the resources in your AWS account using configuration provided at the time of SAM application deployment.

Made by Sumo Logic AppDev Team. Available on the [AWS Serverless Application Repository](https://aws.amazon.com/serverless)

![Sumo Logic CloudTrail app](https://user-images.githubusercontent.com/6774570/67530685-bb44d380-f674-11e9-90bb-825e0bfe2118.jpg)

## Resources in template.yaml
1.	List of Parameters user needs to input
2.	IAM role that assumes role from sumologic account and provides access to the S3 bucket
3.	Serverless lambda function to create collector, source, install app on sumologic platform. This will output S3/Http source endpoint URL which is used in SNS subscription below
4.	S3 bucket with the name user provided as parameter. This bucket will capture logs from CloudTrail. Users will be asked while creating the stack whether they want to create new or reuse existing bucket
5.	S3 bucket policy that allows read-write access from CloudTrail service
6.	CloudTrail that logs to S3 bucket
7.	SNS topic
8.	SNS subscription with sumologic source endpoint from step 3
9.	SNS policy that provides access to publish messages
10.	SumoLogic Collector, source and app information captured and passed further to the SAM app in step 3.

## Setup:
1.	Generate Access key from sumologic console as per docs.
2.	Go to https://serverlessrepo.aws.amazon.com/applications.
3.	Search for sumologic-cloud-trail and click on deploy.
4.	In the Configure application parameters panel, enter the following parameters
    -	Access ID(Required): Sumo Logic Access ID generated from Step 1
    -	Access Key(Required): Sumo Logic Access Key generated from Step 1
    -	Organization ID(Required): Deployment name (environment name in lower case as per docs ) + Org ID (Can be found on your sumologic console under Account overview)
    -	Collector Name: Enter the name of the Hosted Collector which will be created in Sumo Logic.
    -	Source Name: Enter the name of the S3 Source which will be created within the collector.
    -	Source Category Name: Enter the name of the Source Category which will be used for writing search queries.
    -	S3 Bucket Name: Enter the name of S3 Bucket to access logs
    -	Create S3 Bucket: Enter yes if you want to create a new bucket. No if you want to use an existing one.
    -	Path Expression: Path Expression to match one or more s3 objects.
5.  Click on Deploy

## License
  Apache License 2.0 (Apache-2.0)
  
## Support
Requests & issues should be filed on GitHub: https://github.com/SumoLogic/sumologic-aws-apps/issues
