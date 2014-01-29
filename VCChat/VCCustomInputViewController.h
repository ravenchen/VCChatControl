//
//  VCCustomInputViewController.h
//  VCChat
//
//  Created by ravenchen on 1/23/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCBaseTableController.h"
#import "VCChatCellInfo.h"
#import "VCAudioRecorder.h"
#import <QuartzCore/QuartzCore.h>
@interface VCCustomInputViewController : UIViewController <UITabBarDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
- (IBAction)dismissKeyboard:(id)sender;
@property (nonatomic,weak) UIViewController * containerViewController;
@property (strong, nonatomic) IBOutlet UITabBar *tabBar;
@property (strong,nonatomic) UIImagePickerController * imagePicker;
@property (nonatomic) VCAudioRecorder * audioRecorder;
@property (strong, nonatomic) IBOutlet UIButton *cancelBut;
@property (nonatomic) BOOL sendRecord;
- (IBAction)startRecord:(UIButton *)sender;
- (IBAction)EndRecord:(UIButton *)sender;
- (IBAction)DragExit:(UIButton *)sender;
- (IBAction)DragEnter:(UIButton *)sender;
- (IBAction)Cancel:(UIButton *)sender;
@end
