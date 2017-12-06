//
//  CatalogueViewController.m
//  IntertechMusteriGunleri
//
//  Created by Murat Adıgüzel on 20/03/2017.
//  Copyright © 2017 INTERTECH A.Ş. All rights reserved.
//

#import "CatalogueViewController.h"
#import "CatalogueDetailViewController.h"
#import "CatalogueCell.h"

@interface CatalogueViewController () <UITableViewDataSource, UITableViewDelegate, CatalogueCellDelegate>

@property (strong, nonatomic) NSArray <CatalogueItem *> *catalogueItems;
@property (weak, nonatomic) CatalogueItem *selectedCatalogueItem;
@property (weak, nonatomic) IBOutlet UITableView *catalogueTableView;

@end

@implementation CatalogueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.catalogueItems = [CatalogueItem allItems];
    self.catalogueTableView.contentInset = UIEdgeInsetsMake(5, 0, 5, 0);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:ShowCatalogueDetailPage]) {
        CatalogueDetailViewController *catalogueDetailVC = (CatalogueDetailViewController *) segue.destinationViewController;
        catalogueDetailVC.catalogueItem = self.selectedCatalogueItem;
    }
}

#pragma mark - UITableViewDataSource - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.catalogueItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CatalogueCell *cell = (CatalogueCell *)[tableView dequeueReusableCellWithIdentifier:@"CatalogueCell" forIndexPath:indexPath];
    
    cell.catalogueItem = self.catalogueItems[indexPath.row];
    cell.delegate = self;
    
    return cell;
}

#pragma mark - CatalogueCellDelegate

- (void)catalogueCellDetailClicked:(CatalogueCell *)catalogueCell {
    self.selectedCatalogueItem = catalogueCell.catalogueItem;
    [self performSegueWithIdentifier:ShowCatalogueDetailPage sender:self];
}

@end
