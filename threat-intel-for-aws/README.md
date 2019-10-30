# sumologic-threat-intel-for-amazon-app

This solution creates resources for installing app for sumologic threat intel in sumologic.

Made with ❤️ by Sumo Logic AppDev Team. Available on the [AWS Serverless Application Repository](https://aws.amazon.com/serverless)

## Setup
1. Go to https://serverlessrepo.aws.amazon.com/applications.
2. Search for sumologic-threat-intel-for-amazon-app and click on deploy.
3. In Configure application parameters panel paste the HTTP collector endpoint previously configured.
    - RemoveSumoResourcesOnDeleteStack - True if you need to remove all the resource created when SAM app was installed else false.
    - SumoDeployment - Enter the SumoLogic deployment.
    - SumoAccessID - Enter the SumoLogic Access ID for the entered deployment.
    - SumoAccessKey - Enter the SumoLogic Access Key for the entered deployment.
    - CloudTrailSourceCategory - Enter the source category for Cloud Trail.
    - VPCSourceCategory - Enter the source category for VPC flow logs.
    - ELBSourceCategory - Enter the source category for Loadbalancer app.
4. Click on Deploy

## License

Apache License 2.0 (Apache-2.0)

## Support
Requests & issues should be filed on GitHub: https://github.com/SumoLogic/sumologic-aws-lambda/issues
