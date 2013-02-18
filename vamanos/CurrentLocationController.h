//
//  CurrentLocationController.h
//  vamanos
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h> 
#import <MapKit/MKReverseGeocoder.h>

@interface CurrentLocationController : UIViewController <UIWebViewDelegate, CLLocationManagerDelegate, MKReverseGeocoderDelegate>

@property(nonatomic, retain) IBOutlet UILabel* locationLabel;
@property(nonatomic, retain) IBOutlet UIWebView* webView;
@property(nonatomic, retain) CLLocationManager *locationManager;
@property(nonatomic, retain) MKReverseGeocoder *coder;

- (IBAction)backButtonPressed:(id)sender;
- (IBAction)forwardButtonPressed:(id)sender;

@end
