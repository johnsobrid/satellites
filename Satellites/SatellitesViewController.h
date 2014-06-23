//
//  SatellitesViewController.h
//  Satellites
//
//  Created by Bridget Johnson on 15/02/14.
//  Copyright (c) 2014 bdj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <VVOSC/VVOSC.h>

@interface SatellitesViewController : UIViewController
{
   OSCManager *manager;
   OSCOutPort *outPort;
}
@property (strong, nonatomic) NSString* manualIP;
@property (strong, nonatomic) NSString* manualPort;

@end
