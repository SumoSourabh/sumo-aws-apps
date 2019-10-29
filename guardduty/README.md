# sumologic-guardduty-application.

This solution creates resources in AWS for processing and sending Amazon GuardDuty Events to Sumo logic and creates the creates resources in Sumo Logic website and install the guardduty App in your Personal Folder.


Made with ❤️ by Sumo Logic AppDev Team. Available on the [AWS Serverless Application Repository](https://aws.amazon.com/serverless)

![GuardDuty Event Collection Flow](https://s3.amazonaws.com/appdev-cloudformation-templates/sumologic-guardduty-evetns-processor.png)

## Setup
1. Go to https://serverlessrepo.aws.amazon.com/applications.
2. Search for sumologic-guardduty and click on deploy.
4. Provide the parametr values.
5. Click on Deploy

## Application Parameters.
Parameters List:

- Access ID(Required): Sumo Logic Access ID of your Sumo Logic account.
- Access Key(Required): Sumo Logic Access Key of your Sumo Logic account.
- Deployment (Required): Sumo Logic Deployment name.
- Collector Name: Enter the name of the Hosted Collector which will be created in Sumo Logic.
- Source Name: Enter the name of the Source which will be created within the collector.
- Source Category: Used to filetr/serach the logs in Sumo Logic. 
- Remove Sumo Resources On Delete Stack: To delete collector, sources and app when stack is deleted, set this parameter to true. Default is false.

## This will create the below resouces.
- Creates the Lambda function in AWS that collects the Guard Duty logs and send to Sumo Loigc.
- Creates the COllector and HTTP source in Sumo Logic.
- Install the "Amazon GuardDuty" App in your Sumologic "Personal" Folder.
## License

Apache License 2.0 (Apache-2.0)


## Support
Requests & issues should be filed on GitHub: https://github.com/SumoLogic/sumologic-aws-apps/issues

