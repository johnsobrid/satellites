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
}

- (IBAction)connectButton:(id)sender {
   _manualIP = [self.IPinputField text];
   _manualPort = [self.PortInputField text];
    [self upDateOSC];
}

- (IBAction)panelOne_One:(id)sender {
   //change this number to be the anlge you want it to go too
   float value = 10;
   [self sendOSC:[NSString stringWithFormat:@"/panelOne"] msgFloat:value];
}

- (IBAction)panelOne_Two:(id)sender {
   float value = 20;
   [self sendOSC:[NSString stringWithFormat:@"/panelOne"] msgFloat:value];
}

- (IBAction)panelOne_Three:(id)sender {
   float value = 30;
   [self sendOSC:[NSString stringWithFormat:@"/panelOne"] msgFloat:value];
}

- (IBAction)panelOne_Four:(id)sender {
   float value = 40;
   [self sendOSC:[NSString stringWithFormat:@"/panelOne"] msgFloat:value];
}

- (IBAction)panelOne_Five:(id)sender {
   float value = 50;
   [self sendOSC:[NSString stringWithFormat:@"/panelOne"] msgFloat:value];
}

- (IBAction)panelOne_Sixe:(id)sender {
   float value = 60;
   [self sendOSC:[NSString stringWithFormat:@"/panelOne"] msgFloat:value];
}

- (IBAction)panelOne_Seven:(id)sender {
   float value = 70;
   [self sendOSC:[NSString stringWithFormat:@"/panelOne"] msgFloat:value];
}

- (IBAction)panelOne_Eight:(id)sender {
   float value = 80;
   [self sendOSC:[NSString stringWithFormat:@"/panelOne"] msgFloat:value];
}

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
   float value = 10;
   [self sendOSC:[NSString stringWithFormat:@"/panelTwo"] msgFloat:value];
}

- (IBAction)panelTwo_Two:(id)sender {
   float value = 20;
   [self sendOSC:[NSString stringWithFormat:@"/panelTwo"] msgFloat:value];
}

- (IBAction)panelTwo_Three:(id)sender {
   float value = 30;
   [self sendOSC:[NSString stringWithFormat:@"/panelTwo"] msgFloat:value];
}


- (IBAction)panelTwo_Four:(id)sender {
   float value = 40;
   [self sendOSC:[NSString stringWithFormat:@"/panelTwo"] msgFloat:value];
}

- (IBAction)panelTwo_Five:(id)sender {
   float value = 50;
   [self sendOSC:[NSString stringWithFormat:@"/panelTwo"] msgFloat:value];
}

- (IBAction)panelTwo_Six:(id)sender {
   float value = 60;
   [self sendOSC:[NSString stringWithFormat:@"/panelTwo"] msgFloat:value];
}

- (IBAction)panelTwo_Seven:(id)sender {
   float value = 70;
   [self sendOSC:[NSString stringWithFormat:@"/panelTwo"] msgFloat:value];
}

- (IBAction)panelTwo_Eight:(id)sender {
   float value = 80;
   [self sendOSC:[NSString stringWithFormat:@"/panelTwo"] msgFloat:value];
}
@end
