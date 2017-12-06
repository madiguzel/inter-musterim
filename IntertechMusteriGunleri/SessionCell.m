//
//  SessionCell.m
//  IntertechMusteriGunleri
//
//  Created by Murat Adıgüzel on 22/03/2017.
//  Copyright © 2017 INTERTECH A.Ş. All rights reserved.
//

#import "SessionCell.h"
#import "Constants.h"
#import "NSAttributedString+DDHTML.h"

@interface SessionCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIView *contentHolderView;

@end

@implementation SessionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentHolderView.layer.borderColor = DarkColor().CGColor;
    self.contentHolderView.layer.borderWidth = 1.0;
}

- (void)setSessionItem:(SessionItem *)sessionItem {
    _sessionItem = sessionItem;
    
    NSMutableAttributedString *titleAttributedString = [[NSAttributedString attributedStringFromHTML:sessionItem.sessionTitle normalFont:LightFont(13.0) boldFont:BoldFontName(13.0) italicFont:ItalicFontName(13.0)] mutableCopy];
    [titleAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, titleAttributedString.length)];
    self.titleLabel.attributedText = titleAttributedString;
    
    if (sessionItem.sessionContent) {
        NSMutableAttributedString *contentAttributedString = [[NSAttributedString attributedStringFromHTML:sessionItem.sessionContent normalFont:NormalFont(13.0) boldFont:BoldFontName(13.0) italicFont:ItalicFontName(13.0)] mutableCopy];
        [contentAttributedString addAttribute:NSForegroundColorAttributeName value:DarkColor() range:NSMakeRange(0, titleAttributedString.length)];
        self.contentLabel.attributedText = contentAttributedString;
    }
}

- (void)prepareForReuse {
    self.titleLabel.text = nil;
    self.contentLabel.text = nil;
}

@end
