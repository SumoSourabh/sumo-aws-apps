#!/bin/sh

echo -e 'Welcome to SumoLogic Amazon Apps'
read -p 'Enter the S3 bucket name to upload the SAM applications: '  sam_s3_bucket
echo 'Enter the Sumlogic access details'
read -p 'SumoDeployment (us2/us1): ' sumo_deployment
read -p 'SumoAccessID:' sumo_access_id
read -p 'SumoAccessKey: ' sumo_access_key
echo 'Please enter the app number to install(1/2....):'
echo '1. Amazon GuardDuty Benchmark'
echo '2. Amazon GuardDuty'
echo '3. Amazon S3 Audit'
echo '4. AWS WAF'
echo '5. AWS Config'
echo '6. AWS CloudTrail'

guard_duty_benchmark()
{
  	cd sumologic-app-utils 
	rm -r .aws-sam
	sam build -t sumo_app_utils.yaml
	sam package --output-template packaged.yaml --s3-bucket $sam_s3_bucket
	#sam deploy --template-file packaged.yaml --stack-name  sumologic-app-utils --capabilities CAPABILITY_IAM
	echo Installing..........
	cd guardduty/benchmark
	rm -r .aws-sam
	sam build -t template.yaml
	sam package --output-template packaged.yaml --s3-bucket $sam_s3_bucket
	read -p 'CollectorName: ' collector_name
	read -p 'SourceName; ' SourceName
	read -p 'SourceCategoryName: ' SourceCategoryName
	read -p 'RemoveSumoResourcesOnDeleteStack(true/false): ' RemoveSumoResourcesOnDeleteStack
	
	sam deploy --template-file packaged.yaml --stack-name  sumologic-guardduty-benchmark \
	--capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND \
	--parameter-overrides SumoDeployment=$sumo_deployment \
	SumoAccessID=$sumo_access_id SumoAccessKey=$sumo_access_key \
	CollectorName=$collector_name \
	SourceName=$SourceName \
	SourceCategoryName=$SourceCategoryName \
	SourceName=$SourceName \
	RemoveSumoResourcesOnDeleteStack=$RemoveSumoResourcesOnDeleteStack 
	
	
}
guard_duty()
{
  	cd sumologic-app-utils 
	rm -r .aws-sam
	sam build -t sumo_app_utils.yaml
	sam package --output-template packaged.yaml --s3-bucket $sam_s3_bucket
	#sam deploy --template-file packaged.yaml --stack-name  sumologic-app-utils --capabilities CAPABILITY_IAM
	echo Installing..........
	cd ..\/guardduty
	rm -r .aws-sam
	sam build -t template.yaml
	sam package --output-template packaged.yaml --s3-bucket $sam_s3_bucket
	read -p 'CollectorName: ' collector_name
	read -p 'SourceName; ' SourceName
	read -p 'SourceCategoryName: ' SourceCategoryName
	read -p 'RemoveSumoResourcesOnDeleteStack(true/false): ' RemoveSumoResourcesOnDeleteStack
	
	sam deploy --template-file packaged.yaml --stack-name  sumologic-guardduty \
	--capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND \
	--parameter-overrides SumoDeployment=$sumo_deployment \
	SumoAccessID=$sumo_access_id SumoAccessKey=$sumo_access_key \
	CollectorName=$collector_name \
	SourceName=$SourceName \
	SourceCategoryName=$SourceCategoryName \
	SourceName=$SourceName \
	RemoveSumoResourcesOnDeleteStack=$RemoveSumoResourcesOnDeleteStack \
	
}

s3_audit()
{
  	cd sumologic-app-utils 
	rm -r .aws-sam
	sam build -t sumo_app_utils.yaml
	sam package --output-template packaged.yaml --s3-bucket $sam_s3_bucket
	#sam deploy --template-file packaged.yaml --stack-name  sumologic-app-utils --capabilities CAPABILITY_IAM
	echo Installing..........
	cd ..\/s3-audit
	rm -r .aws-sam
	sam build -t template.yaml
	sam package --output-template packaged.yaml --s3-bucket $sam_s3_bucket
	read -p 'CollectorName: ' collector_name
	read -p 'SourceName; ' SourceName
	read -p 'SourceCategoryName: ' SourceCategoryName
	read -p 'PathExpression: ' PathExpression
	read -p 'ExternalID (deployment:accountId. Eg. us1:0000000000000131)': ExternalID
	read -p 'AccessLogsTargetS3BucketName: ':  AccessLogsTargetS3BucketName
	read -p 'CreateTargetS3Bucket (yes/no): ': CreateTargetS3Bucket
	read -p 'RemoveSumoResourcesOnDeleteStack(true/false): ' RemoveSumoResourcesOnDeleteStack
	
	sam deploy --template-file packaged.yaml --stack-name  sumologic-s3-audit \
	--capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND \
	--parameter-overrides SumoDeployment=$sumo_deployment \
	SumoAccessID=$sumo_access_id SumoAccessKey=$sumo_access_key \
	CollectorName=$collector_name \
	SourceName=$SourceName \
	SourceCategoryName=$SourceCategoryName \
	ExternalID=$ExternalID \
	PathExpression=$PathExpression \
	AccessLogsTargetS3BucketName=$AccessLogsTargetS3BucketName \
	CreateTargetS3Bucket=$CreateTargetS3Bucket \
	RemoveSumoResourcesOnDeleteStack=$RemoveSumoResourcesOnDeleteStack \
	
}
s3_audit()
{
  	cd sumologic-app-utils 
	rm -r .aws-sam
	sam build -t sumo_app_utils.yaml
	sam package --output-template packaged.yaml --s3-bucket $sam_s3_bucket
	#sam deploy --template-file packaged.yaml --stack-name  sumologic-app-utils --capabilities CAPABILITY_IAM
	echo Installing..........
	cd ..\/s3-audit
	rm -r .aws-sam
	sam build -t template.yaml
	sam package --output-template packaged.yaml --s3-bucket $sam_s3_bucket
	read -p 'CollectorName: ' collector_name
	read -p 'SourceName; ' SourceName
	read -p 'SourceCategoryName: ' SourceCategoryName
	read -p 'PathExpression: ' PathExpression
	read -p 'ExternalID (deployment:accountId. Eg. us1:0000000000000131)': ExternalID
	read -p 'AccessLogsTargetS3BucketName: ':  AccessLogsTargetS3BucketName
	read -p 'CreateTargetS3Bucket (yes/no): ': CreateTargetS3Bucket
	read -p 'RemoveSumoResourcesOnDeleteStack(true/false): ' RemoveSumoResourcesOnDeleteStack
	
	sam deploy --template-file packaged.yaml --stack-name  sumologic-s3-audit \
	--capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND \
	--parameter-overrides SumoDeployment=$sumo_deployment \
	SumoAccessID=$sumo_access_id SumoAccessKey=$sumo_access_key \
	CollectorName=$collector_name \
	SourceName=$SourceName \
	SourceCategoryName=$SourceCategoryName \
	ExternalID=$ExternalID \
	PathExpression=$PathExpression \
	AccessLogsTargetS3BucketName=$AccessLogsTargetS3BucketName \
	CreateTargetS3Bucket=$CreateTargetS3Bucket \
	RemoveSumoResourcesOnDeleteStack=$RemoveSumoResourcesOnDeleteStack \
	
}
waf()
{
  	cd sumologic-app-utils 
	rm -r .aws-sam
	sam build -t sumo_app_utils.yaml
	sam package --output-template packaged.yaml --s3-bucket $sam_s3_bucket
	#sam deploy --template-file packaged.yaml --stack-name  sumologic-app-utils --capabilities CAPABILITY_IAM
	echo Installing..........
	cd ..\/WAF
	rm -r .aws-sam
	sam build -t template.yaml
	sam package --output-template packaged.yaml --s3-bucket $sam_s3_bucket
	echo '\n-----SumoLogic configuration------\n'
	read -p 'CollectorName: ' collector_name
	read -p 'SourceName; ' SourceName
	read -p 'SourceCategoryName: ' SourceCategoryName
	read -p 'PathExpression: ' PathExpression
	read -p 'ExternalID (deployment:accountId. Eg. us1:0000000000000131)': ExternalID
	echo '\n-----Amazon KinesisFirehose DeliveryStream Configuration------\n'
	read -p 'DeliveryStreamName: ' DeliveryStreamName
	read -p 'KinesisDestinationS3BucketName: ' KinesisDestinationS3BucketName
	read -p 'CreateKinesisDestinationS3Bucket (yes/no) : ' CreateKinesisDestinationS3Bucket
	
	read -p 'RemoveSumoResourcesOnDeleteStack(true/false): ' RemoveSumoResourcesOnDeleteStack
	
	sam deploy --template-file packaged.yaml --stack-name  sumologic-waf \
	--capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND \
	--parameter-overrides SumoDeployment=$sumo_deployment \
	SumoAccessID=$sumo_access_id SumoAccessKey=$sumo_access_key \
	CollectorName=$collector_name \
	SourceName=$SourceName \
	SourceCategoryName=$SourceCategoryName \
	ExternalID=$ExternalID \
	PathExpression=$PathExpression \
	DeliveryStreamName=$DeliveryStreamName \
	KinesisDestinationS3BucketName=$KinesisDestinationS3BucketName \
	CreateKinesisDestinationS3Bucket=$CreateKinesisDestinationS3Bucket \
	RemoveSumoResourcesOnDeleteStack=$RemoveSumoResourcesOnDeleteStack \
	
}
config()
{
	cd sumologic-app-utils 
	rm -r .aws-sam
	sam build -t sumo_app_utils.yaml
	sam package --output-template packaged.yaml --s3-bucket $sam_s3_bucket
	#sam deploy --template-file packaged.yaml --stack-name  sumologic-app-utils --capabilities CAPABILITY_IAM
	echo Installing..........
	cd ..\/config
	rm -r .aws-sam
	sam build -t template.yaml
	sam package --output-template packaged.yaml --s3-bucket $sam_s3_bucket
	echo '\n-----SumoLogic configuration------\n'
	read -p 'CollectorName: ' collector_name
	read -p 'SourceName; ' SourceName
	read -p 'SourceCategoryName: ' SourceCategoryName
	read -p 'PathExpression: ' PathExpression
	read -p 'ExternalID (deployment:accountId. Eg. us1:0000000000000131)': ExternalID
	read -p 'AccessLogsTargetS3BucketName: ':  AccessLogsTargetS3BucketName
	read -p 'CreateTargetS3Bucket (yes/no): ': CreateTargetS3Bucket
	read -p 'RemoveSumoResourcesOnDeleteStack(true/false): ' RemoveSumoResourcesOnDeleteStack
}
cloudtrail(){
	cd sumologic-app-utils 
	rm -r .aws-sam
	sam build -t sumo_app_utils.yaml
	sam package --output-template packaged.yaml --s3-bucket $sam_s3_bucket
	#sam deploy --template-file packaged.yaml --stack-name  sumologic-app-utils --capabilities CAPABILITY_IAM
	echo Installing..........
	cd ..\/cloudtrail
	rm -r .aws-sam
	sam build -t template.yaml
	sam package --output-template packaged.yaml --s3-bucket $sam_s3_bucket
	echo '\n-----SumoLogic configuration------\n'
	read -p 'CollectorName: ' collector_name
	read -p 'SourceName; ' SourceName
	read -p 'SourceCategoryName: ' SourceCategoryName
	read -p 'PathExpression: ' PathExpression
	read -p 'ExternalID (deployment:accountId. Eg. us1:0000000000000131)': ExternalID
	read -p 'AccessLogsTargetS3BucketName: ':  AccessLogsTargetS3BucketName
	read -p 'CreateTargetS3Bucket (yes/no): ': CreateTargetS3Bucket
	read -p 'RemoveSumoResourcesOnDeleteStack(true/false): ' RemoveSumoResourcesOnDeleteStack

	sam deploy --template-file packaged.yaml --stack-name  sumologic-cloudtrail-stack \
	--capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND \
	--parameter-overrides SumoDeployment=$sumo_deployment \
	SumoAccessID=$sumo_access_id SumoAccessKey=$sumo_access_key \
	CollectorName=$collector_name \
	SourceName=$SourceName \
	SourceCategoryName=$SourceCategoryName \
	ExternalID=$ExternalID \
	PathExpression=$PathExpression \
	CloudTrailTargetS3BucketName=$AccessLogsTargetS3BucketName \
	CreateTargetS3Bucket=$CreateTargetS3Bucket \
	RemoveSumoResourcesOnDeleteStack=$RemoveSumoResourcesOnDeleteStack \

}
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
	1)
		guard_duty_benchmark
		;;
	2)
		guard_duty
		;;
	3)
		s3_audit
		;;
	4)
		waf
		;;
	5)
		config 
		;;
	6)
		cloudtrail 
		;;
	bye)
		echo "See you again!"
		break
		;;
	*)
		echo "Sorry, I don't understand"
		;;
  esac
done





 


