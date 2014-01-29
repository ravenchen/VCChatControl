//
//  VCHint.h
//  Components
//
//  Created by Chen, Qiang on 1/27/14.
//  Copyright (c) 2014 Chen, Qiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCHint : UIView
-(id)initWithStr:(NSString *) text timeInterval:(float) time;
-(IBAction)dismiss:(id)sender;
@end
