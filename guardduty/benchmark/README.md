# sumologic-guardduty-benchmark-application.

This solution Deploy the AWS Lambda function to collect CloudWatch events and post them to [SumoLogic](http://www.sumologic.com) via a [HTTP collector endpoint](http://help.sumologic.com/Send_Data/Sources/02Sources_for_Hosted_Collectors/HTTP_Source)
AWS Cloudwatch Events invokes the function asynchronously in response to any changes in AWS resources. The event payload received is then sent to a SumoLogic HTTP source endpoint.

This solution creates the HTTP Source, collector in SumoLogic and install the "Amazon GuardDuty Benchmark" App in "Personal" Folder. 

Made by Sumo Logic AppDev Team. Available on the [AWS Serverless Application Repository](https://aws.amazon.com/serverless)

![GuardDuty Event Collection Flow](https://s3.amazonaws.com/appdev-cloudformation-templates/sumologic-guardduty-evetns-processor.png)

## Setup
1. Go to https://serverlessrepo.aws.amazon.com/applications.
2. Search for sumologic-guardduty-benchmark and click on deploy.
4. Provide the parametr values.
5. Click on Deploy

## Application Parameters.
Parameters List:

- Access ID(Required): Sumo Logic Access ID of your Sumo Logic account.
- Access Key(Required): Sumo Logic Access Key of your Sumo Logic account.
- Deployment (Required): Sumo Logic Deployment name.
- Collector Name: Enter the name of the Hosted Collector which will be created in Sumo Logic.
- Source Name: Enter the name of the Source which will be created within the collector.
- Source Category: Used to filter/serach the logs in Sumo Logic. 
- Remove Sumo Resources On Delete Stack: To delete collector, sources and app when stack is deleted, set this parameter to true. Default is false.

## This will create the below resouces.
- Creates the Lambda function in AWS that collects the Guard Duty logs and send to Sumo Loigc.
- Creates the COllector and HTTP source in Sumo Logic.
- Install the "Amazon GuardDuty" App in your Sumologic "Personal" Folder.
## License

Apache License 2.0 (Apache-2.0)


## Support
Requests & issues should be filed on GitHub: https://github.com/SumoLogic/sumologic-aws-apps/issues




