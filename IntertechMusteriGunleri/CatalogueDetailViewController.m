//
//  CatalogueDetailViewController.m
//  IntertechMusteriGunleri
//
//  Created by Murat Adıgüzel on 20/03/2017.
//  Copyright © 2017 INTERTECH A.Ş. All rights reserved.
//

#import "CatalogueDetailViewController.h"
#import "GTMNSString+HTML.h"

@interface CatalogueDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *catalogueImageView;
@property (weak, nonatomic) IBOutlet UILabel *catalogueContentLabel;

@end

@implementation CatalogueDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setCatalogueContent];
}

- (void)setCatalogueContent {
    self.navigationItemTitleLabel.text = self.catalogueItem.catalogueTitle;
    self.catalogueImageView.image = self.catalogueItem.catalogueImage;
    
    NSString *formattedHtmlText = [self getFormattedHTMLTextWithText:self.catalogueItem.catalogueContent];
    
    NSData *htmlData = [formattedHtmlText dataUsingEncoding:NSUnicodeStringEncoding];
    NSString *htmlString = [[NSString alloc] initWithData:htmlData encoding:NSUnicodeStringEncoding];
    htmlString = [htmlString gtm_stringByUnescapingFromHTML];
    
    self.catalogueContentLabel.attributedText =  [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
}


- (NSString *)getFormattedHTMLTextWithText:(NSString*)text{
    NSString *htmlbody=[NSString stringWithFormat:@"<!DOCTYPE html>"
                        "<html>"
                        "<head>"
                        "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />"
                        "<meta name=\"viewport\" content=\"initial-scale=1, user-scalable=no\" />"
                        "<font face=\"MyriadPro-Regular\" size=4 color=\"#686868\">%@</font>"
                        "<body style=”background-color:transparent”>"
                        "</body>"
                        "</html>",text];
    
    return htmlbody;
    
}

@end
