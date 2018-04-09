//
//  NookoSDKTests.m
//  NookoSDKTests
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NKProject.h"

@interface NKProjectTests : XCTestCase{
    NSDictionary *projectDictionary;
}

@end

@implementation NKProjectTests

- (void)setUp {
    [super setUp];

    projectDictionary = @{@"id" : @(1),
                          @"name" : @"ProjectName"};
}

- (void)tearDown {
    [super tearDown];
    projectDictionary = nil;
}

- (void) testInitialization {
    NKProject *project = [[NKProject alloc] initWithDictionary:projectDictionary];
    XCTAssertEqual(project.projectId, 1);
    XCTAssertEqual(project.projectName, @"ProjectName");
}

- (void) testSerialization {
    NKProject *project = [[NKProject alloc] initWithDictionary:projectDictionary];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:project];
    NKProject *project1 = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    XCTAssertEqual(project.projectId, project1.projectId);
    XCTAssertTrue([project.projectName isEqualToString:project1.projectName]);
}

/*
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
*/

@end
