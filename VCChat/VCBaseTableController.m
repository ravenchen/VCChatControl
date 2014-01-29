//
//  VCBaseTableController.m
//  VCChat
//
//  Created by ravenchen on 1/21/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import "VCBaseTableController.h"
#import "VCBaseCell.h"
@interface VCBaseTableController ()

@end

@implementation VCBaseTableController

-(id)initWithNibName:(NSString *)nibNameOrNil andDataSource:(id<ChatDataSource>)dataSource
{
    self=[super initWithNibName:nibNameOrNil bundle:nil];
    if(self)
    {
        self.dataSource=[dataSource generateTableInfo];
    }
    return self;
}
- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        
    }
    return self;
}
-(void)onInputHide:(NSNotification *)notification
{
    //keyboard will hide
    if(self.keyboardShown)
    {
        double duration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        int curve = [[[notification userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
        // slide view down
        [UIView beginAnimations:@"foo" context:nil];
        [UIView setAnimationDuration:duration];
        [UIView setAnimationCurve:curve];
        [self.footerContainer setFrame:CGRectMake(0, self.footerContainer.frame.origin.y+self.keyboardHeight, 320, self.footerContainer.frame.size.height)];
        [self.tableView setFrame:CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y, self.tableView.frame.size.width, self.tableView.frame.size.height+self.keyboardHeight)];
        [UIView commitAnimations];
        self.keyboardShown=(!self.keyboardShown);
    }
}
-(void)onInputShow:(NSNotification *)notification
{
    float height=[[notification.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    if(self.keyboardHeight==-1)
    {
        self.keyboardHeight=height;
    }
    if(height!=self.keyboardHeight&&self.keyboardShown)
    {
        CGRect start, end;
        // position of keyboard before animation
        [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] getValue:&start];
        // and after..
        [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&end];
        
        double duration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        int curve = [[[notification userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
        [self.tableView setFrame:CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y, self.tableView.frame.size.width, self.tableView.frame.size.height-(height-self.keyboardHeight))];
        [UIView beginAnimations:@"foo" context:nil];
        [UIView setAnimationDuration:duration];
        [UIView setAnimationCurve:curve];
        float maxY=-20;
        if(self.navigationController)
        {
            maxY=-64;
        }
        if(height>self.keyboardHeight)
        {
            [self.tableView setContentOffset:CGPointMake(0, self.tableView.contentOffset.y-self.keyboardHeight+height) animated:YES];
        }
        [self.footerContainer setFrame:CGRectMake(0, self.footerContainer.frame.origin.y+self.keyboardHeight-height, 320, self.footerContainer.frame.size.height)];
        self.keyboardHeight=height;
        [UIView commitAnimations];
        self.keyboardShown=YES;
    }
    else if(!self.keyboardShown)
    {
        CGRect start, end;
        // position of keyboard before animation
        [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] getValue:&start];
        // and after..
        [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&end];
        
        double duration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        int curve = [[[notification userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
        [self.tableView setFrame:CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y, self.tableView.frame.size.width, self.tableView.frame.size.height-self.keyboardHeight)];
        [UIView beginAnimations:@"foo" context:nil];
        [UIView setAnimationDuration:duration];
        [UIView setAnimationCurve:curve];
        float maxY=-20;
        if(self.navigationController)
        {
            maxY=-64;
        }
        [self.tableView setContentOffset:CGPointMake(0, MAX(maxY,self.tableView.contentSize.height-(self.tableView.frame.size.height))) animated:YES];
        [self.footerContainer setFrame:CGRectMake(0, self.footerContainer.frame.origin.y-self.keyboardHeight, 320, self.footerContainer.frame.size.height)];
        [UIView commitAnimations];
        self.keyboardShown=YES;
    }
    
}
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    if(!self.dataSource.fixedBottomBar)
    {
        [self.tableView setFrame:CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y, self.tableView.frame.size.width, self.tableView.frame.size.height+self.footerContainer.frame.size.height)];
        [self.footerContainer setFrame:CGRectMake(self.footerContainer.frame.origin.x, self.footerContainer.frame.origin.y+self.footerContainer.frame.size.height, self.footerContainer.frame.size.width, self.footerContainer.frame.size.height)];
    }
    [self.dataSource.fixedBottomBar.view.layer setValue:self forKey:@"TableView"];
    self.keyboardShown=NO;
    self.keyboardHeight=-1;
    [self registerCellNibs];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    
    if(self.navigationController!=nil)
    {
        [self.navigationItem setTitle:self.dataSource.navTitle];
        if(self.dataSource.enableEdit)
        {
            [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(changeMode:)]];
        }
    }
    else
    {
        
       [self.tableView setFrame:CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y+21, self.tableView.frame.size.width, self.tableView.frame.size.height-20)];
    }
    if(self.dataSource.fixedBottomBar)
    {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(onInputHide:) name:UIKeyboardWillHideNotification object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(onInputShow:) name:UIKeyboardWillShowNotification object:nil];
    }
    [self.footerContainer.layer setShadowColor:[UIColor lightGrayColor].CGColor];
    [self.footerContainer.layer setShadowOpacity:0.15f];
    [self.footerContainer.layer setShadowRadius:2.5f];
    
    if(self.dataSource.fixedBottomBar)
    {
        [self.footerContainer addSubview:self.dataSource.fixedBottomBar.view];
    }
    //[self.tableView setSeparatorInset:UIEdgeInsetsZero];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void) prependCellAtSection:(int ) sectionNum withCellInfo:(VCCellInfo *) cellInfo
{
    VCSectionInfo * sectionInfo=(VCSectionInfo *)[self.dataSource.sections objectAtIndex:sectionNum];
    [sectionInfo.cells insertObject:cellInfo atIndex:0];
    NSIndexPath *path1 = [NSIndexPath indexPathForRow:0 inSection:sectionNum]; //ALSO TRIED WITH indexPathRow:0
    NSArray *indexArray = [NSArray arrayWithObjects:path1,nil];
    [self.tableView insertRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationMiddle];
}
-(void) appendCellAtSection:(int ) sectionNum withCellInfo:(VCCellInfo *) cellInfo
{
    float animationDuration;
    if(self.dataSource.rowDisplayAnimation!=DISPLAY_NONE)
    {
        animationDuration=0.01;
    }
    else
    {
        animationDuration=0.3;
    }
    VCSectionInfo * sectionInfo=(VCSectionInfo *)[self.dataSource.sections objectAtIndex:sectionNum];
    [sectionInfo.cells addObject:cellInfo];
    NSIndexPath *path1 = [NSIndexPath indexPathForRow:sectionInfo.cells.count-1 inSection:sectionNum]; //ALSO TRIED WITH indexPathRow:0
    NSArray *indexArray = [NSArray arrayWithObjects:path1,nil];
    float maxY=-20;
    if(self.navigationController)
    {
        maxY=-64;
    }
    [UIView animateWithDuration:0.01f animations:^{
        [self.tableView setContentOffset:CGPointMake(0, MAX(maxY,self.tableView.contentSize.height+cellInfo.height-(self.tableView.frame.size.height))) animated:NO];
    } completion:^(BOOL finished) {
        [self.tableView insertRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationNone];
    }];
}

-(IBAction)changeMode:(id)sender
{
    if ([self.tableView isEditing]) {
        // If the tableView is already in edit mode, turn it off. Also change the title of the button to reflect the intended verb (‘Edit’, in this case).
        [self.tableView setEditing:NO animated:YES];
        [sender setTitle:@"Edit"];
    }
    else {
        [sender setTitle:@"Done"];
        // Turn on edit mode
        [self.tableView setEditing:YES animated:YES];
    }
}
/******* register cell nibs*******/
-(void)registerCellNibs
{
    for(int i=0;i<self.dataSource.sections.count;i++)
    {
       VCSectionInfo * sectionInfo=[self.dataSource.sections objectAtIndex:i];
        for(int j=0;j<sectionInfo.cells.count;j++)
        {
            VCCellInfo * cellInfo=[sectionInfo.cells objectAtIndex:j];
            [self _registerCellNib:cellInfo.CellIdentifier];
        }
    }
    
}
-(void)_registerCellNib: (NSString *) nibName
{
    if(![self.tableView dequeueReusableCellWithIdentifier:nibName])
    {
        UINib * nib=[UINib nibWithNibName:nibName bundle:nil];
        [[self tableView] registerNib:nib forCellReuseIdentifier:nibName];
    }
}

/***** header ******/
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    VCSectionInfo * info=[[self.dataSource sections] objectAtIndex:section];
    return info.headerView;
}
-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    VCSectionInfo * info=[[self.dataSource sections] objectAtIndex:section];
    if(info.headerView)
    {
        return info.headerView.frame.size.height;
    }
    else if(info.headerTitle)
    {
        return 25;
    }
    else
    {
        return 0;
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    VCSectionInfo * info=[[self.dataSource sections] objectAtIndex:section];
    return info.headerTitle;
}

/****** footer *******/
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    /*if(self.dataSource.fixedBottomBar&&self.dataSource.sections.count==1)
    {
        return Nil;
    }*/
    VCSectionInfo * info=[[self.dataSource sections] objectAtIndex:section];
    return info.footerView;
    
}
-(float)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    /*if(self.dataSource.fixedBottomBar&&self.dataSource.sections.count==1)
    {
        float yPos=self.tableView.frame.size.height-[self.tableView convertPoint:CGPointMake(0, 0) toView:nil].y;
        VCSectionInfo * sectionInfo=[self.dataSource.sections objectAtIndex:0];
        for(int i=0;i<sectionInfo.cells.count;i++)
        {
            VCCellInfo * cellInfo=[sectionInfo.cells objectAtIndex:i];
            yPos-=cellInfo.height;
        }
        
        yPos=MAX(self.dataSource.fixedBottomBar.view.frame.size.height, yPos);
        return yPos;
    }
    else
    {*/
        VCSectionInfo * info=[[self.dataSource sections] objectAtIndex:section];
        if(info.footerView)
        {
            return info.footerView.frame.size.height;
        }
        else if(info.footerTitle)
        {
            return 25;
        }
        else
        {
            return 0;
        }
    //}
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    VCSectionInfo * info=[[self.dataSource sections] objectAtIndex:section];
    return info.footerTitle;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return self.dataSource.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return ((VCSectionInfo *)[self.dataSource.sections objectAtIndex:section]).cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VCCellInfo * cellInfo=(VCCellInfo *) [((VCSectionInfo *)[self.dataSource.sections objectAtIndex:indexPath.section]).cells objectAtIndex:indexPath.row];
    NSString *CellIdentifier = cellInfo.CellIdentifier;
    VCBaseCell *cell = (VCBaseCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    [cell setInfo:cellInfo];
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(self.dataSource.rowDisplayAnimation!=DISPLAY_NONE)
    {
        [cell setAlpha:0.0];
        CATransform3D rotation;
        if(self.dataSource.rowDisplayAnimation==DISPLAY_SLIDELEFT_TRANSPARENT)
        {
            [cell setFrame:CGRectMake(cell.frame.origin.x-cell.frame.size.width, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height)];
        }
        else if(self.dataSource.rowDisplayAnimation==DISPLAY_ROTATE_TRANSPARENT)
        {
            rotation = CATransform3DMakeRotation( -(90.0*M_PI)/180, 0.0, 0.7, 0.4);
            rotation.m34 = 1.0/ -600;
            cell.layer.transform = rotation;
            cell.layer.anchorPoint = CGPointMake(0, 0.5);

        }
        [UIView animateWithDuration:0.3f animations:^{
            [cell setAlpha:1.0f];
            if(self.dataSource.rowDisplayAnimation==DISPLAY_SLIDELEFT_TRANSPARENT)
            {
                [cell setFrame:CGRectMake(cell.frame.origin.x+cell.frame.size.width, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height)];
            }
            else if(self.dataSource.rowDisplayAnimation==DISPLAY_ROTATE_TRANSPARENT)
            {
                cell.layer.transform = CATransform3DIdentity;
                cell.layer.shadowOffset = CGSizeMake(0, 0);
                [cell setFrame:CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height)];
            }
        } completion:^(BOOL finished) {
            //
        }];
    }
}

-(float) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VCSectionInfo * sInfo=[self.dataSource.sections objectAtIndex:indexPath.section];
    VCCellInfo * cInfo=[sInfo.cells objectAtIndex:indexPath.row];
    return cInfo.height;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        UITableViewCell * cell= [tableView cellForRowAtIndexPath:indexPath];
        //CGAffineTransform swingTransform = CGAffineTransformIdentity;
        float duration=0.001f;
        if(self.dataSource.rowRemoveAnimation!=REMOVE_NONE)
        {
            duration=0.4f;
        }
        [UIView animateWithDuration:duration animations:^(void){
            if(self.dataSource.rowRemoveAnimation!=REMOVE_NONE)
            {
                [cell setAlpha:0];
            }
            if(self.dataSource.rowRemoveAnimation==REMOVE_SLIDELEFT_TRANSPARENT)
            {
                [cell setFrame:CGRectMake(-cell.frame.size.width, 0, cell.frame.size.width, cell.frame.size.height)];
            }
            else if(self.dataSource.rowRemoveAnimation==REMOVE_SLIDEUP_TRANSPARENT)
            {
                [cell setFrame:CGRectMake(0, -cell.frame.size.height, cell.frame.size.width, cell.frame.size.height)];
            }
            //[cell.contentView setTransform:swingTransform];
        } completion:^(BOOL finished){
            [((VCSectionInfo *)[self.dataSource.sections objectAtIndex:indexPath.section]).cells removeObjectAtIndex:indexPath.row];
            [tableView reloadData];
        }];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return NO;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Detemine if it's in editing mode
    if (self.editing)
    {
        return UITableViewCellEditingStyleDelete;
    }
    
    return UITableViewCellEditingStyleNone;
}

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */

@end
