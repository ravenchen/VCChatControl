//
//  VCImageView.h
//  Components
//
//  Created by Chen, Qiang on 1/27/14.
//  Copyright (c) 2014 Chen, Qiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCImageView : UIScrollView <UIScrollViewDelegate>
@property UIImageView * imageView;
-(void)setImage:(UIImage *)img;
@end
