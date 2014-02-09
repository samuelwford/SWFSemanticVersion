//
//  SWFViewController.h
//  SWFSemanticVersion
//
//  Created by Samuel Ford on 2/5/14.
//  Copyright (c) 2014 Samuel Ford. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWFSemanticVersion.h"

@interface SWFViewController : UIViewController

@property (strong, nonatomic) SWFSemanticVersion *firstSemVer;
@property (strong, nonatomic) SWFSemanticVersion *secondSemVer;

@property (strong, nonatomic) IBOutlet UITextField *firstVersion;
@property (strong, nonatomic) IBOutlet UITextField *secondVersion;

@property (strong, nonatomic) IBOutlet UILabel *comparisonResult;

@end
