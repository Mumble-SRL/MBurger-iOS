//
//  MBSectionTests.m
//  MBurgerTests
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MBSection.h"

@interface MBSectionTests : XCTestCase{
    NSDictionary *sectionDictionary;
    NSDictionary *sectionWithElementsDictionary;
}

@end

@implementation MBSectionTests

- (void)setUp {
    [super setUp];

    NSString *sectionFile = [[NSBundle bundleForClass:[self class]] pathForResource:@"section" ofType:@"json"];
    sectionDictionary = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:sectionFile] options:0 error:nil];
    
    NSString *sectionWithElementsFile = [[NSBundle bundleForClass:[self class]] pathForResource:@"section_elements" ofType:@"json"];
    sectionWithElementsDictionary = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:sectionWithElementsFile] options:0 error:nil];
}

- (void)tearDown {
    [super tearDown];
    
    sectionDictionary = nil;
    sectionWithElementsDictionary = nil;
}

- (void)testInitializationSection {
    MBSection *section = [[MBSection alloc] initWithDictionary:sectionDictionary];
    XCTAssertEqual(section.sectionId, 96);
    XCTAssertEqual(section.order, 3);
    XCTAssertEqual(section.elements, nil);
}

- (void)testInitializationSectionElements {
    MBSection *section = [[MBSection alloc] initWithDictionary:sectionWithElementsDictionary
                          ];
    XCTAssertEqual(section.sectionId, 96);
    XCTAssertEqual(section.order, 3);
    XCTAssertNotNil(section.elements);
}

- (void) testSerialization {
    MBSection *section = [[MBSection alloc] initWithDictionary:sectionWithElementsDictionary];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:section];
    MBSection *section1 = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    XCTAssertEqual(section.sectionId, section1.sectionId);
    XCTAssertEqual(section.order, section1.order);
    XCTAssertEqual(section.elements.allKeys.count, section1.elements.allKeys.count);
}

@end
