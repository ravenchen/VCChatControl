//
//  VCChatInputController.h
//  VCChat
//
//  Created by ravenchen on 1/22/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCCustomInputViewController.h"
@interface VCChatInputController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *inputField;
@property (weak,nonatomic) UIViewController * parentTableView;
@property (nonatomic,strong) UIViewController * customInputView;
- (IBAction)displayCustomInputView:(id)sender;
- (IBAction)sendMsg:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *sendButton;
@end
