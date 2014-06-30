//
//  SatellitesViewController.m
//  Satellites
//
//  Created by Bridget Johnson on 15/02/14.
//  Copyright (c) 2014 bdj. All rights reserved.
//  Test edit by Jim

#import "SatellitesViewController.h"

@interface SatellitesViewController ()

//networking input outlets
@property (strong, nonatomic) IBOutlet UITextField *IPinputField;
@property (strong, nonatomic) IBOutlet UITextField *PortInputField;
@property (strong, nonatomic) IBOutlet UIButton *panelOne_OneOutlet;


//ids for the buttons
- (IBAction)HomeButton:(id)sender;
- (IBAction)connectButton:(id)sender;

//positions for first Panel buttons
- (IBAction)panelOne_One:(id)sender;
- (IBAction)panelOne_Two:(id)sender;
- (IBAction)panelOne_Three:(id)sender;
- (IBAction)panelOne_Four:(id)sender;
- (IBAction)panelOne_Five:(id)sender;
- (IBAction)panelOne_Sixe:(id)sender;
- (IBAction)panelOne_Seven:(id)sender;
- (IBAction)panelOne_Eight:(id)sender;

//positions for second Panel buttons
- (IBAction)panelTwo_One:(id)sender;
- (IBAction)panelTwo_Two:(id)sender;
- (IBAction)panelTwo_Three:(id)sender;
- (IBAction)panelTwo_Four:(id)sender;
- (IBAction)panelTwo_Five:(id)sender;
- (IBAction)panelTwo_Six:(id)sender;
- (IBAction)panelTwo_Seven:(id)sender;
- (IBAction)panelTwo_Eight:(id)sender;

//outlets for the images panelOne
@property (strong, nonatomic) IBOutlet UIImageView *ImageOne_One;
@property (strong, nonatomic) IBOutlet UIImageView *ImageOne_Two;
@property (strong, nonatomic) IBOutlet UIImageView *ImageOne_Three;
@property (strong, nonatomic) IBOutlet UIImageView *ImageOne_Four;
@property (strong, nonatomic) IBOutlet UIImageView *ImageOne_Five;
@property (strong, nonatomic) IBOutlet UIImageView *ImageOne_Six;
@property (strong, nonatomic) IBOutlet UIImageView *ImageOne_Seven;
@property (strong, nonatomic) IBOutlet UIImageView *ImageOne_Eight;

//outlets for the images panelTwo
@property (strong, nonatomic) IBOutlet UIImageView *ImageTwo_ONe;
@property (strong, nonatomic) IBOutlet UIImageView *ImageTwo_Two;
@property (strong, nonatomic) IBOutlet UIImageView *ImageTwo_Three;
@property (strong, nonatomic) IBOutlet UIImageView *ImageTwo_Four;
@property (strong, nonatomic) IBOutlet UIImageView *ImageTwo_Five;
@property (strong, nonatomic) IBOutlet UIImageView *ImageTwo_Six;
@property (strong, nonatomic) IBOutlet UIImageView *ImageTwo_Seven;
@property (strong, nonatomic) IBOutlet UIImageView *ImageTwo_Eight;



@end


@implementation SatellitesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   _manualIP = @"192.168.2.3";
   _manualPort = @"31337";
   
   [self.IPinputField setText:_manualIP];
   [self.PortInputField setText:_manualPort];
}

-(void)viewWillAppear:(BOOL)animated
{
   [self upDateOSC];

}
- (IBAction)addressFieldPressed:(id)sender {
   [self.IPinputField resignFirstResponder];
}
- (IBAction)portFieldPressed:(id)sender {
   [self.PortInputField resignFirstResponder];
}
- (IBAction)iPhonePort:(id)sender {
   [self.PortInputField resignFirstResponder];
}
- (IBAction)iPhoneIP:(id)sender {
   [self.IPinputField resignFirstResponder];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (id) init	{
	if (self = [super init])	{
		//	make an osc manager- i'm using i'm using a custom in-port to record a bunch of extra conversion for the display, but you can just make a "normal" manager
				//	by default, the osc manager's delegate will be told when osc messages are received
		[manager setDelegate:self];
	}
	
	return self;
}


- (IBAction)HomeButton:(id)sender {
   
   [self sendOSC:@"/panelOne" msgFloat:0.0];
   [self sendOSC:@"/panelTwo" msgFloat:0.0];
   
   self.ImageOne_One.backgroundColor = [UIColor whiteColor];
   self.ImageOne_Two.backgroundColor = [UIColor clearColor];
   self.ImageOne_Three.backgroundColor = [UIColor clearColor];
   self.ImageOne_Four.backgroundColor = [UIColor clearColor];
   self.ImageOne_Five.backgroundColor = [UIColor clearColor];
   self.ImageOne_Six.backgroundColor = [UIColor clearColor];
   self.ImageOne_Seven.backgroundColor = [UIColor clearColor];
   self.ImageOne_Eight.backgroundColor = [UIColor clearColor];
   
   self.ImageTwo_ONe.backgroundColor = [UIColor whiteColor];
   self.ImageTwo_Two.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Three.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Four.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Five.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Six.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Seven.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Eight.backgroundColor = [UIColor clearColor];

}

- (IBAction)connectButton:(id)sender {
   _manualIP = [self.IPinputField text];
   _manualPort = [self.PortInputField text];
    [self upDateOSC];
}

- (IBAction)panelOne_One:(id)sender {
   //change this number to be the anlge you want it to go too
   float value = 0;
   [self sendOSC:[NSString stringWithFormat:@"/panelOne"] msgFloat:value];
   self.ImageOne_One.backgroundColor = [UIColor whiteColor];
   self.ImageOne_Two.backgroundColor = [UIColor clearColor];
   self.ImageOne_Three.backgroundColor = [UIColor clearColor];
   self.ImageOne_Four.backgroundColor = [UIColor clearColor];
   self.ImageOne_Five.backgroundColor = [UIColor clearColor];
   self.ImageOne_Six.backgroundColor = [UIColor clearColor];
   self.ImageOne_Seven.backgroundColor = [UIColor clearColor];
   self.ImageOne_Eight.backgroundColor = [UIColor clearColor];
}

- (IBAction)panelOne_Two:(id)sender {
   float value = 45;
   [self sendOSC:[NSString stringWithFormat:@"/panelOne"] msgFloat:value];
   self.ImageOne_One.backgroundColor = [UIColor clearColor];
   self.ImageOne_Two.backgroundColor = [UIColor whiteColor];
   self.ImageOne_Three.backgroundColor = [UIColor clearColor];
   self.ImageOne_Four.backgroundColor = [UIColor clearColor];
   self.ImageOne_Five.backgroundColor = [UIColor clearColor];
   self.ImageOne_Six.backgroundColor = [UIColor clearColor];
   self.ImageOne_Seven.backgroundColor = [UIColor clearColor];
   self.ImageOne_Eight.backgroundColor = [UIColor clearColor];

}

- (IBAction)panelOne_Three:(id)sender {
   float value = 90;
   [self sendOSC:[NSString stringWithFormat:@"/panelOne"] msgFloat:value];
   self.ImageOne_One.backgroundColor = [UIColor clearColor];
   self.ImageOne_Two.backgroundColor = [UIColor clearColor];
   self.ImageOne_Three.backgroundColor = [UIColor whiteColor];
   self.ImageOne_Four.backgroundColor = [UIColor clearColor];
   self.ImageOne_Five.backgroundColor = [UIColor clearColor];
   self.ImageOne_Six.backgroundColor = [UIColor clearColor];
   self.ImageOne_Seven.backgroundColor = [UIColor clearColor];
   self.ImageOne_Eight.backgroundColor = [UIColor clearColor];}

- (IBAction)panelOne_Four:(id)sender {
   float value = 135;
   [self sendOSC:[NSString stringWithFormat:@"/panelOne"] msgFloat:value];
   
   self.ImageOne_One.backgroundColor = [UIColor clearColor];
   self.ImageOne_Two.backgroundColor = [UIColor clearColor];
   self.ImageOne_Three.backgroundColor = [UIColor clearColor];
   self.ImageOne_Four.backgroundColor = [UIColor whiteColor];
   self.ImageOne_Five.backgroundColor = [UIColor clearColor];
   self.ImageOne_Six.backgroundColor = [UIColor clearColor];
   self.ImageOne_Seven.backgroundColor = [UIColor clearColor];
   self.ImageOne_Eight.backgroundColor = [UIColor clearColor];}

- (IBAction)panelOne_Five:(id)sender {
   float value = 180;
   [self sendOSC:[NSString stringWithFormat:@"/panelOne"] msgFloat:value];
   self.ImageOne_One.backgroundColor = [UIColor clearColor];
   self.ImageOne_Two.backgroundColor = [UIColor clearColor];
   self.ImageOne_Three.backgroundColor = [UIColor clearColor];
   self.ImageOne_Four.backgroundColor = [UIColor clearColor];
   self.ImageOne_Five.backgroundColor = [UIColor whiteColor];
   self.ImageOne_Six.backgroundColor = [UIColor clearColor];
   self.ImageOne_Seven.backgroundColor = [UIColor clearColor];
   self.ImageOne_Eight.backgroundColor = [UIColor clearColor];
}

- (IBAction)panelOne_Sixe:(id)sender {
   float value = 225;
   [self sendOSC:[NSString stringWithFormat:@"/panelOne"] msgFloat:value];
   self.ImageOne_One.backgroundColor = [UIColor clearColor];
   self.ImageOne_Two.backgroundColor = [UIColor clearColor];
   self.ImageOne_Three.backgroundColor = [UIColor clearColor];
   self.ImageOne_Four.backgroundColor = [UIColor clearColor];
   self.ImageOne_Five.backgroundColor = [UIColor clearColor];
   self.ImageOne_Six.backgroundColor = [UIColor whiteColor];
   self.ImageOne_Seven.backgroundColor = [UIColor clearColor];
   self.ImageOne_Eight.backgroundColor = [UIColor clearColor];}

- (IBAction)panelOne_Seven:(id)sender {
   float value = 270;
   [self sendOSC:[NSString stringWithFormat:@"/panelOne"] msgFloat:value];
   self.ImageOne_One.backgroundColor = [UIColor clearColor];
   self.ImageOne_Two.backgroundColor = [UIColor clearColor];
   self.ImageOne_Three.backgroundColor = [UIColor clearColor];
   self.ImageOne_Four.backgroundColor = [UIColor clearColor];
   self.ImageOne_Five.backgroundColor = [UIColor clearColor];
   self.ImageOne_Six.backgroundColor = [UIColor clearColor];
   self.ImageOne_Seven.backgroundColor = [UIColor whiteColor];
   self.ImageOne_Eight.backgroundColor = [UIColor clearColor];
}

- (IBAction)panelOne_Eight:(id)sender {
   float value = 315;
   [self sendOSC:[NSString stringWithFormat:@"/panelOne"] msgFloat:value];
   self.ImageOne_One.backgroundColor = [UIColor clearColor];
   self.ImageOne_Two.backgroundColor = [UIColor clearColor];
   self.ImageOne_Three.backgroundColor = [UIColor clearColor];
   self.ImageOne_Four.backgroundColor = [UIColor clearColor];
   self.ImageOne_Five.backgroundColor = [UIColor clearColor];
   self.ImageOne_Six.backgroundColor = [UIColor clearColor];
   self.ImageOne_Seven.backgroundColor = [UIColor clearColor];
   self.ImageOne_Eight.backgroundColor = [UIColor whiteColor];}

- (NSUInteger)supportedInterfaceOrientations
{
      return UIInterfaceOrientationMaskLandscape;
}

-(void)upDateOSC
{
   manager = [[OSCManager alloc] init];
   outPort = [manager createNewOutputToAddress:_manualIP atPort:[_manualPort intValue] withLabel:@"Output"];
}

- (void)sendOSC: (NSString*)msg  msgFloat:(float)msgFloat
{
   
   OSCMessage *newMsg = [OSCMessage createWithAddress:msg];
   [newMsg addFloat:msgFloat];
   [outPort sendThisMessage:newMsg];
}


- (BOOL)shouldAutorotate
{
   return NO;
}

- (IBAction)panelTwo_One:(id)sender {
   float value = 0;
   [self sendOSC:[NSString stringWithFormat:@"/panelTwo"] msgFloat:value];
   self.ImageTwo_ONe.backgroundColor = [UIColor whiteColor];
   self.ImageTwo_Two.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Three.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Four.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Five.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Six.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Seven.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Eight.backgroundColor = [UIColor clearColor];

}

- (IBAction)panelTwo_Two:(id)sender {
   float value = 45;
   [self sendOSC:[NSString stringWithFormat:@"/panelTwo"] msgFloat:value];
   self.ImageTwo_ONe.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Two.backgroundColor = [UIColor whiteColor];
   self.ImageTwo_Three.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Four.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Five.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Six.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Seven.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Eight.backgroundColor = [UIColor clearColor];

}

- (IBAction)panelTwo_Three:(id)sender {
   float value = 90;
   [self sendOSC:[NSString stringWithFormat:@"/panelTwo"] msgFloat:value];
   self.ImageTwo_ONe.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Two.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Three.backgroundColor = [UIColor whiteColor];
   self.ImageTwo_Four.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Five.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Six.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Seven.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Eight.backgroundColor = [UIColor clearColor];
}


- (IBAction)panelTwo_Four:(id)sender {
   float value = 135;
   [self sendOSC:[NSString stringWithFormat:@"/panelTwo"] msgFloat:value];
   self.ImageTwo_ONe.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Two.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Three.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Four.backgroundColor = [UIColor whiteColor];
   self.ImageTwo_Five.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Six.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Seven.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Eight.backgroundColor = [UIColor clearColor];}

- (IBAction)panelTwo_Five:(id)sender {
   float value = 180;
   [self sendOSC:[NSString stringWithFormat:@"/panelTwo"] msgFloat:value];
   self.ImageTwo_ONe.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Two.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Three.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Four.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Five.backgroundColor = [UIColor whiteColor];
   self.ImageTwo_Six.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Seven.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Eight.backgroundColor = [UIColor clearColor];
}

- (IBAction)panelTwo_Six:(id)sender {
   float value = 225;
   [self sendOSC:[NSString stringWithFormat:@"/panelTwo"] msgFloat:value];
   self.ImageTwo_ONe.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Two.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Three.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Four.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Five.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Six.backgroundColor = [UIColor whiteColor];
   self.ImageTwo_Seven.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Eight.backgroundColor = [UIColor clearColor];
}

- (IBAction)panelTwo_Seven:(id)sender {
   float value = 270;
   [self sendOSC:[NSString stringWithFormat:@"/panelTwo"] msgFloat:value];
   self.ImageTwo_ONe.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Two.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Three.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Four.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Five.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Six.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Seven.backgroundColor = [UIColor whiteColor];
   self.ImageTwo_Eight.backgroundColor = [UIColor clearColor];}

- (IBAction)panelTwo_Eight:(id)sender {
   float value = 315;
   [self sendOSC:[NSString stringWithFormat:@"/panelTwo"] msgFloat:value];
   self.ImageTwo_ONe.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Two.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Three.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Four.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Five.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Six.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Seven.backgroundColor = [UIColor clearColor];
   self.ImageTwo_Eight.backgroundColor = [UIColor whiteColor];
}
@end
