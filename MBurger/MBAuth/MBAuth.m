//
//  MBAuth.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. All rights reserved.
//

#import "MBAuth.h"
#import "MBApiManager.h"
#import "MBManager.h"
#import "Lockbox.h"
#import <Security/Security.h>

@implementation MBAuth

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
        parameters[@"image"] = [UIImageJPEGRepresentation(image, 1.0) base64EncodedStringWithOptions:0];
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

+ (void) forgotPasswordWithEmail: (nonnull NSString *) email
                         Success: (nullable void (^)(void)) success
                         Failure: (nullable void (^)(NSError * _Nonnull error)) failure{
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

+ (void) getUserProfileWithSuccess: (nullable void (^)(MBUser * _Nonnull user)) success
                           Failure: (nullable void (^)(NSError * _Nonnull error)) failure{
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

+ (void) logoutCurrentUser{
    [Lockbox archiveObject:@"" forKey:@"com.mumble.mburger"];
}

+ (BOOL) userIsLoggedIn{
    NSString *token = [self authToken];
    return token != nil && ![token isEqualToString:@""];
}

+ (NSString *) authToken{
    NSString *token = [Lockbox unarchiveObjectForKey:@"com.mumble.mburger"];
    return token;
}

+ (void) saveAccessToken: (NSString *) accessToken {
    if (accessToken && ![accessToken isEqualToString:@""]){
        [Lockbox archiveObject:accessToken forKey:@"com.mumble.mburger"];
    }
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

@end
