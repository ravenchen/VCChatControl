//
//  GenerateTabledata.h
//  VCChat
//
//  Created by ravenchen on 1/21/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VCCellInfo.h"
#import "VCSectionInfo.h"
#import "VCTableInfo.h"
@interface GenerateTabledata : NSObject
-(VCTableInfo *)generateTableInfo;
-(VCTableInfo *)generateBasicTableInfo;
@end
