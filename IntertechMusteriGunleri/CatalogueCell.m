//
//  CatalogueCell.m
//  IntertechMusteriGunleri
//
//  Created by Murat Adıgüzel on 20/03/2017.
//  Copyright © 2017 INTERTECH A.Ş. All rights reserved.
//

#import "CatalogueCell.h"

@interface CatalogueCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation CatalogueCell

- (void)setCatalogueItem:(CatalogueItem *)catalogueItem {
    _catalogueItem = catalogueItem;
    self.titleLabel.text = catalogueItem.catalogueTitle;
}

- (IBAction)clickedOnCell {
    if ([self.delegate respondsToSelector:@selector(catalogueCellDetailClicked:)]) {
        [self.delegate catalogueCellDetailClicked:self];
    }
}

- (void)prepareForReuse {
    self.titleLabel.text = nil;
}

@end
