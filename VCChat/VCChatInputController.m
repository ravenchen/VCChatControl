//
//  VCChatInputController.m
//  VCChat
//
//  Created by ravenchen on 1/22/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import "VCChatInputController.h"
#import "VCBaseTableController.h"
#import "VCChatBubbleUtil.h"
#import "VCChatCellInfo.h"
@interface VCChatInputController ()

@end

@implementation VCChatInputController

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
    [self.sendButton.layer setValue:[[UIColor alloc]initWithRed:40.0f/255.0 green:202.0f/255.0f blue:252.0f/255.0f alpha:1] forKey:@"EnableBg"];
    [self.sendButton.layer setValue:[UIColor lightGrayColor] forKey:@"DisableBg"];
    [self.sendButton setBackgroundColor:[self.sendButton.layer valueForKey:@"DisableBg"]];
    VCCustomInputViewController * cvc=[[VCCustomInputViewController alloc]init];
    cvc.containerViewController=self;
    self.customInputView=cvc;
    [self.inputField setDelegate:self];
    [self.inputField addTarget:self action:@selector(debugInfo:)  forControlEvents:UIControlEventEditingChanged];
    [self.inputField addTarget:self
                        action:@selector(focusInputField:)
              forControlEvents:UIControlEventTouchDown];
    [self.inputField.layer setCornerRadius:10.0f];
    [self.inputField.layer setBorderColor:[[UIColor alloc] initWithWhite:0.8 alpha:1].CGColor];
    [self.inputField.layer setBorderWidth:1.0f];
    
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    self.inputField.leftView = paddingView;
    self.inputField.leftViewMode = UITextFieldViewModeAlways;
    self.inputField.rightView = paddingView;
    self.inputField.rightViewMode = UITextFieldViewModeAlways;
    
    [self.sendButton setEnabled:NO];
    [self.sendButton setBackgroundColor:[self.sendButton.layer valueForKey:@"DisableBg"]];
    // Do any additional setup after loading the view from its nib.
}
-(void)focusInputField:(id)sender
{
    [self.inputField setInputView:Nil];
    [self.inputField reloadInputViews];
    [self.inputField becomeFirstResponder];
}
-(void)debugInfo:(id)sender
{
    if([self.inputField.text isEqualToString:@""])
    {
        [self.sendButton setEnabled:NO];
        [self.sendButton setBackgroundColor:[self.sendButton.layer valueForKey:@"DisableBg"]];
    }
    else
    {
        [self.sendButton setEnabled:YES];
        [self.sendButton setBackgroundColor:[self.sendButton.layer valueForKey:@"EnableBg"]];
    }
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if([self.inputField.text isEqualToString:@""])
    {
        [self.sendButton setEnabled:NO];
        [self.sendButton setBackgroundColor:[self.sendButton.layer valueForKey:@"DisableBg"]];
    }
    else
    {
        [self.sendButton setEnabled:YES];
        [self.sendButton setBackgroundColor:[self.sendButton.layer valueForKey:@"EnableBg"]];
    }
    //NSLog(@"beginEdit");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [self.inputField resignFirstResponder];
    return YES;
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.inputField resignFirstResponder];
    return YES;
}
- (IBAction)displayCustomInputView:(id)sender {
    if(self.inputField.inputView!=self.customInputView.view)
    {
        [self.inputField setInputView:self.customInputView.view];
        [self.inputField setInputAccessoryView:nil];
        [self.inputField reloadInputViews];
        [self.inputField becomeFirstResponder];
        
    }
    else
    {
        [self.inputField setInputView:Nil];
        [self.inputField reloadInputViews];
        [self.inputField becomeFirstResponder];
    }
}
- (IBAction)sendMsg:(UIButton *)sender {
    VCBaseTableController * baseTC= (VCBaseTableController *)[self.view.layer valueForKey:@"TableView"];
    VCChatCellInfo * cellInfo=[[VCChatCellInfo alloc]initWithDisplayTime:NO Direction:NO Text:self.inputField.text];
    [baseTC appendCellAtSection:0 withCellInfo:cellInfo];
    [self.inputField setText:@""];
    [self.sendButton setEnabled:NO];
    [self.sendButton setBackgroundColor:[self.sendButton.layer valueForKey:@"DisableBg"]];
}
-(void)dismissKeyboard:(id)sender
{
    [self.inputField resignFirstResponder];
}
@end
