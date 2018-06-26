//
//  NKAuthManager.m
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. All rights reserved.
//

#import "NKAuth.h"
#import "NKApiManager.h"
#import "NKManager.h"
#import "NKKeychainItemWrapper.h"

@implementation NKAuth

+ (void) registerUserWithName: (NSString *) name
                      Surname: (NSString *) surname
                        Email: (NSString *) email
                     Password: (NSString *) password
                        Phone: (NSString *) phone
                        Image: (UIImage *) image
                         Data: (NSString *) data
                      Success: (void (^)(void)) success
                      Failure: (void (^)(NSError *error)) failure{
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
        parameters[@"image"] = [UIImageJPEGRepresentation(image, 1.0) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    }
    if(data){
        parameters[@"data"] = data;
    }
    
    [NKApiManager callApiWithApiToken:NKManager.sharedManager.apiToken
                               Locale:[NKManager.sharedManager localeString]
                              ApiName:@"register"
                           HTTPMethod:NKHTTPMethodPost
                           Parameters:parameters
                     HeaderParameters:nil
                              Success:^(NKResponse *response) {
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

    [NKApiManager callApiWithApiToken:NKManager.sharedManager.apiToken
                               Locale:[NKManager.sharedManager localeString]
                              ApiName:@"authenticate"
                           HTTPMethod:NKHTTPMethodPost
                           Parameters:parameters
                     HeaderParameters:nil
                              Success:^(NKResponse *response) {
                                  NSString *accessToken = @"";
                                  if (response.payload[@"access_token"]) {
                                      accessToken = response.payload[@"access_token"];
                                  }
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

+ (void) changePasswordForCurrentUserWithOldPassword: (nonnull NSString *) oldPassword
                                         NewPassword: (nonnull NSString *) newPassword
                                             Success: (nullable void (^)(void)) success
                                             Failure: (nullable void (^)(NSError * _Nonnull error)) failure{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    parameters[@"old_password"] = oldPassword;
    parameters[@"new_password"] = newPassword;

    [NKApiManager callApiWithApiToken:NKManager.sharedManager.apiToken
                               Locale:[NKManager.sharedManager localeString]
                              ApiName:@"change-password"
                           HTTPMethod:NKHTTPMethodPost
                           Parameters:parameters
                     HeaderParameters:nil
                              Success:^(NKResponse *response) {
                                  if (success){
                                      success();
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) forgotPasswordWithEmail: (nonnull NSString *) email
                         Success: (nullable void (^)(void)) success
                         Failure: (nullable void (^)(NSError * _Nonnull error)) failure{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    parameters[@"email"] = email;

    [NKApiManager callApiWithApiToken:NKManager.sharedManager.apiToken
                               Locale:[NKManager.sharedManager localeString]
                              ApiName:@"forgot-password"
                           HTTPMethod:NKHTTPMethodPost
                           Parameters:parameters
                     HeaderParameters:nil
                              Success:^(NKResponse *response) {
                                  if (success){
                                      success();
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) getUserProfileWithSuccess: (nullable void (^)(NKUser * _Nonnull user)) success
                           Failure: (nullable void (^)(NSError * _Nonnull error)) failure{
    [NKApiManager callApiWithApiToken:NKManager.sharedManager.apiToken
                               Locale:[NKManager.sharedManager localeString]
                              ApiName:@"profile"
                           HTTPMethod:NKHTTPMethodGet
                           Parameters:nil
                     HeaderParameters:nil
                              Success:^(NKResponse *response) {
                                  NKUser *user = [[NKUser alloc] initWithDictionary:response.payload];
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
                          Data: (NSString *) data
                       Success: (void (^)(NKUser *user)) success
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
        parameters[@"image"] = [UIImageJPEGRepresentation(image, 1.0) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    }
    if (data){
        parameters[@"data"] = data;
    }
    
    [NKApiManager callApiWithApiToken:NKManager.sharedManager.apiToken
                               Locale:[NKManager.sharedManager localeString]
                              ApiName:@"profile/update"
                           HTTPMethod:NKHTTPMethodPost
                           Parameters:nil
                     HeaderParameters:nil
                              Success:^(NKResponse *response) {
                                  NKUser *user = [[NKUser alloc] initWithDictionary:response.payload];
                                  if (success){
                                      success(user);
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) logoutCurrentUser{
    NKKeychainItemWrapper *itemWrapper = [self keychainWrapper];
    [itemWrapper resetKeychainItem];
}

+ (BOOL) userIsLoggedIn{
    NSString *token = [self authToken];
    return token != nil && ![token isEqualToString:@""];
}

+ (NSString *) authToken{
    NKKeychainItemWrapper *itemWrapper = [self keychainWrapper];
    NSData *data = [itemWrapper objectForKey:[self accessTokenKey]];
    if (data){
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}

+ (void) saveAccessToken: (NSString *) accessToken {
    if (accessToken && ![accessToken isEqualToString:@""]){
        [[self keychainWrapper] setObject:[accessToken dataUsingEncoding:NSUTF8StringEncoding] forKey:[self accessTokenKey]];
    }
}

+ (NKKeychainItemWrapper *) keychainWrapper {
    NKKeychainItemWrapper *keychainWrapper = [[NKKeychainItemWrapper alloc] initWithIdentifier:@"com.mumble.nooko" accessGroup:nil];
    return keychainWrapper;
}

+ (NSString *) accessTokenKey {
    return (__bridge id) kSecValueData;
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

@end
