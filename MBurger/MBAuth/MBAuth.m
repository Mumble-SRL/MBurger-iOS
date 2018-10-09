//
//  MBAuth.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. All rights reserved.
//

#import "MBAuth.h"
#import "MBApiManager.h"
#import "MBManager.h"
#import <SAMKeychain/SAMKeychain.h>

@implementation MBAuth

static NSString *_mbAuthToken = nil;

+ (void) registerUserWithName: (NSString *) name
                      Surname: (NSString *) surname
                        Email: (NSString *) email
                     Password: (NSString *) password
                        Phone: (NSString *) phone
                        Image: (UIImage *) image
                         Data: (NSString *) data
                      Success: (void (^)(void)) success
                      Failure: (void (^)(NSError *error)) failure {
    [self registerUserWithName:name Surname:surname Email:email Password:password Phone:phone Image:image Contracts:nil Data:data Success:success Failure:failure];
}

+ (void) registerUserWithName: (NSString *) name
                      Surname: (NSString *) surname
                        Email: (NSString *) email
                     Password: (NSString *) password
                        Phone: (NSString *) phone
                        Image: (UIImage *) image
                    Contracts: (NSArray <MBAuthContractAcceptanceParameter *> *) contracts
                         Data: (NSString *) data
                      Success: (void (^)(void)) success
                      Failure: (void (^)(NSError *error)) failure {
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    if (name){
        parameters[@"name"] = name;
    }
    if (surname){
        parameters[@"surname"] = surname;
    }
    if (email){
        parameters[@"email"] = email;
    }
    if (password){
        parameters[@"password"] = password;
    }
    if (phone){
        parameters[@"phone"] = phone;
    }
    if (image){
        parameters[@"image"] = [UIImageJPEGRepresentation(image, 1.0) base64EncodedStringWithOptions:0];
    }
    if(contracts && contracts.count != 0){
        parameters[@"contracts"] = [self jsonStringForContractsArray:contracts];
    }
    if(data){
        parameters[@"data"] = data;
    }
    
    [MBApiManager callApiWithApiToken:MBManager.sharedManager.apiToken
                               Locale:[MBManager.sharedManager localeString]
                              ApiName:@"register"
                           HTTPMethod:MBHTTPMethodPost
                           Parameters:parameters
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
                                  if (success){
                                      success();
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) authenticateUserWithEmail: (NSString *) email
                          Password: (NSString *) password
                           Success: (void (^)(NSString *accessToken)) success
                           Failure: (void (^)(NSError *error)) failure{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    parameters[@"email"] = email;
    parameters[@"password"] = password;
    parameters[@"mode"] = @"email";

    [self authenticateUserWithParameters:parameters Success:success Failure:failure];
}


+ (void) authenticateUserWithSocialToken: (NSString *) token
                               TokenType: (MBAuthSocialTokenType) tokenType
                                 Success: (void (^)(NSString *accessToken)) success
                                 Failure: (void (^)(NSError *error)) failure {
    [self authenticateUserWithSocialToken:token TokenType:tokenType Contracts:nil Success:success Failure:failure];
}

+ (void) authenticateUserWithSocialToken: (NSString *) token
                               TokenType: (MBAuthSocialTokenType) tokenType
                               Contracts: (NSArray <MBAuthContractAcceptanceParameter *> *) contracts
                                 Success: (void (^)(NSString *accessToken)) success
                                 Failure: (void (^)(NSError *error)) failure {
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    
    if(contracts && contracts.count != 0){
        parameters[@"contracts"] = [self jsonStringForContractsArray:contracts];
    }
    
    switch (tokenType) {
            case MBAuthSocialTokenTypeFacebook:
            parameters[@"facebook_token"] = token;
            parameters[@"mode"] = @"facebook";
            break;
            case MBAuthSocialTokenTypeGoogle:
            parameters[@"google_token"] = token;
            parameters[@"mode"] = @"google";
            break;
            
        default:
            break;
    }
    
    [self authenticateUserWithParameters:parameters Success:success Failure:failure];
}

// Authenticate a user with the paramters given, this func is called from the other auth functions and performs the api calls and authentication

+ (void) authenticateUserWithParameters: (NSDictionary *) parameters
                                Success: (void (^)(NSString *accessToken)) success
                                Failure: (void (^)(NSError *error)) failure {
    [MBApiManager callApiWithApiToken:MBManager.sharedManager.apiToken
                               Locale:[MBManager.sharedManager localeString]
                              ApiName:@"authenticate"
                           HTTPMethod:MBHTTPMethodPost
                           Parameters:parameters
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
                                  NSString *accessToken = @"";
                                  if (response.payload[@"access_token"]) {
                                      accessToken = response.payload[@"access_token"];
                                  }
                                  [self setUserLoggedInInUserDefaults: TRUE];
                                  [self saveAccessToken:accessToken];
                                  if (success){
                                      success(accessToken);
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) logoutCurrentWithSuccess: (void (^)(void)) success
                          Failure: (void (^)(NSError *error)) failure{
    [MBApiManager callApiWithApiToken:MBManager.sharedManager.apiToken
                               Locale:[MBManager.sharedManager localeString]
                              ApiName:@"logout"
                           HTTPMethod:MBHTTPMethodPost
                           Parameters:nil
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
                                  if (success){
                                      success();
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) changePasswordForCurrentUserWithOldPassword: (NSString *) oldPassword
                                         NewPassword: (NSString *) newPassword
                                             Success: (void (^)(void)) success
                                             Failure: (void (^)(NSError * _Nonnull error)) failure{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    parameters[@"old_password"] = oldPassword;
    parameters[@"new_password"] = newPassword;

    [MBApiManager callApiWithApiToken:MBManager.sharedManager.apiToken
                               Locale:[MBManager.sharedManager localeString]
                              ApiName:@"change-password"
                           HTTPMethod:MBHTTPMethodPost
                           Parameters:parameters
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
                                  if (success){
                                      success();
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) forgotPasswordWithEmail: (NSString *) email
                         Success: (void (^)(void)) success
                         Failure: (void (^)(NSError *error)) failure{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    parameters[@"email"] = email;

    [MBApiManager callApiWithApiToken:MBManager.sharedManager.apiToken
                               Locale:[MBManager.sharedManager localeString]
                              ApiName:@"forgot-password"
                           HTTPMethod:MBHTTPMethodPost
                           Parameters:parameters
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
                                  if (success){
                                      success();
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) getUserProfileWithSuccess: (void (^)(MBUser *user)) success
                           Failure: (void (^)(NSError *error)) failure{
    [MBApiManager callApiWithApiToken:MBManager.sharedManager.apiToken
                               Locale:[MBManager.sharedManager localeString]
                              ApiName:@"profile"
                           HTTPMethod:MBHTTPMethodGet
                           Parameters:nil
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
                                  MBUser *user = [[MBUser alloc] initWithDictionary:response.payload];
                                  [self handlePluginsWithUserResponse:response.payload User:user];
                                  if (success){
                                      success(user);
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) updateProfileWithName: (NSString *) name
                       Surname: (NSString *) surname
                         Phone: (NSString *) phone
                         Image: (UIImage *) image
                          Data: (id) data
                       Success: (void (^)(MBUser *user)) success
                       Failure: (void (^)(NSError *error)) failure{
    [self updateProfileWithName:name Surname:surname Phone:phone Image:image Contracts:nil Data:data Success:success Failure:failure];
}

+ (void) updateProfileWithName: (NSString *) name
                       Surname: (NSString *) surname
                         Phone: (NSString *) phone
                         Image: (UIImage *) image
                     Contracts: (NSArray <MBAuthContractAcceptanceParameter *> *) contracts
                          Data: (id) data
                       Success: (void (^)(MBUser *user)) success
                       Failure: (void (^)(NSError *error)) failure{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    if (name){
        parameters[@"name"] = name;
    }
    if (surname){
        parameters[@"surname"] = surname;
    }
    if (phone){
        parameters[@"phone"] = phone;
    }
    if (image){
        parameters[@"image"] = [UIImageJPEGRepresentation(image, 1.0) base64EncodedStringWithOptions:0];
    }
    if(contracts && contracts.count != 0){
        parameters[@"contracts"] = [self jsonStringForContractsArray:contracts];
    }
    if (data){
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:0 error:nil];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        parameters[@"data"] = jsonString;
    }
    
    [MBApiManager callApiWithApiToken:MBManager.sharedManager.apiToken
                               Locale:[MBManager.sharedManager localeString]
                              ApiName:@"profile/update"
                           HTTPMethod:MBHTTPMethodPost
                           Parameters:parameters
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
                                  MBUser *user = [[MBUser alloc] initWithDictionary:response.payload];
                                  [self handlePluginsWithUserResponse:response.payload User:user];
                                  if (success){
                                      success(user);
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) deleteCurrentUserWithSuccess: (void (^)(void)) success
                              Failure: (void (^)(NSError *error)) failure{
    [MBApiManager callApiWithApiToken:MBManager.sharedManager.apiToken
                               Locale:[MBManager.sharedManager localeString]
                              ApiName:@"profile/delete"
                           HTTPMethod:MBHTTPMethodDelete
                           Parameters:nil
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
                                  [self logoutCurrentUser];
                                  if (success){
                                      success();
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) logoutCurrentUser{
    [self setUserLoggedInInUserDefaults:FALSE];
    [SAMKeychain deletePasswordForService:@"com.mumble.mburger.service" account:@"com.mumble.mburger.account"];
}

+ (BOOL) userIsLoggedIn{
    NSString *token = [self authToken];
    return token != nil && ![token isEqualToString:@""] && [self userIsLoggedInFromUserDefaults];
}

+ (NSString *) authToken{
    if ([self userIsLoggedInFromUserDefaults]){
        if (_mbAuthToken){
            return _mbAuthToken;
        } else {
            NSString *tokenFromKeychain = [SAMKeychain passwordForService:@"com.mumble.mburger.service" account:@"com.mumble.mburger.account"];
            _mbAuthToken = tokenFromKeychain;
            return tokenFromKeychain;
        }
    }
    return nil;
}

+ (void) saveAccessToken: (NSString *) accessToken {
    if (accessToken && ![accessToken isEqualToString:@""] && [self userIsLoggedInFromUserDefaults]){
        _mbAuthToken = accessToken;
        [SAMKeychain setPassword:accessToken forService:@"com.mumble.mburger.service" account:@"com.mumble.mburger.account"];
    }
}

+ (NSString *) accessTokenKey {
    return (__bridge id) kSecValueData;
}

+ (void) setUserLoggedInInUserDefaults: (BOOL) userLoggedIn {
    [[NSUserDefaults standardUserDefaults] setBool:userLoggedIn forKey:@"com.mumble.mburger.auth.userLoggedIn"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL) userIsLoggedInFromUserDefaults {
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"com.mumble.mburger.auth.userLoggedIn"];
}

+ (void) handleApiResponseAndSaveNewTokenIfPresentWithResponse: (NSHTTPURLResponse *) response {
    if ([self userIsLoggedIn]){
        NSDictionary *headers = [response allHeaderFields];
        if ([headers.allKeys containsObject:@"Authorization"]){
            NSString *token = headers[@"Authorization"];
            if (token){
                token = [token stringByReplacingOccurrencesOfString:@"Bearer " withString:@""];
                [self saveAccessToken:token];
            }
        }
    }
}

#pragma mark - Plugins

+ (void) handlePluginsWithUserResponse: (NSDictionary *) userResponse User: (MBUser *) user{
    NSArray *plugins = MBManager.sharedManager.plugins;
    if (plugins.count != 0){
        NSMutableDictionary *pluginsDictionary = [[NSMutableDictionary alloc] init];
        for (id <MBPlugin> plugin in plugins){
            if ([plugin respondsToSelector:@selector(objectForUserResponse:)]){
                id object = [plugin objectForUserResponse:userResponse];
                if (object){
                    NSString *userKey = NSStringFromClass(plugin.class);
                    if ([plugin respondsToSelector:@selector(pluginUserKey)]){
                        userKey = [plugin pluginUserKey];
                    }
                    pluginsDictionary[userKey] = object;
                }
            }
        }
        user.pluginsObjects = pluginsDictionary;
    }
}

#pragma mark - Contracts array to json string

+ (NSString *) jsonStringForContractsArray: (NSArray <MBAuthContractAcceptanceParameter *> *) contractsArray {
    if (contractsArray && contractsArray.count != 0){
        NSMutableArray *contractsArray = [[NSMutableArray alloc] init];
        for (MBAuthContractAcceptanceParameter *contractAcceptance in contractsArray) {
            [contractsArray addObject:[contractAcceptance dictionaryRepresentation]];
        }
        NSData *contractsJsonData = [NSJSONSerialization dataWithJSONObject:contractsArray options:NSJSONWritingPrettyPrinted error:nil];
        NSString *contractsJsonString = [[NSString alloc] initWithData:contractsJsonData encoding:NSUTF8StringEncoding];
        return contractsJsonString;
    }
    return @"";
}


@end
