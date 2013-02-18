//
//  UnitsController.h
//  vamanos
//

#import <UIKit/UIKit.h>

@interface UnitsController : UIViewController <UITextFieldDelegate>

@property(nonatomic, retain) IBOutlet UITextField* topTextField;
@property(nonatomic, retain) IBOutlet UITextField* bottomTextField;

@property(nonatomic, retain) IBOutlet UISegmentedControl* topControl;
@property(nonatomic, retain) IBOutlet UISegmentedControl* bottomControl;

@end
