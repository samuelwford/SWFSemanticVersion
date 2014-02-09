//
//  SWFSemanticVersion.h
//  SWFSemanticVersion
//
//  Created by Samuel Ford on 2/5/14.
//  Copyright (c) 2014 Samuel Ford. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWFSemanticVersion : NSObject

@property (nonatomic, strong) NSNumber * major;
@property (nonatomic, strong) NSNumber * minor;
@property (nonatomic, strong) NSNumber * patch;
@property (nonatomic, strong) NSString * pre;
@property (nonatomic, strong) NSString * build;

/**
 Creates a new SWFSemanticVersion by parsing the string passed.
 @param string a semantic version string
 @return a version instance or nil of not a valid version
 */
+ (instancetype)semanticVersionWithString:(NSString *)string;

/**
 Returns an NSComparisonResult indicating whether version passed is
 greater than, less than or equal to the current version.
 @param version version to compare to
 @return returns NSOrderedSame if identical or NSOrderedAscending or NSOrderedDescending if the version passed is greater than or less than the current version repsectively
 */
- (NSComparisonResult)compare:(SWFSemanticVersion *)version;

@end
