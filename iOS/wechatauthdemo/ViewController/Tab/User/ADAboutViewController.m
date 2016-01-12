//
//  AboutViewController.m
//  AuthSDKDemo
//
//  Created by WeChat on 14/08/2015.
//  Copyright (c) 2015 Tencent. All rights reserved.
//

#import "ADAboutViewController.h"
#import "ADShareViewController.h"
#import <MessageUI/MFMailComposeViewController.h>

static NSString* const kTitleText = @"关于我们";
static NSString* const kAboutUsText = @"WeDemo为微信团队开源项目，用于微信开发者进行微信登录、分享功能开发时的参考Demo。微信开发者可以参考项目中的代码来开发应用，也可以直接使用项目中的代码到自己的App中。\n开发者可以自由使用并传播本代码。\n\n源代码下载地址：\n https://github.com/weixin-open/WeChatAuthDemo\n\n联系我们：\nopen@wechat.com";

@interface ADAboutViewController ()<UITextViewDelegate>

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) NSString *savedString;

@end

@implementation ADAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = kTitleText;
    [self.view addSubview:self.textView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.textView.frame = CGRectMake(inset,
                                     inset,
                                     ScreenWidth-inset * 2,
                                     ScreenHeight-inset-navigationBarHeight-statusBarHeight);
}

#pragma mark - TextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    if ([[URL scheme] isEqualToString:@"https"]) {
        // do something with this username
        // ...
        ADShareViewController *shareView = [[ADShareViewController alloc] init];
        shareView.title = @"源码";
        shareView.urlString = [URL absoluteString];
        [self.navigationController pushViewController:shareView
                                             animated:YES];
        return NO;
    }
    return YES; // let the system open this URL
}

#pragma mark - Lazy Initializers
- (UITextView *)textView {
    if (_textView == nil) {
        _textView = [[UITextView alloc] init];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:kAboutUsText attributes:@{
                                                                                                                                  NSFontAttributeName: [UIFont fontWithName:kChineseFont size:17]
                                                                                                                                  }];
        [attributedString addAttribute:NSLinkAttributeName
                                 value:@"https://github.com/weixin-open/WeChatAuthDemo"
                                 range:[[attributedString string] rangeOfString:@"https://github.com/weixin-open/WeChatAuthDemo"]];
        
        NSDictionary *linkAttributes = @{NSForegroundColorAttributeName: [UIColor linkButtonColor],
                                         NSUnderlineColorAttributeName: [UIColor lightGrayColor],
                                         NSUnderlineStyleAttributeName: @(NSUnderlinePatternSolid)};
        _textView.linkTextAttributes = linkAttributes; // customizes the appearance of links
        _textView.attributedText = attributedString;
        _textView.delegate = self;
        _textView.editable = NO;
    }
    return _textView;
}

@end
