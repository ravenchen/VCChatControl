//
//  VCContactListDataSource.m
//  VCChat
//
//  Created by ravenchen on 1/26/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import "VCContactListDataSource.h"
#import "VCTableInfo.h"
#import "VCSectionInfo.h"
#import "VCCellInfo.h"
#import "VCChatCellInfo.h"
#import "VCChatInputController.h"
@implementation VCContactListDataSource
-(VCTableInfo *)generateTableInfo
{
    VCTableInfo * tableInfo=[[VCTableInfo alloc]init];
    tableInfo.rowDisplayAnimation=DISPLAY_ROTATE_TRANSPARENT;
    tableInfo.navTitle=@"Contacts";
    tableInfo.enableEdit=YES;
    //tableInfo.fixedBottomBar=[[VCChatInputController alloc]init];
    for(int i=0;i<5;i++)
    {
        VCSectionInfo * sectionInfo=[[VCSectionInfo alloc]init];
        for(int j=0;j<5;j++)
        {
            VCCellInfo * cellInfo=[[VCCellInfo alloc]init];
            [cellInfo setAttributesCellIdentifier:@"VCBaseCell" Height:44 Title:@"Title" subTitle1:@"subTitle1" subTitle2:@"subTitle2" BigIcon:nil smallIcon:nil];
            [sectionInfo.cells addObject:cellInfo];
        }
        [tableInfo.sections addObject:sectionInfo];
    }
    return tableInfo;
}
@end
