//
//  VCBaseTableController.h
//  VCChat
//
//  Created by ravenchen on 1/21/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCTableInfo.h"
#import "VCSectionInfo.h"
#import "VCCellInfo.h"
#import "ChatDataSource.h"
@interface VCBaseTableController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) VCTableInfo * dataSource;
@property (nonatomic) Boolean didAppear;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *footerContainer;
@property (nonatomic) int keyboardHeight;
@property (nonatomic) CGPoint originalFrame;
@property (nonatomic) UITableViewRowAnimation rowAddAnimation;
-(void) prependCellAtSection:(int ) sectionNum withCellInfo:(VCCellInfo *) cellInfo;
-(void) appendCellAtSection:(int ) sectionNum withCellInfo:(VCCellInfo *) cellInfo;
-(id)initWithNibName:(NSString *)nibNameOrNil andDataSource:(id<ChatDataSource>)dataSource;
@property (nonatomic) BOOL keyboardShown;
@end
