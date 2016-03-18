//
//  ViewController.h
//  CoreLocation1
//
//  Created by Danilo Barros Mendes on 7/9/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "FMDatabase.h"
#import "Persistence.h"

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (nonatomic) CLLocationManager *locationManager;

@property (weak, nonatomic) IBOutlet UILabel *latitude;
@property (weak, nonatomic) IBOutlet UILabel *longitude;

@end

