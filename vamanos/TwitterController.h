//
//  TwitterController.h
//  vamanos
//
//  Created by Akhilesh Nayak on 11/6/11.
//  Copyright 2011 University of Pennsylvania. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwitterController : UITableViewController <CLLocationManagerDelegate>

@property(nonatomic, retain) CLLocationManager *locationManager;

@property (nonatomic, retain) NSURLConnection *connection;
@property (nonatomic, retain) NSMutableData *buffer;
@property (nonatomic, retain) NSMutableArray *results;

- (void)handleError:(NSError *)error;

@end
