//
//  OUViewController.h
//  Components
//
//  Created by Chen, Qiang on 1/23/14.
//  Copyright (c) 2014 Chen, Qiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCChatCellViewHolder : UIViewController
@property (strong, nonatomic) IBOutlet UIView *timeBg;
@property (strong, nonatomic) IBOutlet UIView *msgBg;
@property (strong, nonatomic) IBOutlet UIImageView *icon;
@property (strong, nonatomic) IBOutlet UIImageView *LeftBottomCorner;
@property (strong, nonatomic) IBOutlet UIImageView *RightBottomCorner;
@property (strong, nonatomic) IBOutlet UILabel * avatarName;
@property (strong, nonatomic) IBOutlet UIImageView * avatar;
@property (strong,nonatomic) IBOutlet UILabel * status;
@property (nonatomic) CGRect originalFrame;
- (void) reloadView:(BOOL)displayTime;
@property (strong,nonatomic) UIView * displayView;
@end
