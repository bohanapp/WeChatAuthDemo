//
//  CommentReplyFooterView.m
//  wechatauthdemo
//
//  Created by WeChat on 20/10/2015.
//  Copyright © 2015 Tencent. All rights reserved.
//

#import "CommentReplyFooterView.h"

@implementation CommentReplyFooterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)onClickButton:(id)sender {
    self.onClick != nil ? self.onClick() : nil;
}

@end
