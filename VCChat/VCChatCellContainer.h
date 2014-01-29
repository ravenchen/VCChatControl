//
//  VCChatCellControllerCell.h
//  VCChat
//
//  Created by ravenchen on 1/24/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCBaseCell.h"
#import "VCChatCellViewHolder.h"

@interface VCChatCellContainer : VCBaseCell
@property (strong, nonatomic) VCChatCellViewHolder *LeftViewController;
@property (strong, nonatomic) VCChatCellViewHolder *RightViewController;
@end
