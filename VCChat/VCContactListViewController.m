//
//  VCContactListViewController.m
//  VCChat
//
//  Created by ravenchen on 1/26/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import "VCContactListViewController.h"
#import "VCConversationViewController.h"
#import "VCChatDataSource.h"
@interface VCContactListViewController ()

@end

@implementation VCContactListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    VCBaseTableController * btc=[[VCConversationViewController alloc]initWithNibName:@"VCBaseTableController" andDataSource:[[VCChatDataSource alloc]init]];
    [self.navigationController pushViewController:btc animated:YES];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
