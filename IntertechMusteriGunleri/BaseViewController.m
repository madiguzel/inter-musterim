//
//  BaseViewController.m
//  IntertechMusteriGunleri
//
//  Created by Murat Adıgüzel on 20/03/2017.
//  Copyright © 2017 INTERTECH A.Ş. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *newBackButton =
    [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [[self navigationItem] setBackBarButtonItem:newBackButton];
    [self setUpNavigationBar];
}

- (void)setUpNavigationBar {
    self.navigationItemTitleLabel.frame = CGRectMake(-40, -CGRectGetHeight(self.navigationItemTitleLabel.frame) / 5, CGRectGetWidth([UIScreen mainScreen].bounds) - 60, CGRectGetHeight(self.navigationItemTitleLabel.frame));
    
    UIView *containerView = [[UIView alloc] initWithFrame:self.navigationItemTitleLabel.bounds];
    containerView.clipsToBounds = NO;
    [containerView addSubview:self.navigationItemTitleLabel];
    
    self.navigationItem.titleView = containerView;
}

- (IBAction)clickedBackButton {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
