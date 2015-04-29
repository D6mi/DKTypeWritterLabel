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

#import "DKTypeWritterLabel.h"

#define TYPEWRITTER_SPEED_VERY_FAST 0.02
#define TYPEWRITTER_SPEED_FAST 0.45
#define TYPEWRITTER_SPEED_NORMAL 0.08
#define TYPEWRITTER_SPEED_SLOW 0.2
#define TYPEWRITTER_SPEED_VERY_SLOW 0.4


typedef void(^AnimationBlock)(void);

@interface DKTypeWritterLabel ()

@property (strong, nonatomic) NSString *originalText;
@property (strong, nonatomic) NSMutableArray *characters;
@property (strong, nonatomic) NSTimer *timer;

@property (copy, nonatomic) AnimationBlock animationBlock;

@end

@implementation DKTypeWritterLabel

- (void)setText:(NSString *)text withAnimationSpeed:(DKTypewritterLabelAnimationSpeed)animationSpeed completion:(void (^)())completion {
    [super setText:@""];
    
    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancel)];
    [self addGestureRecognizer:tapRecognizer];
    
    self.originalText = text;
    self.animationBlock = completion;
    
    if(self.timer) {
        [self.timer invalidate];
    }
    
    self.characters = [NSMutableArray arrayWithCapacity:[text length]];
    
    for(int index = 0; index < [text length]; index++) {
        NSString *character = [text substringWithRange:NSMakeRange(index, 1)];
        [self.characters addObject:character];
    }
    
    [self initiateSequentialSetTextWithAnimationSpeed:animationSpeed];
}

- (void)setText:(NSString *)text withCustomAnimationSpeed:(CGFloat)animationSpeed
     completion:(void (^)())completion {
    [super setText:@""];
    
    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancel)];
    [self addGestureRecognizer:tapRecognizer];
    
    self.originalText = text;
    self.animationBlock = completion;
    
    if(self.timer) {
        [self.timer invalidate];
    }
    
    self.characters = [NSMutableArray arrayWithCapacity:[text length]];
    
    for(int index = 0; index < [text length]; index++) {
        NSString *character = [text substringWithRange:NSMakeRange(index, 1)];
        [self.characters addObject:character];
    }
    
    [self initiateSequentialSetTextWithCustomAnimationSpeed:animationSpeed];
}

- (void)initiateSequentialSetTextWithAnimationSpeed:(DKTypewritterLabelAnimationSpeed)animationSpeed {
    CGFloat speed = 0.15;
    
    switch (animationSpeed) {
        case DKTypewritterLabelAnimationSpeedVerySlow:
            speed = TYPEWRITTER_SPEED_VERY_SLOW;
            break;
        case DKTypewritterLabelAnimationSpeedSlow:
            speed = TYPEWRITTER_SPEED_SLOW;
            break;
        case DKTypewritterLabelAnimationSpeedNormal:
            speed = TYPEWRITTER_SPEED_NORMAL;
            break;
        case DKTypewritterLabelAnimationSpeedFast:
            speed = TYPEWRITTER_SPEED_FAST;
            break;
        case DKTypewritterLabelAnimationSpeedVeryFast:
            speed = TYPEWRITTER_SPEED_VERY_FAST;
            break;
        default:
            break;
    }
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:speed target:self selector:@selector(sequentialSetText) userInfo:nil repeats:YES];
}

- (void)initiateSequentialSetTextWithCustomAnimationSpeed:(CGFloat)animationSpeed {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:animationSpeed target:self selector:@selector(sequentialSetText) userInfo:nil repeats:YES];
}

/**
 Called by the timer every x seconds. Adds one characters (from the characters array) to the Label's text.
 */
- (void)sequentialSetText {
    if([self.characters count] == 0) {
        [self reset];
        
        if(self.animationBlock) {
            self.animationBlock();
        }
        
        return;
    }
    
    NSString *character = [self.characters firstObject];
    [self.characters removeObjectAtIndex:0];
    
    NSString *text = [self.text stringByAppendingString:character];
    
    self.text = text;
}

- (void)cancel {
    // Update the label's text to the final text.
    self.text = self.originalText;
    
    [self reset];
}

- (void)reset {
    // Invalidate the timer.
    [self.timer invalidate];
    
    // Remove the reference to the original text since we no longer need it.
    self.originalText = nil;
    
    // Disable the user interaction so that the Label does not receive unnecessary hitTests.
    // This will prevent the Label from blocking some other touch from passing through.
    self.userInteractionEnabled = NO;
    
    // Clear out the array since we don't need the characters anymore.
    [self.characters removeAllObjects];
}


@end
