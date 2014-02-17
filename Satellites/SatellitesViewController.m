//
//  SatellitesViewController.m
//  Satellites
//
//  Created by Bridget Johnson on 15/02/14.
//  Copyright (c) 2014 bdj. All rights reserved.
//  Test edit by Jim

#import "SatellitesViewController.h"

@interface SatellitesViewController ()
@property (strong, nonatomic) IBOutlet UISlider *panelOneAngleSlider;
@property (strong, nonatomic) IBOutlet UISlider *panelTwoAngleSlider;
@property (strong, nonatomic) IBOutlet UISlider *panelOneSpeedSlider;
@property (strong, nonatomic) IBOutlet UISlider *panelTwoSpeedSlider;
- (IBAction)HomeButton:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *outputData;

@end

@implementation SatellitesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)HomeButton:(id)sender {
   [self setOutputData];

   [self.panelOneAngleSlider setValue:0.0];
   [self.panelTwoAngleSlider setValue:0.0];
   [self.panelOneSpeedSlider setValue:0.0];
   [self.panelTwoSpeedSlider setValue:0.0];
   }

-(void)setOutputData
{
   self.outputData.text = [NSString stringWithFormat:@"%f angleOne %.2f angleTwo %.2f speedOne %.2fspeedTwo", [self.panelOneAngleSlider value],[self.panelTwoAngleSlider value], [self.panelOneSpeedSlider value], [self.panelTwoSpeedSlider value]];
}
@end
