//
//  VCCustomInputViewController.m
//  VCChat
//
//  Created by ravenchen on 1/23/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import "VCCustomInputViewController.h"
#import "VCImageCellInfo.h"
#import "VCMapVIewViewController.h"
static UIColor * bgColor;
@interface VCCustomInputViewController ()

@end

@implementation VCCustomInputViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if(!bgColor)
    {
        bgColor=[[UIColor alloc]initWithRed:40.0/255.5f green:202.0f/255.0f blue:252.0f/255.0f alpha:1];
    }
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.audioRecorder=[[VCAudioRecorder alloc]init];
    self.imagePicker=[[UIImagePickerController alloc]init];
    [self.imagePicker setDelegate:self];
    self.imagePicker.allowsEditing = YES;
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self.tabBar setDelegate:self];
    self.sendRecord=NO;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissKeyboard:(id)sender {
    [self.containerViewController performSelector:@selector(dismissKeyboard:) withObject:self.parentViewController];
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if(item.tag==0)
    {
        [self selectPhoto];
    }
    else if(item.tag==1)
    {
        [self takePhoto];
    }
    if(item.tag==2)
    {
        [self sendLocation];
    }
}
-(void) sendLocation
{
    VCBaseTableController * baseTC= (VCBaseTableController *)[self.containerViewController.view.layer valueForKey:@"TableView"];
    VCMapVIewViewController * mapView=[[VCMapVIewViewController alloc]init];
    VCChatCellInfo * cellInfo=[[VCChatCellInfo alloc]initWithDisplayTime:NO Direction:NO View:mapView.view];
    [[cellInfo getStore] setValue:mapView forKey:@"mapView"];
    [baseTC appendCellAtSection:0 withCellInfo:cellInfo];
}
- (void)selectPhoto {
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    VCBaseTableController * baseTC= (VCBaseTableController *)[self.containerViewController.view.layer valueForKey:@"TableView"];
    [baseTC presentViewController:self.imagePicker animated:YES completion:NULL];
}
-(void) takePhoto
{
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    VCBaseTableController * baseTC= (VCBaseTableController *)[self.containerViewController.view.layer valueForKey:@"TableView"];
    [baseTC presentViewController:self.imagePicker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    VCImageCellInfo * imageView=[[VCImageCellInfo alloc]initWithImage:chosenImage];
    [imageView setFrame:CGRectMake(0, 0, 60, 60)];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [imageView.layer setMasksToBounds:YES];
    [imageView setUserInteractionEnabled:YES];
    UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc]initWithTarget:imageView action:@selector(showOverLayImage)];
    [imageView addGestureRecognizer:tap];
    VCBaseTableController * baseTC= (VCBaseTableController *)[self.containerViewController.view.layer valueForKey:@"TableView"];
    VCChatCellInfo * cellInfo=[[VCChatCellInfo alloc]initWithDisplayTime:NO Direction:NO View:imageView];
    [picker dismissViewControllerAnimated:NO completion:NULL];
    [baseTC appendCellAtSection:0 withCellInfo:cellInfo];
    
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (IBAction)startRecord:(UIButton *)sender {
    [sender setBackgroundColor:bgColor];
    [sender setTitleColor:[UIColor groupTableViewBackgroundColor] forState:UIControlStateNormal];
    [self.audioRecorder startRecording];
}

- (IBAction)EndRecord:(UIButton *)sender {
    [sender setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [sender setTitleColor:bgColor forState:UIControlStateNormal];
    [self.cancelBut setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    NSData * data=[self.audioRecorder stopRecording];
    VCBaseTableController * baseTC= (VCBaseTableController *)[self.containerViewController.view.layer valueForKey:@"TableView"];
    UIButton * but=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [but setImage:[UIImage imageNamed:@"cassette_icon&32.png"] forState:UIControlStateNormal];
    [but.layer setValue:data forKey:@"sound"];
    [but addTarget:self action:@selector(playSound:) forControlEvents:UIControlEventTouchDown];
    VCChatCellInfo * cellInfo=[[VCChatCellInfo alloc]initWithDisplayTime:NO Direction:NO View:but];
    [baseTC appendCellAtSection:0 withCellInfo:cellInfo];
    //insert
}
-(IBAction)playSound:(UIButton *)sender
{
    //NSLog(@"playSound: %@",[sender.layer valueForKey:@"sound"]);
     NSData * data=(NSData *)[sender.layer valueForKey:@"sound"];
    [self.audioRecorder playRecording:data];
}


- (IBAction)DragExit:(UIButton *)sender {
    [sender setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [sender setTitleColor:bgColor forState:UIControlStateNormal];
    [self.cancelBut setBackgroundColor:bgColor];
}

- (IBAction)DragEnter:(UIButton *)sender {
    [sender setBackgroundColor:bgColor];
    [sender setTitleColor:[UIColor groupTableViewBackgroundColor] forState:UIControlStateNormal];
    [self.cancelBut setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

- (IBAction)Cancel:(UIButton *)sender {
    [self.cancelBut setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [self.audioRecorder stopRecording];
}

@end
