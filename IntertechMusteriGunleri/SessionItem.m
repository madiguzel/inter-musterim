//
//  SessionItem.m
//  IntertechMusteriGunleri
//
//  Created by Murat Adıgüzel on 22/03/2017.
//  Copyright © 2017 INTERTECH A.Ş. All rights reserved.
//

#import "SessionItem.h"

@implementation SessionItem

+ (NSArray <SessionItem *> *)allItems {
    NSMutableArray <SessionItem *> *sessionItemList = [@[] mutableCopy];
    
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"SessionItems" ofType:@"plist"];
    NSData * plistData = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    
    NSError * error;
    NSPropertyListFormat format = NSPropertyListXMLFormat_v1_0;
    NSArray * sessionItems = [NSPropertyListSerialization propertyListWithData:plistData options:NSPropertyListImmutable format:&format error:&error];
    
    for (NSDictionary *sessionItemDict in sessionItems) {
        SessionItem *sessionItem = [[SessionItem alloc] init];
        
        sessionItem.sessionTitle = sessionItemDict[@"SessionTitle"];
        sessionItem.sessionContent = sessionItemDict[@"SessionContent"];
        sessionItem.sessionType = [sessionItemDict[@"SessionType"] integerValue];
        
        [sessionItemList addObject:sessionItem];
    }
    
    return sessionItemList;
}

@end
