//
//  VCTableViewCell.h
//  VCChat
//
//  Created by ravenchen on 1/21/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCCellInfo.h"
@interface VCTableViewCell : UITableViewCell
-(void) updateCell:(VCCellInfo *) cellinfo;
@end
