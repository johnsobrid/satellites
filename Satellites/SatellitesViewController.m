//
//  SatellitesViewController.m
//  Satellites
//
//  Created by Bridget Johnson on 15/02/14.
//  Copyright (c) 2014 bdj. All rights reserved.
//  Test edit by Jim

#import "SatellitesViewController.h"

@interface SatellitesViewController ()
//all the properties for the sliders
@property (strong, nonatomic) IBOutlet UISlider *panelOneAngleSlider;
@property (strong, nonatomic) IBOutlet UISlider *panelTwoAngleSlider;
@property (strong, nonatomic) IBOutlet UISlider *panelOneSpeedSlider;
@property (strong, nonatomic) IBOutlet UISlider *panelTwoSpeedSlider;
- (IBAction)panelOneAngleChanged:(id)sender;
- (IBAction)panelTwoAngleChanged:(id)sender;
- (IBAction)panelOneSpeedChanged:(id)sender;
- (IBAction)panelTwoSpeedChanged:(id)sender;

//networking input outlets
@property (strong, nonatomic) IBOutlet UITextField *IPinputField;
@property (strong, nonatomic) IBOutlet UITextField *PortInputField;


//ids for the buttons
- (IBAction)HomeButton:(id)sender;

//properties for the labels
@property (strong, nonatomic) IBOutlet UILabel *panelTwoAngleLabel;
@property (strong, nonatomic) IBOutlet UILabel *panelOneAngleLabel;
@property (strong, nonatomic) IBOutlet UILabel *panelOneSpeedLabel;
@property (strong, nonatomic) IBOutlet UILabel *panelTwoSpeedLabel;

@end

@implementation SatellitesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   [self updateOutputData];
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

   [self.panelOneAngleSlider setValue:0.0];
   [self.panelTwoAngleSlider setValue:0.0];
   [self.panelOneSpeedSlider setValue:0.0];
   [self.panelTwoSpeedSlider setValue:0.0];
   [self updateOutputData];
   }

-(void)updateOutputData
{
   self.panelOneAngleLabel.text = [NSString stringWithFormat:@"/panelOne/angle %.2f ", [self.panelOneAngleSlider value]];
   [self sendOSC:[NSString stringWithFormat:@"/panelOne/angle %.2f ", [self.panelOneAngleSlider value]]];
   self.panelTwoAngleLabel.text = [NSString stringWithFormat:@"/panelTwo/angle %.2f ", [self.panelTwoAngleSlider value]];
   [self sendOSC:[NSString stringWithFormat:@"/panelTwo/angle %.2f ", [self.panelTwoAngleSlider value]]];
   self.panelOneSpeedLabel.text = [NSString stringWithFormat:@"/panelOne/speed %.2f ", [self.panelOneSpeedSlider value]];
   [self sendOSC:[NSString stringWithFormat:@"/panelOne/speed %.2f ", [self.panelOneSpeedSlider value]]];
   self.panelTwoSpeedLabel.text = [NSString stringWithFormat:@"/panelTwo/speed %.2f ", [self.panelTwoSpeedSlider value]];
   [self sendOSC:[NSString stringWithFormat:@"/panelTwo/speed %.2f ", [self.panelTwoSpeedSlider value]]];
}


- (IBAction)panelOneAngleChanged:(id)sender {
   self.panelOneAngleLabel.text = [NSString stringWithFormat:@"/panelOne/angle %.2f ", [self.panelOneAngleSlider value]];
   [self sendOSC:[NSString stringWithFormat:@"/panelOne/angle %.2f ", [self.panelOneAngleSlider value]]];
}

- (IBAction)panelTwoAngleChanged:(id)sender {
   self.panelTwoAngleLabel.text = [NSString stringWithFormat:@"/panelTwo/angle %.2f ", [self.panelTwoAngleSlider value]];
   [self sendOSC:[NSString stringWithFormat:@"/panelTwo/angle %.2f ", [self.panelTwoAngleSlider value]]];
}

- (IBAction)panelOneSpeedChanged:(id)sender {
   self.panelOneSpeedLabel.text = [NSString stringWithFormat:@"/panelOne/speed %.2f ", [self.panelOneSpeedSlider value]];
   [self sendOSC:[NSString stringWithFormat:@"/panelOne/speed %.2f ", [self.panelOneSpeedSlider value]]];
}

- (IBAction)panelTwoSpeedChanged:(id)sender {
   self.panelTwoSpeedLabel.text = [NSString stringWithFormat:@"/panelTwo/speed %.2f ", [self.panelTwoSpeedSlider value]];
   [self sendOSC:[NSString stringWithFormat:@"/panelTwo/speed %.2f ", [self.panelTwoSpeedSlider value]]];

}

- (void)sendOSC: (NSString*)msg
{
   manager = [[OSCManager alloc] init];

   OSCMessage *newMsg = [OSCMessage createWithAddress:msg];
   
   outPort = [manager createNewOutputToAddress:[self.IPinputField text] atPort:[[self.PortInputField text] intValue] withLabel:@"Output"];
   //[outPort setPort:[self.PortInputField text]];
   [outPort sendThisMessage:newMsg];
}

- (NSUInteger)supportedInterfaceOrientations
{
   NSLog(@"%s", __PRETTY_FUNCTION__);
   return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotate
{
   return NO;
}
@end
