//
//  DCViewController.m
//  DCTypography
//
//  Created by Evgeniy Branitsky on 04/14/2016.
//  Copyright (c) 2016 Evgeniy Branitsky. All rights reserved.
//

#import "DCViewController.h"
#import <DCTypography.h>

@interface DCViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation DCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.label setAttributedText:[DCTypography attributedStringWithContents:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit." styleName:@"style"]];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView transitionWithView:self.label duration:.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            [self.label setAttributedText:[DCTypography attributedStringWithContents:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla leo neque, lacinia id diam at, porta vestibulum ante. Nulla ut risus rutrum neque bibendum porta. Nulla cursus, mi quis consequat rhoncus, nulla dolor maximus lacus, ut egestas leo libero dictum lacus. In purus elit, tincidunt rutrum nisi sit amet, dictum posuere neque." styleName:@"style1"]];
        } completion:nil];
    });
}

@end
