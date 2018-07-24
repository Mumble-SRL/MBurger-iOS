//
//  NKblockTests.m
//  NookoSDKTests
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MBBlock.h"

@interface NKBlockTests : XCTestCase{
    NSDictionary *blockDictionary;
    NSDictionary *blockWithSectionsDictionary;
    NSDictionary *blockWithSectionsAndElementsDictionary;
}

@end

@implementation NKBlockTests

- (void)setUp {
    [super setUp];

    NSString *blockFile = [[NSBundle bundleForClass:[self class]] pathForResource:@"block" ofType:@"json"];
    blockDictionary = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:blockFile] options:0 error:nil];
    
    NSString *blockWithSectionsFile = [[NSBundle bundleForClass:[self class]] pathForResource:@"block_sections" ofType:@"json"];
    blockWithSectionsDictionary = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:blockWithSectionsFile] options:0 error:nil];

    NSString *blockWithSectionsAndElementsFile = [[NSBundle bundleForClass:[self class]] pathForResource:@"block_sections_elements" ofType:@"json"];
    blockWithSectionsAndElementsDictionary = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:blockWithSectionsAndElementsFile] options:0 error:nil];
}

- (void)tearDown {
    [super tearDown];
    
    blockDictionary = nil;
    blockWithSectionsDictionary = nil;
    blockWithSectionsAndElementsDictionary = nil;
}

- (void)testInitializationBlock {
    MBBlock *block = [[MBBlock alloc] initWithDictionary:blockDictionary];
    XCTAssertEqual(block.blockId, 13);
    XCTAssertTrue([block.title isEqualToString:@"News"]);
    XCTAssertTrue([block.subtitle isEqualToString:@""]);
    XCTAssertEqual(block.order, 1);
    XCTAssertEqual(block.sections, nil);
}

- (void)testInitializationBlockSections {
    MBBlock *block = [[MBBlock alloc] initWithDictionary:blockWithSectionsDictionary];
    XCTAssertEqual(block.blockId, 13);
    XCTAssertTrue([block.title isEqualToString:@"News"]);
    XCTAssertTrue([block.subtitle isEqualToString:@""]);
    XCTAssertEqual(block.order, 1);
    XCTAssertEqual(block.sections.count, 3); //We just test if the sections are created
}

- (void)testInitializationBlockSectionsAndElements {
    MBBlock *block = [[MBBlock alloc] initWithDictionary:blockWithSectionsAndElementsDictionary];
    XCTAssertEqual(block.blockId, 13);
    XCTAssertTrue([block.title isEqualToString:@"News"]);
    XCTAssertTrue([block.subtitle isEqualToString:@""]);
    XCTAssertEqual(block.order, 1);
    XCTAssertEqual(block.sections.count, 3);
    MBSection *firstSection = block.sections.firstObject;
    XCTAssertNotNil(firstSection.elements); //We just test if the sections are created
}


- (void) testSerialization {
    MBBlock *block = [[MBBlock alloc] initWithDictionary:blockWithSectionsAndElementsDictionary];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:block];
    MBBlock *block1 = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    XCTAssertEqual(block.blockId, block1.blockId);
    XCTAssertTrue([block.title isEqualToString:block1.title]);
    XCTAssertTrue([block.subtitle isEqualToString:block1.subtitle]);
    XCTAssertEqual(block.order, block1.order);
    XCTAssertEqual(block.sections.count, block1.sections.count);
}

@end
