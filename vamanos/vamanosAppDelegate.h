//
//  vamanosAppDelegate.h
//  vamanos
//

#import <UIKit/UIKit.h>

@interface vamanosAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
