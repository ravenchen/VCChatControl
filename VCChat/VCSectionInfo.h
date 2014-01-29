//
//  VCSectionInfo.h
//  VCChat
//
//  Created by ravenchen on 1/21/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import "VCBaseStore.h"

@interface VCSectionInfo : VCBaseStore
@property (nonatomic) float height;
@property (nonatomic) NSString * headerTitle;
@property (nonatomic) NSString * footerTitle;
@property (nonatomic) UIView * headerView;
@property (nonatomic) UIView * footerView;
@property (nonatomic,strong) NSMutableArray * cells;
@end
