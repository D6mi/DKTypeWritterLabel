//
//  ViewController.m
//  Animations
//
//  Created by Domagoj Kulundžić on 14/04/15.
//  Copyright (c) 2015 Domagoj Kulundžić. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIView *testView;

@property (strong, nonatomic) NSArray *texts;

@property (assign) DKTypewritterLabelAnimationSpeed animationsSpeed;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.animationsSpeed = DKTypewritterLabelAnimationSpeedFast;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(test)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(openSpeedPicker)];
    
    self.testLabel.text = self.testLabel2.text = self.testLabel3.text = @"";
    
    self.texts = @[@"Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                   @"This is another text, about life, death, love and donuts.",
                   @"Regarding Nietsche, he's a fucker.",
                   @"I totally agree with your methods of acquisition dear Gerald.",
                   @"Bleh, blah, bloh, GET AWAY!"];
    
    [self speedToTitle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test {
    NSUInteger randomIndex = arc4random() % [self.texts count];
    NSInteger randomSpeed = arc4random() % 5;
    
    [self.testLabel setText:[self.texts objectAtIndex:randomIndex]
         withAnimationSpeed:self.animationsSpeed
                 completion:^{
                     NSLog(@"%@ is logging from within.", [self class]);
                 }];
    
    randomIndex = arc4random() % [self.texts count];
    randomSpeed = arc4random() % 5;
    [self.testLabel2 setText:[self.texts objectAtIndex:randomIndex] withCustomAnimationSpeed:0.3
                  completion:^{
                      NSLog(@"%@ is logging from within.", [self class]);
                  }];
    
    randomIndex = arc4random() % [self.texts count];
    randomSpeed = arc4random() % 5;
    [self.testLabel3 setText:[self.texts objectAtIndex:randomIndex] withCustomAnimationSpeed:0.001
                  completion:^{
                      NSLog(@"%@ is logging from within.", [self class]);
                  }];
}

- (void)openSpeedPicker {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"" message:@"Speed : " preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *verySlowAction = [UIAlertAction actionWithTitle:@"Very Slow" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.animationsSpeed = DKTypewritterLabelAnimationSpeedVerySlow;
        [self speedToTitle];
    }];
    
    UIAlertAction *slowAction = [UIAlertAction actionWithTitle:@"Slow" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.animationsSpeed = DKTypewritterLabelAnimationSpeedSlow;
        [self speedToTitle];
    }];
    
    UIAlertAction *normalAction = [UIAlertAction actionWithTitle:@"Normal" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.animationsSpeed = DKTypewritterLabelAnimationSpeedNormal;
        [self speedToTitle];
    }];
    
    UIAlertAction *fastAction = [UIAlertAction actionWithTitle:@"Fast" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.animationsSpeed = DKTypewritterLabelAnimationSpeedFast;
        [self speedToTitle];
    }];
    
    UIAlertAction *veryFastAction = [UIAlertAction actionWithTitle:@"Very Fast" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.animationsSpeed = DKTypewritterLabelAnimationSpeedVeryFast;
        [self speedToTitle];
    }];
    
    [controller addAction:verySlowAction];
    [controller addAction:slowAction];
    [controller addAction:normalAction];
    [controller addAction:fastAction];
    [controller addAction:veryFastAction];
    
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)speedToTitle {
    switch (self.animationsSpeed) {
        case DKTypewritterLabelAnimationSpeedVerySlow:
            self.navigationItem.title = @"Very Slow";
            break;
        case DKTypewritterLabelAnimationSpeedSlow:
            self.navigationItem.title = @"Slow";
            break;
        case DKTypewritterLabelAnimationSpeedNormal:
            self.navigationItem.title = @"Normal";
            break;
        case DKTypewritterLabelAnimationSpeedFast:
            self.navigationItem.title = @"Fast";
            break;
        case DKTypewritterLabelAnimationSpeedVeryFast:
            self.navigationItem.title = @"Very Fast";
            break;
        default:
            break;
    }
    
}

@end
