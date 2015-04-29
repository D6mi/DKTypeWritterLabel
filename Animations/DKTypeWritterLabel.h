//
//  DKTypeWritterLabel.h
//  DKTypeWritterLabel
//
//  Created by Domagoj Kulundžić on 20/04/15.
//  Copyright (c) 2015 Domagoj Kulundžić. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DKTypewritterLabelAnimationSpeed) {
    DKTypewritterLabelAnimationSpeedVerySlow,
    DKTypewritterLabelAnimationSpeedSlow,
    DKTypewritterLabelAnimationSpeedNormal,
    DKTypewritterLabelAnimationSpeedFast,
    DKTypewritterLabelAnimationSpeedVeryFast
};

@interface DKTypeWritterLabel : UILabel

/**
 Sets the text of the label with a TypeWritter-like animation.
 @param text The text to be set on the label.
 @param animationSpeed A member of the DKTypewritterLabelAnimationSpeed enum, indicating the speed of the animation.
 @param completion A block to be executed after the label TypeWritter animation has completed.
 */
- (void)setText:(NSString *)text
     withAnimationSpeed:(DKTypewritterLabelAnimationSpeed)animationSpeed
             completion:(void (^)())completion;

/**
 Sets the text of the label with a TypeWritter-like animation.
 @param text The text to be set on the label.
 @param customAnimationSpeed The speed in which to animate the TypeWritter animation.
 @param completion A block to be executed after the label TypeWritter animation has completed.
 */
- (void)setText:(NSString *)text withCustomAnimationSpeed:(CGFloat)animationSpeed
     completion:(void (^)())completion;

@end
