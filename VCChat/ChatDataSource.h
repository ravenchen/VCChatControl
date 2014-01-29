//
//  ChatDataSource.h
//  VCChat
//
//  Created by ravenchen on 1/26/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VCTableInfo.h"
@protocol ChatDataSource
- (VCTableInfo *)generateTableInfo;
@end
