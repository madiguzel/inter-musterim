//
//  CatalogueItem.h
//  IntertechMusteriGunleri
//
//  Created by Murat Adıgüzel on 20/03/2017.
//  Copyright © 2017 INTERTECH A.Ş. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CatalogueItem : NSObject

@property (strong, nonatomic) NSString *catalogueTitle;
@property (strong, nonatomic) UIImage *catalogueImage;
@property (strong, nonatomic) NSString *catalogueContent;

+ (NSArray <CatalogueItem *> *)allItems;

@end
