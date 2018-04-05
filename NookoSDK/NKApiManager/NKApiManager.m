
//
//  NKApiManager.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 03/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKApiManager.h"

@implementation NKApiManager


- (void) callApiWithApiToken: (NSString  *) apiToken
                      Locale: (NSLocale *) locale
                     ApiName: (NSString *) apiName
                  HTTPMethod: (NSString *) httpMethod
                  Parameters: (NSDictionary *) parameters
            HeaderParameters: (NSDictionary *) headerParameters
                     Success: (void (^)(NKResponse *response)) success
                     Failure: (void (^)(NSError *error)) failure{
    
}

@end
