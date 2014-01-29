//
//  GenerateTabledata.m
//  VCChat
//
//  Created by ravenchen on 1/21/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//
/*
 @interface VCTableInfo : VCBaseStore
 @property (nonatomic) NSMutableArray * sections;
 @property (nonatomic) UIViewController * fixedBottomBar;
 @property (nonatomic) float fixedBottomBarHeight;
 @property (nonatomic) NSString * navTitle;
 @property (nonatomic) NSString * enableEdit;
 @end
 */

#import "GenerateTabledata.h"
#import "VCChatInputController.h"
#import "VCCellTextGenerator.h"
#import "VCChatBubbleUtil.h"
#import "VCChatCellInfo.h"
@implementation GenerateTabledata
static UIFont * currentFont;
-(VCTableInfo *)generateTableInfo
{
    VCTableInfo * tableInfo=[[VCTableInfo alloc]init];
    tableInfo.navTitle=@"Conversation";
    tableInfo.enableEdit=NO;
    tableInfo.fixedBottomBar=[[VCChatInputController alloc]init];
    tableInfo.rowDisplayAnimation=DISPLAY_SLIDELEFT_TRANSPARENT;
    for(int i=0;i<1;i++)
    {
        VCSectionInfo * sectionInfo=[[VCSectionInfo alloc]init];
      //  sectionInfo.headerTitle=@"headerTitle";
      //  UILabel * l=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
      //  sectionInfo.footerView=l;
       // [l setText:@"Footer"];
       // sectionInfo.footerTitle=@"footerTitle";
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

-(VCTableInfo *)generateBasicTableInfo
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
