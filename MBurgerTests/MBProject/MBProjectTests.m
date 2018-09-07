//
//  MBProjectTests.m
//  MBurgerTests
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MBProject.h"

@interface MBProjectTests : XCTestCase{
    NSDictionary *projectDictionary;
}

@end

@implementation MBProjectTests

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
    MBProject *project = [[MBProject alloc] initWithDictionary:projectDictionary];
    XCTAssertEqual(project.projectId, 1);
    XCTAssertEqual(project.projectName, @"ProjectName");
}

- (void) testSerialization {
    MBProject *project = [[MBProject alloc] initWithDictionary:projectDictionary];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:project];
    MBProject *project1 = [NSKeyedUnarchiver unarchiveObjectWithData:data];
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
