//
//  VCBaseCell.m
//  VCChat
//
//  Created by ravenchen on 1/21/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import "VCBaseCell.h"

@implementation VCBaseCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void) setInfo:(VCCellInfo *) cellInfo
{
    [self.textLabel setText:cellInfo.Title];
    [self.textLabel setTextColor:[[UIColor alloc]initWithRed:40.0f/255.0f green:203.0f/255.0f blue:252.0f/255.0f alpha:1.0]];
    [self.detailTextLabel setText:cellInfo.subTitle1];
    [self.detailTextLabel setTextColor:[UIColor grayColor]];
    //[self.imageView.layer setCornerRadius:17];
    //[self.imageView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    //[self.imageView.layer setBorderWidth:1.0];
}
@end
