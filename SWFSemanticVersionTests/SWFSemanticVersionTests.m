//
//  SWFSemanticVersionTests.m
//  SWFSemanticVersionTests
//
//  Created by Samuel Ford on 2/5/14.
//  Copyright (c) 2014 Samuel Ford. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SWFSemanticVersion.h"

@interface SWFSemanticVersionTests : XCTestCase

@end

@implementation SWFSemanticVersionTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testExplicitInit
{
    SWFSemanticVersion *semVer = [[SWFSemanticVersion alloc] initWithMajor:@(0) minor:@(0) patch:@(0) pre:nil build:nil];
    
    XCTAssert(semVer, @"where are you, semVer?");
    XCTAssertEqualObjects(@"0.0.0", [semVer description]);
}

- (void)testSimplestPartialVersion
{
    SWFSemanticVersion *semVer = [SWFSemanticVersion semanticVersionWithString:@"1"];
    
    XCTAssert(semVer, @"where are you, semVer?");
    XCTAssertEqualObjects(@1, semVer.major);
    XCTAssertEqualObjects(@0, semVer.minor);
    XCTAssertEqualObjects(@0, semVer.patch);
}

- (void)testPartialVersion
{
    SWFSemanticVersion *semVer = [SWFSemanticVersion semanticVersionWithString:@"2.1"];
    
    XCTAssert(semVer, @"where are you, semVer?");
    XCTAssertEqualObjects(@2, semVer.major);
    XCTAssertEqualObjects(@1, semVer.minor);
    XCTAssertEqualObjects(@0, semVer.patch);
}

- (void)testSimplestVersion
{
    SWFSemanticVersion *semVer = [SWFSemanticVersion semanticVersionWithString:@"0.1.0"];
    
    XCTAssert(semVer, @"where are you, semVer?");
    XCTAssertEqualObjects(@0, semVer.major);
    XCTAssertEqualObjects(@1, semVer.minor);
}

- (void)testStrictValidationSimplestPartialVersion
{
        SWFSemanticVersion *semVer = [SWFSemanticVersion semanticVersionWithString:@"1" withStrictValidation:YES];
    
    XCTAssertNil(semVer, @"Strict validation failed. :(");
}

- (void)testStrictValidationPartialVersion
{
        SWFSemanticVersion *semVer = [SWFSemanticVersion semanticVersionWithString:@"2.1" withStrictValidation:YES];
        XCTAssertNil(semVer, @"Strict validation failed. :(");
}

- (void)testInvalidEmptyVersion
{
    SWFSemanticVersion *semVer = [SWFSemanticVersion semanticVersionWithString:@""];
    
    XCTAssertNil(semVer, @"wha?");
}

- (void)testInvalidPartialVersion
{
    SWFSemanticVersion *semVer = [SWFSemanticVersion semanticVersionWithString:@"1-beta"];
    
    XCTAssertNil(semVer, @"wha?");
}

- (void)testInvalidExtraDigitsVersion
{
    SWFSemanticVersion *semVer = [SWFSemanticVersion semanticVersionWithString:@"1.1.1.1234"];
    
    XCTAssertNil(semVer, @"wha?");
}

- (void)testInvalidLeadingZeroesMajorVersion
{
    SWFSemanticVersion *semVer = [SWFSemanticVersion semanticVersionWithString:@"0001.0.1"];
    
    XCTAssertNil(semVer, @"wha?");
}

- (void)testInvalidLeadingZeroesMinorVersion
{
    SWFSemanticVersion *semVer = [SWFSemanticVersion semanticVersionWithString:@"1.01.1"];
    
    XCTAssertNil(semVer, @"wha?");
}

- (void)testInvalidLeadingZeroesPatchVersion
{
    SWFSemanticVersion *semVer = [SWFSemanticVersion semanticVersionWithString:@"1.0.0001"];
    
    XCTAssertNil(semVer, @"wha?");
}

- (void)testInvalidVersionsAreNil
{
    SWFSemanticVersion *semVer = [SWFSemanticVersion semanticVersionWithString:@"pretzels"];
    
    XCTAssertNil(semVer, @"wha?");
}

- (void)testBuildNumbers
{
    SWFSemanticVersion *b1 = [SWFSemanticVersion semanticVersionWithString:@"0.1.0+build.100"];
    SWFSemanticVersion *b2 = [SWFSemanticVersion semanticVersionWithString:@"0.1.0+build.200"];
    
    XCTAssert(b1);
    XCTAssert(b2);
    
    XCTAssertEqualObjects(b1.major, b2.major);
    XCTAssertEqualObjects(b1.minor, b2.minor);
    XCTAssertEqualObjects(b1.patch, b2.patch);
    XCTAssertNotEqualObjects(b1.build, b2.build);
    
    XCTAssertEqualObjects(b1, b2);
}

- (void)testVersionIsGreaterThanNil
{
    SWFSemanticVersion *b1 = [SWFSemanticVersion semanticVersionWithString:@"0.1.0"];
    SWFSemanticVersion *b2 = [SWFSemanticVersion semanticVersionWithString:@"donuts"];
    
    XCTAssert(b1);
    XCTAssertNil(b2);
    
    XCTAssertEqual(NSOrderedDescending, [b1 compare:b2]);
}

- (void)testTrailingBits
{
    SWFSemanticVersion *semVer = [SWFSemanticVersion semanticVersionWithString:@"1.9.7-rc.1"];
    
    XCTAssert(semVer, @"where are you, semVer?");
    XCTAssertEqualObjects(@1, semVer.major);
    XCTAssertEqualObjects(@9, semVer.minor);
    XCTAssertEqualObjects(@7, semVer.patch);
    XCTAssertEqualObjects(@"rc.1", semVer.pre);
    XCTAssertNil(semVer.build);
}

- (void)testMajorBeatsMinor
{
    SWFSemanticVersion *b1 = [SWFSemanticVersion semanticVersionWithString:@"1.0.0"];
    SWFSemanticVersion *b2 = [SWFSemanticVersion semanticVersionWithString:@"0.1.0"];
    
    XCTAssert(b1);
    XCTAssert(b2);
    
    XCTAssertEqual(NSOrderedDescending, [b1 compare:b2]);
}

- (void)testMajorBeatsPatch
{
    SWFSemanticVersion *b1 = [SWFSemanticVersion semanticVersionWithString:@"1.0.0"];
    SWFSemanticVersion *b2 = [SWFSemanticVersion semanticVersionWithString:@"0.0.1"];
    
    XCTAssert(b1);
    XCTAssert(b2);
    
    XCTAssertEqual(NSOrderedDescending, [b1 compare:b2]);
}

- (void)testMinorBeatsPatch
{
    SWFSemanticVersion *b1 = [SWFSemanticVersion semanticVersionWithString:@"1.0.1"];
    SWFSemanticVersion *b2 = [SWFSemanticVersion semanticVersionWithString:@"1.0.0"];
    
    XCTAssert(b1);
    XCTAssert(b2);
    
    XCTAssertEqual(NSOrderedDescending, [b1 compare:b2]);
}

- (void)testBuildIgnored
{
    SWFSemanticVersion *b1 = [SWFSemanticVersion semanticVersionWithString:@"1.0.0+build.1"];
    SWFSemanticVersion *b2 = [SWFSemanticVersion semanticVersionWithString:@"1.0.0"];
    
    XCTAssert(b1);
    XCTAssert(b2);
    
    XCTAssertEqualObjects(b1, b2);
}

- (void)testNoPreReleaseBeatsPreRelease
{
    SWFSemanticVersion *b1 = [SWFSemanticVersion semanticVersionWithString:@"1.0.0"];
    SWFSemanticVersion *b2 = [SWFSemanticVersion semanticVersionWithString:@"1.0.0-rc.1"];
    
    XCTAssert(b1);
    XCTAssert(b2);
    
    XCTAssertEqual(NSOrderedDescending, [b1 compare:b2]);
}

- (void)testPreReleaseLexicalSort
{
    SWFSemanticVersion *b1 = [SWFSemanticVersion semanticVersionWithString:@"1.0.0-rc.2"];
    SWFSemanticVersion *b2 = [SWFSemanticVersion semanticVersionWithString:@"1.0.0-rc.1"];
    
    XCTAssert(b1);
    XCTAssert(b2);
    
    XCTAssertEqual(NSOrderedDescending, [b1 compare:b2]);
}

- (void)testPreReleaseNumericSort
{
    SWFSemanticVersion *b1 = [SWFSemanticVersion semanticVersionWithString:@"1.0.0-rc.11"];
    SWFSemanticVersion *b2 = [SWFSemanticVersion semanticVersionWithString:@"1.0.0-rc.2"];
    
    XCTAssert(b1);
    XCTAssert(b2);
    
    XCTAssertEqual(NSOrderedDescending, [b1 compare:b2]);
}

- (void)testEquality
{
    SWFSemanticVersion *b1a = [SWFSemanticVersion semanticVersionWithString:@"1.0.0-rc.1"];
    SWFSemanticVersion *b1b = [SWFSemanticVersion semanticVersionWithString:@"1.0.0-rc.1"];
    SWFSemanticVersion *b2 = [SWFSemanticVersion semanticVersionWithString:@"1.0.0"];
    
    XCTAssert(b1a);
    XCTAssert(b1b);
    XCTAssert(b2);
    
    XCTAssert([b1a isEqual:b1b]);
    XCTAssertFalse([b1a isEqual:b2]);
    XCTAssertFalse([b1a isEqual:NSNull.null]);
}

- (void)testCoding
{
    SWFSemanticVersion *b1 = [SWFSemanticVersion semanticVersionWithString:@"1.0.0-rc.1"];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:b1];
    
    SWFSemanticVersion *b2 = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    XCTAssert([b2 isEqual:b1]);
}

@end
