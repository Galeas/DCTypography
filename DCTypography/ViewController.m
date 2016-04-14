//
//  ViewController.m
//  DCTypography
//
//  Created by Евгений Браницкий on 13.04.16.
//  Copyright © 2016 Akki. All rights reserved.
//

#import "ViewController.h"
#import "DCTypography/DCTypography.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DCTypographyStyle *style = [DCTypographyStyle styleWithName:@"regular"];
    [style setFont:[UIFont fontWithName:@"HelvetivaNeue" size:24]];
    [style setForegroundColor:[UIColor redColor]];
    [style setBackgroundColor:[UIColor yellowColor]];
    [style setTrackingValue:10 fromPhotoshop:NO];
    [style setLinespacing:24];
    [DCTypography addStyle:style];
    
    DCTypographyStyle *style1 = [DCTypographyStyle styleWithName:@"bold"];
    [style1 setFont:[UIFont systemFontOfSize:10 weight:UIFontWeightBlack]];
    [style1 setForegroundColor:[UIColor blueColor]];
    [style1 setBackgroundColor:[UIColor greenColor]];
    [DCTypography addStyle:style1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.lbl setAttributedText:[DCTypography attributedStringWithContents:@"Lorem Ipsum dolOn Sit ameT" styleName:@"regular"]];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView transitionWithView:self.lbl duration:.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                [self.lbl setAttributedText:[DCTypography attributedStringWithContents:@"Lorem Ipsum dolOn Sit ameT" styleName:@"bold"]];
            } completion:nil];
        });
    });
}

@end
