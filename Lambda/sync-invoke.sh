#!/bin/bash

FUNCTION_NAME="demo-lambda"

aws lambda invoke --function-name $FUNCTION_NAME \
    --cli-binary-format raw-in-base64-out \
    --payload '{"key1": "Value1", "key2": "Value2", "key3": "Value3"}' \
    --region us-east-1 response.json 