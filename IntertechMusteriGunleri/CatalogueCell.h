//
//  CatalogueCell.h
//  IntertechMusteriGunleri
//
//  Created by Murat Adıgüzel on 20/03/2017.
//  Copyright © 2017 INTERTECH A.Ş. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CatalogueItem.h"

@class CatalogueCell;

@protocol CatalogueCellDelegate <NSObject>

- (void)catalogueCellDetailClicked:(CatalogueCell *)catalogueCell;

@end

@interface CatalogueCell : UITableViewCell

@property (weak, nonatomic) CatalogueItem *catalogueItem;
@property (weak, nonatomic) id <CatalogueCellDelegate> delegate;

@end
