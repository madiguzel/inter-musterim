//
//  AgendaViewController.m
//  IntertechMusteriGunleri
//
//  Created by Murat Adıgüzel on 20/03/2017.
//  Copyright © 2017 INTERTECH A.Ş. All rights reserved.
//

#import "AgendaViewController.h"
#import "SessionItem.h"
#import "SessionCell.h"
#import "BreakCell.h"

@interface AgendaViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray <SessionItem *> *sessionItems;
@property (weak, nonatomic) IBOutlet UITableView *sessionsTableView;
@property (weak, nonatomic) IBOutlet UIView *catalogueButtonContainerView;

@end

@implementation AgendaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpCatalogueButtonContainerView];
    
    self.sessionItems = [SessionItem allItems];
    self.sessionsTableView.contentInset = UIEdgeInsetsMake(5, 0, 5, 0);
    self.sessionsTableView.estimatedRowHeight = 44;
}

- (void)setUpNavigationBar {
    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo-white"]];
    logoView.contentMode = UIViewContentModeScaleAspectFit;
    CGRect logoViewFrame = logoView.frame;
    logoViewFrame.origin.y = 0;
    logoViewFrame.size.height = 44;
    logoView.frame = logoViewFrame;
    
    UIView *containerView = [[UIView alloc] initWithFrame:logoView.bounds];
    containerView.clipsToBounds = NO;
    [containerView addSubview:logoView];
    
    self.navigationItem.titleView = containerView;
}

- (void)setUpCatalogueButtonContainerView {
    self.catalogueButtonContainerView.layer.cornerRadius = 5.0f;
    self.catalogueButtonContainerView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.catalogueButtonContainerView.layer.borderWidth = 1.0f;
}

#pragma mark - UITableViewDataSource - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sessionItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SessionItem *sessionItem = self.sessionItems[indexPath.row];
    
    if (sessionItem.sessionType == Session) {
        SessionCell *sessionCell = (SessionCell *)[tableView dequeueReusableCellWithIdentifier:@"SessionCell" forIndexPath:indexPath];
        sessionCell.sessionItem = sessionItem;
        
        return sessionCell;
        
    } else {
        BreakCell *breakCell = (BreakCell *)[tableView dequeueReusableCellWithIdentifier:@"BreakCell" forIndexPath:indexPath];
        breakCell.sessionItem = sessionItem;
        
        return breakCell;
    }
}

@end
