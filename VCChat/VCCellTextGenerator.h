//
//  UtilManager.h
//  VCChat
//
//  Created by ravenchen on 1/25/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VCCellTextGenerator : NSObject
+(UIView *) getTextViewFromString: (NSString *)str font:(UIFont *) font width:(float)width;
@end
