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

- (void)testSimplestVersion
{
    SWFSemanticVersion *semVer = [SWFSemanticVersion semanticVersionWithString:@"0.1.0"];
    
    XCTAssert(semVer, @"where are you, semVer?");
    XCTAssertEqualObjects(@0, semVer.major);
    XCTAssertEqualObjects(@1, semVer.minor);
}

@end
