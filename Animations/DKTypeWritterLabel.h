//
//  CustomLabel.h
//  Animations
//
//  Created by Domagoj Kulundžić on 20/04/15.
//  Copyright (c) 2015 Domagoj Kulundžić. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DKTypewritterLabelAnimationSpeed) {
    DKTypewritterLabelAnimationSpeedVerySlow,
    DKTypewritterLabelAnimationSpeedSlow,
    DKTypewritterLabelAnimationSpeedNormal,
    DKTypewritterLabelAnimationSpeedFast
};

@interface DKTypeWritterLabel : UILabel

- (void)setText:(NSString *)text
       animated:(BOOL)animated
withAnimationSpeed:(DKTypewritterLabelAnimationSpeed)animationSpeed
     completion:(void (^)())completion;

@end
