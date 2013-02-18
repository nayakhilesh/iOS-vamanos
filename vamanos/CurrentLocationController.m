//
//  CurrentLocationController.m
//  vamanos
//

/*#if TARGET_IPHONE_SIMULATOR
@implementation CLLocationManager(TemporaryHack)
- (void)hackLocationFix {
    CLLocation *location = [[CLLocation alloc] initWithLatitude:39.9494 longitude:-75.1457];
    [[self delegate] locationManager:self didUpdateToLocation:location fromLocation:nil];     
}

- (void)startUpdatingLocation {
    [self performSelector:@selector(hackLocationFix) withObject:nil afterDelay:0.1];
}
@end
#endif*/

#import "CurrentLocationController.h"

@implementation CurrentLocationController

@synthesize locationLabel, webView, locationManager, coder;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    //NSLog(@"hello");
    self.locationManager = [[[CLLocationManager alloc] init] autorelease];
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    //if([locationManager locationServicesEnabled])
    //{
    // Set a movement threshold for new events.
    //locationManager.distanceFilter = 500;
    
    [locationManager startUpdatingLocation];
    //}
    /*else
    { 
        UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Error" message:@"This App requires location services to tell you where you are!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil] autorelease];
        [alert show];
    }*/
    //CLLocation *location = locationManager.location;
    //NSLog(@"%f,%f", location.coordinate.latitude,location.coordinate.longitude);
    //NSLog(NSDateFormatterNoStyle,location.timestamp);
    //webView.delegate = self;
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%f,%f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    self.coder = [[[MKReverseGeocoder alloc] initWithCoordinate:newLocation.coordinate] autorelease];
    coder.delegate = self;
    [coder start];
    [manager stopUpdatingLocation];
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark
{
    NSLog(@"%@,%@",placemark.locality,placemark.subLocality);
    locationLabel.text = placemark.locality;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.google.com/search?hl=en&q=%@", placemark.locality]]]];
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error
{

}

- (void)viewDidAppear:(BOOL)animated {
    
    [locationManager startUpdatingLocation];//needed?
    if(coder.placemark.locality == NULL)
    {
        locationLabel.text = @"Couldn't find you! Here's the web instead:";
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]]];   
    }
    /*else
    {
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.google.com/search?hl=en&q=%@", coder.placemark.locality]]]];   
        
    }*/
    [super viewDidAppear:animated];
}

#pragma UIWebViewDelegate methods

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request 
 navigationType:(UIWebViewNavigationType)navigationType {
    
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        locationLabel.text = [[request URL] absoluteString];
    }
    return YES;
}

- (IBAction)backButtonPressed:(id)sender {
    if ([webView canGoBack]) [webView goBack];
}

- (IBAction)forwardButtonPressed:(id)sender {
    if ([webView canGoForward]) [webView goForward];
}

@end
