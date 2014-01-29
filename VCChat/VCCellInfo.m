//
//  VCCellInfo.m
//  VCChat
//
//  Created by ravenchen on 1/21/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import "VCCellInfo.h"

@implementation VCCellInfo
-(void)setAttributesCellIdentifier:(NSString * )CellIdentifier Height:(float)height Title:(NSString *)Title subTitle1:(NSString *)subTitle1 subTitle2:(NSString *)subTitle2 BigIcon:(UIImage *)BigIcon smallIcon:(UIImage *)smallIcon
{
    self.CellIdentifier=CellIdentifier;
    self.height=height;
    self.Title=Title;
    self.subTitle1=subTitle1;
    self.subTitle2=subTitle2;
    self.BigIcon=BigIcon;
    self.smallIcon=smallIcon;
}
@end
