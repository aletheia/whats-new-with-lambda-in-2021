ACCOUNT_ID=$(aws sts get-caller-identity |jq '.Account' |tr -d \" )
IMAGE_NAME=hello-world-alternate
FUNCTION_NAME=$IMAGE_NAME-function
REGION=eu-south-1

aws lambda create-function --region $REGION \
        --function-name $FUNCTION_NAME \
        --package-type Image \
        --code ImageUri=$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$IMAGE_NAME:latest \
        --role arn:aws:iam::$ACCOUNT_ID:role/TestLambdaDockerRole