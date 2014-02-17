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
- (IBAction)printDataButton:(id)sender;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)HomeButton:(id)sender {

   [self.panelOneAngleSlider setValue:0.0];
   [self.panelTwoAngleSlider setValue:0.0];
   [self.panelOneSpeedSlider setValue:0.0];
   [self.panelTwoSpeedSlider setValue:0.0];
   }

- (IBAction)printDataButton:(id)sender {
   [self setOutputData];
}

-(void)setOutputData
{
   self.panelOneAngleLabel.text = [NSString stringWithFormat:@"/panelOne/angle %.2f ", [self.panelOneAngleSlider value]];
   self.panelTwoAngleLabel.text = [NSString stringWithFormat:@"/panelTwo/angle %.2f ", [self.panelTwoAngleSlider value]];
   self.panelOneSpeedLabel.text = [NSString stringWithFormat:@"/panelOne/speed %.2f ", [self.panelOneSpeedSlider value]];
   self.panelTwoSpeedLabel.text = [NSString stringWithFormat:@"/panelTwo/speed %.2f ", [self.panelTwoSpeedSlider value]];

}
@end
