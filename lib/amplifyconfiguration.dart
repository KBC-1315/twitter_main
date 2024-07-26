const amplifyconfig = '''{
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "twitter": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://3juvi2n3gfhengo5jfrzqrlmji.appsync-api.us-east-2.amazonaws.com/graphql",
                    "region": "us-east-2",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-otzapjqiyzcg5bhzue5fawa3a4"
                }
            }
        }
    },
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://3juvi2n3gfhengo5jfrzqrlmji.appsync-api.us-east-2.amazonaws.com/graphql",
                        "Region": "us-east-2",
                        "AuthMode": "API_KEY",
                        "ApiKey": "da2-otzapjqiyzcg5bhzue5fawa3a4",
                        "ClientDatabasePrefix": "twitter_API_KEY"
                    }
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "us-east-2:86599bf3-a2d6-4fa5-869c-54f21426f2f9",
                            "Region": "us-east-2"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-east-2_5itdzkJnV",
                        "AppClientId": "7oqdocbekg1k5fo1jenh9aeto8",
                        "Region": "us-east-2"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH",
                        "socialProviders": [],
                        "usernameAttributes": [
                            "EMAIL",
                            "PHONE_NUMBER"
                        ],
                        "signupAttributes": [
                            "EMAIL"
                        ],
                        "passwordProtectionSettings": {
                            "passwordPolicyMinLength": 8,
                            "passwordPolicyCharacters": []
                        },
                        "mfaConfiguration": "OFF",
                        "mfaTypes": [
                            "SMS"
                        ],
                        "verificationMechanisms": [
                            "EMAIL"
                        ]
                    }
                },
                "S3TransferUtility": {
                    "Default": {
                        "Bucket": "twitterccd5b33b89c14f599fc306b95bf2a46190a4c-dev",
                        "Region": "us-east-2"
                    }
                }
            }
        }
    },
    "storage": {
        "plugins": {
            "awsS3StoragePlugin": {
                "bucket": "twitterccd5b33b89c14f599fc306b95bf2a46190a4c-dev",
                "region": "us-east-2",
                "defaultAccessLevel": "guest"
            }
        }
    }
}''';
