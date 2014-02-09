//
//  SWFViewController.m
//  SWFSemanticVersion
//
//  Created by Samuel Ford on 2/5/14.
//  Copyright (c) 2014 Samuel Ford. All rights reserved.
//

#import "SWFViewController.h"

@interface SWFViewController ()

@end

@implementation SWFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self.firstVersion addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.secondVersion addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)compareVersions {
    if (!self.firstSemVer || !self.secondSemVer) {
        self.comparisonResult.text = @"?";
        return;
    }

    NSComparisonResult result = [self.firstSemVer compare:self.secondSemVer];
    
    switch (result) {
        case NSOrderedSame:
            self.comparisonResult.text = @"==";
            break;
        
        case NSOrderedAscending:
            self.comparisonResult.text = @"<";
            break;
            
        case NSOrderedDescending:
            self.comparisonResult.text = @">";
            break;
    }
}

- (void)textFieldDidChange:(UITextField *)textField
{
    SWFSemanticVersion *semVer = [SWFSemanticVersion semanticVersionWithString:textField.text];
    
    if (semVer) {
        textField.textColor = [UIColor blackColor];
    } else {
        textField.textColor = [UIColor redColor];
    }
    
    
    if (textField == self.firstVersion) {
        self.firstSemVer = semVer;
    } else {
        self.secondSemVer = semVer;
    }
    
    [self compareVersions];
}

@end
