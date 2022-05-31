const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "ap-northeast-1:2731ca41-cb65-4009-97e0-bd2d96938dae",
                            "Region": "ap-northeast-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "ap-northeast-1_bihw3sgMQ",
                        "AppClientId": "4tsf0ki40qohtt6m396np6tpup",
                        "Region": "ap-northeast-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "OAuth": {
                            "WebDomain": "englister3f839e5d-3f839e5d-dev.auth.ap-northeast-1.amazoncognito.com",
                            "AppClientId": "4tsf0ki40qohtt6m396np6tpup",
                            "SignInRedirectURI": "englister://",
                            "SignOutRedirectURI": "englister://",
                            "Scopes": [
                                "phone",
                                "email",
                                "openid",
                                "profile",
                                "aws.cognito.signin.user.admin"
                            ]
                        },
                        "authenticationFlowType": "USER_SRP_AUTH",
                        "loginMechanisms": [
                            "EMAIL"
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
                        ],
                        "socialProviders": [
                            "FACEBOOK",
                            "GOOGLE",
                            "APPLE"
                        ],
                        "usernameAttributes": [
                            "EMAIL"
                        ]
                    }
                }
            }
        }
    }
}''';
