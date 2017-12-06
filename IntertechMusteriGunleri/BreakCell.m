//
//  BreakCell.m
//  IntertechMusteriGunleri
//
//  Created by Murat Adıgüzel on 22/03/2017.
//  Copyright © 2017 INTERTECH A.Ş. All rights reserved.
//

#import "BreakCell.h"
#import "NSAttributedString+DDHTML.h"
#import "Constants.h"

@interface BreakCell()

@property (weak, nonatomic) IBOutlet UILabel *breakNameLabel;

@end

@implementation BreakCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSessionItem:(SessionItem *)sessionItem {
    _sessionItem = sessionItem;
    
    NSMutableAttributedString *breakNameAttributedString = [[NSAttributedString attributedStringFromHTML:sessionItem.sessionTitle normalFont:NormalFont(13.0) boldFont:BoldFontName(13.0) italicFont:ItalicFontName(13.0)] mutableCopy];
    [breakNameAttributedString addAttribute:NSForegroundColorAttributeName value:DarkColor() range:NSMakeRange(0, breakNameAttributedString.length)];
    self.breakNameLabel.attributedText = breakNameAttributedString;
}

- (void)prepareForReuse {
    self.breakNameLabel.text = nil;
}

@end
