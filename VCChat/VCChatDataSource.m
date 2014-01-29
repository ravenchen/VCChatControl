//
//  VCChatDataSource.m
//  VCChat
//
//  Created by ravenchen on 1/26/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import "VCChatDataSource.h"
#import "VCTableInfo.h"
#import "VCSectionInfo.h"
#import "VCCellInfo.h"
#import "VCChatCellInfo.h"
#import "VCChatInputController.h"
@implementation VCChatDataSource
-(VCTableInfo *)generateTableInfo
{
    VCTableInfo * tableInfo=[[VCTableInfo alloc]init];
    tableInfo.navTitle=@"Conversation";
    tableInfo.enableEdit=NO;
    tableInfo.fixedBottomBar=[[VCChatInputController alloc]init];
    tableInfo.rowDisplayAnimation=DISPLAY_TRANSPARENT;
    for(int i=0;i<1;i++)
    {
        VCSectionInfo * sectionInfo=[[VCSectionInfo alloc]init];
        for(int j=0;j<30;j++)
        {
            VCChatCellInfo * cellInfo;
            //75 total height 22 original text field 40 calculate field
            int r = arc4random() % 2;
            if(r==0)
            {
                cellInfo=[[VCChatCellInfo alloc]initWithDisplayTime:NO Direction:YES Text:@"asd asd adad sda da dasd aa dad a a aa dadsad a"];
            }
            else
            {
                cellInfo=[[VCChatCellInfo alloc]initWithDisplayTime:YES Direction:NO Text:@"asd asd adad sda da dasd aa dad a a aa dadsad a"];
            }
            [sectionInfo.cells addObject:cellInfo];
        }
        [tableInfo.sections addObject:sectionInfo];
    }
    return tableInfo;
}
@end
