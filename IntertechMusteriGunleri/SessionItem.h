//
//  SessionItem.h
//  IntertechMusteriGunleri
//
//  Created by Murat Adıgüzel on 22/03/2017.
//  Copyright © 2017 INTERTECH A.Ş. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SessionType) {
    Session = 0,
    Break,
};

@interface SessionItem : NSObject

@property (strong, nonatomic) NSString *sessionTitle;
@property (strong, nonatomic) NSString *sessionContent;
@property (assign) SessionType sessionType;

+ (NSArray <SessionItem *> *)allItems;

@end
