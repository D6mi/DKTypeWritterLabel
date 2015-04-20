//
//  CustomLabel.m
//  Animations
//
//  Created by Domagoj Kulundžić on 20/04/15.
//  Copyright (c) 2015 Domagoj Kulundžić. All rights reserved.
//

#import "DKTypeWritterLabel.h"

#define TYPEWRITTER_SPEED_FAST 0.05
#define TYPEWRITTER_SPEED_NORMAL 0.08
#define TYPEWRITTER_SPEED_SLOW 0.2
#define TYPEWRITTER_SPEED_VERY_SLOW 0.4


typedef void(^AnimationBlock)(void);

@interface DKTypeWritterLabel ()

@property (strong, nonatomic) NSMutableArray *characters;
@property (strong, nonatomic) NSTimer *timer;

@property (copy, nonatomic) AnimationBlock animationBlock;

@end

@implementation DKTypeWritterLabel

- (void)setText:(NSString *)text animated:(BOOL)animated withAnimationSpeed:(DKTypewritterLabelAnimationSpeed)animationSpeed completion:(void (^)())completion {
    [super setText:@""];
    
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
        default:
            break;
    }
    
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:speed target:self selector:@selector(sequentialSetText) userInfo:nil repeats:YES];
}

- (void)sequentialSetText {
    if([self.characters count] == 0) {
        [self.timer invalidate];
        
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

@end
