//
//  VCCellInfo.h
//  VCChat
//
//  Created by ravenchen on 1/21/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VCBaseStore.h"
@interface VCCellInfo : VCBaseStore
@property (nonatomic) NSString * CellIdentifier;
@property (nonatomic) float height;
@property (nonatomic) NSString * Title;
@property (nonatomic) NSString * subTitle1;
@property (nonatomic) NSString * subTitle2;
@property (nonatomic) UIImage * BigIcon;
@property (nonatomic) UIImage * smallIcon;
/*   setSelected:(BOOL)selected animated:(BOOL)animated  */

-(void)setAttributesCellIdentifier:(NSString * )CellIdentifier Height:(float)height Title:(NSString *)Title subTitle1:(NSString *)subTitle1 subTitle2:(NSString *)subTitle2 BigIcon:(UIImage *)BigIcon smallIcon:(UIImage *)smallIcon;
@end
