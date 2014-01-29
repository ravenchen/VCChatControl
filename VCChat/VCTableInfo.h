//
//  VCTableInfo.h
//  VCChat
//
//  Created by ravenchen on 1/21/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import "VCBaseStore.h"
typedef enum RowRemoveAnimation
{
    REMOVE_SLIDELEFT_TRANSPARENT,
    REMOVE_SLIDEUP_TRANSPARENT,
    REMOVE_TRANSPARENT,
    REMOVE_NONE,
} RowRemoveAnimation;

typedef enum RowDisplayAnimation
{
    DISPLAY_SLIDELEFT_TRANSPARENT,
    DISPLAY_ROTATE_TRANSPARENT,
    DISPLAY_TRANSPARENT,
    DISPLAY_NONE,
} RowDisplayAnimation;
@interface VCTableInfo : VCBaseStore
@property (nonatomic,strong) NSMutableArray * sections;
@property (nonatomic) UIViewController * fixedBottomBar;
@property (nonatomic) NSString * navTitle;
@property (nonatomic) BOOL enableEdit;
@property (nonatomic) RowRemoveAnimation rowRemoveAnimation;
@property (nonatomic) RowDisplayAnimation rowDisplayAnimation;
@end
