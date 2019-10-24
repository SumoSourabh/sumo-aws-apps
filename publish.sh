#!/bin/sh

echo -e 'Welcome to SumoLogic Amazon Apps'
read -p 'Enter the S3 bucket name to upload the SAM applications: '  sam_s3_bucket
echo 'Enter the Sumlogic access details'

echo 'Please enter the app number to publish(1/2....):'
echo '1. Amazon GuardDuty Benchmark'
echo '2. Amazon GuardDuty'
echo '3. AWS CloudTrail'
echo '4. AWS Config'
echo '5. CIS AWS Foundations Benchmark'
echo '6. VPC Flow Logs'
echo '7. S3 Audit'  
echo '8. WAF'
echo '9. Security Hub'
echo '10. Threat Intel for AWS'


guard_duty_benchmark()
{
  	echo Installing..........
	cd .\/guardduty/benchmark
	rm requirements.txt
	cp ..\/..\/sumologic-app-utils/src/requirements.txt .
	rm -r .aws-sam
	sam build -t template.yaml
	echo Build completed..........
	sam package --output-template packaged.yaml --s3-bucket $sam_s3_bucket
	echo Package completed..........
	echo Publishing..........
	sam publish --template packaged.yaml
	echo Done, Please Check your AWS serverless Repo.

	
	
}
guard_duty()
{
  	echo Installing..........
	cd .\/guardduty
	rm requirements.txt
	cp ..\/sumologic-app-utils/src/requirements.txt .
	rm -r .aws-sam
	sam build -t template.yaml
	echo Build completed..........
	sam package --output-template packaged.yaml --s3-bucket $sam_s3_bucket
	echo Package completed..........
	echo Publishing..........
	sam publish --template packaged.yaml
	echo Done, Please Check your AWS serverless Repo.
	
}
cloudtrail()
{
  	echo Installing..........
	cd .\/cloudtrail
	rm requirements.txt
	cp ..\/sumologic-app-utils/src/requirements.txt .
	rm -r .aws-sam
	sam build -t template.yaml
	echo Build completed..........
	sam package --output-template packaged.yaml --s3-bucket $sam_s3_bucket
	echo Package completed..........
	echo Publishing..........
	sam publish --template packaged.yaml
	echo Done, Please Check your AWS serverless Repo.
	
}
config()
{
  	echo Installing..........
	cd .\/config
	rm requirements.txt
	cp ..\/sumologic-app-utils/src/requirements.txt .
	rm -r .aws-sam
	sam build -t template.yaml
	echo Build completed..........
	sam package --output-template packaged.yaml --s3-bucket $sam_s3_bucket
	echo Package completed..........
	echo Publishing..........
	sam publish --template packaged.yaml
	echo Done, Please Check your AWS serverless Repo.
	
}
cis_foundations()
{
  	echo Installing..........
	cd .\/CIS-Foundations
	rm requirements.txt
	cp ..\/sumologic-app-utils/src/requirements.txt .
	rm -r .aws-sam
	sam build -t template.yaml
	echo Build completed..........
	sam package --output-template packaged.yaml --s3-bucket $sam_s3_bucket
	echo Package completed..........
	echo Publishing..........
	sam publish --template packaged.yaml
	echo Done, Please Check your AWS serverless Repo.
	
}
publish_app_type1()
{
  	echo Installing.......... $1
	cd .\/$1
	rm requirements.txt
	cp ..\/sumologic-app-utils/src/requirements.txt .
	rm -r .aws-sam
	sam build -t template.yaml
	echo Build completed..........
	sam package --output-template packaged.yaml --s3-bucket $sam_s3_bucket
	echo Package completed..........
	echo Publishing..........
	sam publish --template packaged.yaml
	echo Done, Please Check your AWS serverless Repo.
	
}

publish_app_type2()
{
  	echo Installing.......... $1
	cd .\/$1
	rm requirements.txt
	cp ..\/sumologic-app-utils/src/requirements.txt .
	rm -r .aws-sam
	sam build -t template.yaml
	echo Build completed..........

	file_name=$1-template-$(date "+%Y-%m-%d-%H-%M-%S").yaml
	region=$(aws configure get region)
	template_url=https://s3.$region.amazonaws.com/$sam_s3_bucket/$file_name
	sam package --output-template $file_name --s3-bucket $sam_s3_bucket
	echo uploading the s3 source utils to s3...
	aws s3 cp $file_name s3://$sam_s3_bucket
	sed -i '' "s|!Ref SecurityHubTempalteS3Url|$template_url|g" ..\/deploy-test.yaml
	echo Done.
	
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
		cloudtrail
		;;
	4)
		config
		;;
	5)
		cis_foundations
		;;
	6)
		publish_app_type1 vpc-flow-logs
		;;
	7)
		publish_app_type1 s3-audit
		;;
	8)
		publish_app_type1 WAF
		;;
	9)
		publish_app_type2 security-hub
		;;
	10)
		publish_app_type1 threat-intel-for-aws
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





 


