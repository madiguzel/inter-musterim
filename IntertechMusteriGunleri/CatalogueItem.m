//
//  CatalogueItem.m
//  IntertechMusteriGunleri
//
//  Created by Murat Adıgüzel on 20/03/2017.
//  Copyright © 2017 INTERTECH A.Ş. All rights reserved.
//

#import "CatalogueItem.h"

@implementation CatalogueItem

+ (NSArray <CatalogueItem *> *)allItems {
    NSMutableArray <CatalogueItem *> *catalogueItemList = [@[] mutableCopy];
    
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"CatalogueItems" ofType:@"plist"];
    NSData * plistData = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    
    NSError * error;
    NSPropertyListFormat format = NSPropertyListXMLFormat_v1_0;
    NSArray * catalogueItems = [NSPropertyListSerialization propertyListWithData:plistData options:NSPropertyListImmutable format:&format error:&error];
    
    for (NSDictionary *catalogueItemDict in catalogueItems) {
        CatalogueItem *catalogueItem = [[CatalogueItem alloc] init];
        
        catalogueItem.catalogueTitle = catalogueItemDict[@"CatalogueTitle"];
        catalogueItem.catalogueImage = [UIImage imageNamed:catalogueItemDict[@"CatalogueImage"]];
        catalogueItem.catalogueContent = catalogueItemDict[@"Content"];
 
        [catalogueItemList addObject:catalogueItem];
    }
    
    return catalogueItemList;
}

@end
