ACCOUNT_ID=$(aws sts get-caller-identity |jq '.Account' |tr -d \" )
IMAGE_NAME=hello-world
FUNCTION_NAME=$IMAGE_NAME-function
REGION=eu-south-1

cp ../app/* .

docker build -t $IMAGE_NAME:latest .

aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com    
aws ecr create-repository --repository-name $IMAGE_NAME --region $REGION
docker tag $IMAGE_NAME:latest $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$IMAGE_NAME:latest
docker push $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$IMAGE_NAME:latest
