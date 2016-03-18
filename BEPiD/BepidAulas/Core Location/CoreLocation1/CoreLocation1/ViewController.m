//
//  ViewController.m
//  CoreLocation1
//
//  Created by Danilo Barros Mendes on 7/9/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () <CLLocationManagerDelegate>

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
   
    if ([CLLocationManager locationServicesEnabled]) {
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        [self.locationManager startUpdatingLocation];
    
    }
    
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *location = [locations lastObject];
    
    self.latitude.text = [NSString stringWithFormat:@"%.8f", location.coordinate.latitude];
    self.longitude.text = [NSString stringWithFormat:@"%.8f", location.coordinate.longitude];
    
    [[Persistence sharedInstance] addLocation:location.coordinate.latitude Longitude:location.coordinate.longitude];
    
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    
    switch (status) {
        case kCLAuthorizationStatusAuthorizedAlways:
            NSLog(@"Autorizado uso em background");
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            NSLog(@"Autorizado uso em foreground");
            break;
        case kCLAuthorizationStatusNotDetermined:
            NSLog(@"Ainda nao foi enviado pedido de autorizacao");
            break;
        case kCLAuthorizationStatusRestricted:
            NSLog(@"Locations Services esta desativado");
            break;
        case kCLAuthorizationStatusDenied:
            NSLog(@"Usuario negou a autorizacao");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Permissao negada" message:@"Funcionalidades do aplicativo ficaram inativas enquanto nao tiver acesso a localizacao" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            
            //CallBack Melhor
            
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
