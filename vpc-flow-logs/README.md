# sumologic-amazon-vpc-flow-logs.

This solution Creates S3 bucket in AWS to collect the logs, add required IAM role, so that SumoLogic collects the logs from this S3 bucket and creates the S3 Source, collector, install the "Amazon VPC Flow Logs" App in "Personal" Folder of your SumoLogic.

Made by Sumo Logic AppDev Team. Available on the [AWS Serverless Application Repository](https://aws.amazon.com/serverless)

![SumoLogic Amazon VPC Flow Logs App](https://github.com/madhusarma/sumo-aws-apps/blob/master/assets/vpc-flow-logs.png)
## Setup
1. Go to https://serverlessrepo.aws.amazon.com/applications.
2. Search for sumologic-amazon-vpc-flow-logs and click on deploy.
4. Provide the parametr values.
5. Click on Deploy

## Application Parameters.
Parameters List:

- Access ID(Required): Sumo Logic Access ID of your Sumo Logic account.
- Access Key(Required): Sumo Logic Access Key of your Sumo Logic account.
- Deployment (Required): Sumo Logic Deployment name.
- Collector Name: Enter the name of the Hosted Collector which will be created in Sumo Logic.
- Source Name: Enter the name of the Source which will be created within the collector.
- Source Category: Category metadata to use later for querying, e.g. prod/web/apache/access . This data is queried using the '_sourceCategory' key name.
- Path Expression: Path expression to match one or more S3 objects. For example, ABC*.log or ABC.log.
- ExternalID : An ID used in the trust policy to designate who can assume the role, formatted as deployment:accountId. Eg. us1:0000000000000131
- Exclude Rule Name: Exclude VPC File Flow headers.
- Exclude Rule: Exclude rule regexp.
- Remove Sumo Resources On Delete Stack: To delete collector, sources and app when stack is deleted, set this parameter to true. Default is false.
- Logs Target S3 Bucket Name: Log files target S3 bucket.
- Create Target S3 Bucket (yes/no): 
    - If "yes", then it will creates the above S3 bucket.
    - if "no", it will not cretae and use the existing bucket.

## This will create the below resouces.
- Creates the S3 bucket(if "Create Target S3 Bucket" is yes) in AWS to collect the logs.
- Add IAM role to above S3 bucket, so that SumoLogic S3 source can assume role to read the log files.
- Creates the SNS Policy,Topic and Add the https subscription to send the notification to SumoLogic, when logfile is added to S3 bucket.
- Creates the Collector and S3 source in SumoLogic.
- Install the "Amazon VPC Flow Logs" App in your Sumologic "Personal" Folder.
## License

Apache License 2.0 (Apache-2.0)


## Support
Requests & issues should be filed on GitHub: https://github.com/SumoLogic/sumologic-aws-apps/issues




