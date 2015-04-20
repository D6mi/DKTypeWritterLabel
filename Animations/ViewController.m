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
    
    self.testLabel.text = @"";
    
    self.texts = @[@"Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                   @"This is another text, about life, death, love and donuts.",
                   @"Regarding Nietsche, he's a fucker.",
                   @"I totally agree with your methods of acquisition dear Gerald.",
                   @"Bleh, blah, bloh, GET AWAY!"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test {
    NSUInteger randomIndex = arc4random() % [self.texts count];
    
    [self.testLabel setText:[self.texts objectAtIndex:randomIndex]
                   animated:YES
         withAnimationSpeed:self.animationsSpeed
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
    
    [controller addAction:verySlowAction];
    [controller addAction:slowAction];
    [controller addAction:normalAction];
    [controller addAction:fastAction];
    
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
        default:
            break;
    }

}

@end