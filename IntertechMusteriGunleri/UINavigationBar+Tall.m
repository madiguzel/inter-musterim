//
//  UINavigationBar+Tall.m
//  IntertechMusteriGunleri
//
//  Created by Murat Adıgüzel on 21/03/2017.
//  Copyright © 2017 INTERTECH A.Ş. All rights reserved.
//

#import "UINavigationBar+Tall.h"

@implementation UINavigationBar(Tall)

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), 90);
}

@end
