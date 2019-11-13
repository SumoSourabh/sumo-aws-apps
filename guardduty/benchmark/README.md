# sumologic-amazon-guardduty-benchmark

This solution installs the Guardduty Benchmark App, creates collectors/sources in Sumo Logic platform and deploys the lambda function in your AWS account using configuration provided at the time of sam application deployment.

Made with ❤️ by Sumo Logic AppDev Team. Available on the [AWS Serverless Application Repository](https://aws.amazon.com/serverless)

![GuardDuty Event Collection Flow](https://s3.amazonaws.com/appdev-cloudformation-templates/sumologic-guardduty-evetns-processor.png)

## Setup
1. Go to https://serverlessrepo.aws.amazon.com/applications.
2. Search for sumologic-amazon-guardduty-benchmark and click on deploy.
3. In Configure application parameters panel paste the HTTP collector endpoint previously configured.
    - RemoveSumoResourcesOnDeleteStack - True if you need to remove all the resource created when SAM app was installed else false.
    - SumoDeployment - Enter the SumoLogic deployment.
    - SumoAccessID - Enter the SumoLogic Access ID for the entered deployment.
    - SumoAccessKey - Enter the SumoLogic Access Key for the entered deployment.
    - CollectorName - Enter or update the existing SumoLogic collector name.
    - SourceName - Enter the Source Name.
    - SourceCategoryName - Enter the Source Category.
4. Click on Deploy

## Excluding Outer Event Fields

By default, a CloudWatch Event has a format similar to this:
```
{
    "version":"0",
    "id":"0123456d-7e46-ecb4-f5a2-e59cec50b100",
    "detail-type":"AWS API Call via CloudTrail",
    "source":"aws.logs",
    "account":"012345678908",
    "time":"2017-11-06T23:36:59Z",
    "region":"us-east-1",
    "resources":[ ],
    "detail":▶{ … }
}
```
This event will be sent as-is to Sumo Logic. If you just want to send the detail key instead, set the removeOuterFields variable to true.


## License

Apache License 2.0 (Apache-2.0)


## Support
Requests & issues should be filed on GitHub: https://github.com/SumoLogic/sumologic-aws-lambda/issues
