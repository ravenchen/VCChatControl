//
//  VCBaseStore.h
//  VCChat
//
//  Created by ravenchen on 1/21/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VCBaseStore : NSObject
@property (nonatomic) NSMutableDictionary * dataStore;
-(NSMutableDictionary *) getStore;
@end
