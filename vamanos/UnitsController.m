//
//  UnitsController.m
//  vamanos
//

#import "UnitsController.h"

@implementation UnitsController

@synthesize topControl, topTextField, bottomControl, bottomTextField;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    //new code added:
    [topControl addTarget:self action:@selector(actiontop) forControlEvents:UIControlEventValueChanged];
    [bottomControl addTarget:self action:@selector(actionbottom) forControlEvents:UIControlEventValueChanged];
    topTextField.delegate = self;
    bottomTextField.delegate = self;
}

- (void)actiontop
{
    //NSString *str = @"200";
    //NSRange range = NSMakeRange(0, 2);
    float answer;
    switch(topControl.selectedSegmentIndex)
    {
        case 0: //[topTextField.delegate textField:bottomTextField shouldChangeCharactersInRange:range replacementString:str];
            if(bottomControl.selectedSegmentIndex == 0)
            {
                answer = 0.62 * [(bottomTextField.text) doubleValue];
                topTextField.text = [NSString stringWithFormat:@"%f", answer];
            }
            break;
        case 1: 
            if(bottomControl.selectedSegmentIndex == 1)
            {
                answer = 0.39 * [(bottomTextField.text) doubleValue];
                topTextField.text = [NSString stringWithFormat:@"%f", answer];
            }
            break;
        case 2: 
            if(bottomControl.selectedSegmentIndex == 2)
            {
                answer = ([(bottomTextField.text) doubleValue] * 1.8) + 32;
                topTextField.text = [NSString stringWithFormat:@"%f", answer];
            }
            break;
    }
    
    //bottomControl.selectedSegmentIndex = topControl.selectedSegmentIndex;
}

- (void)actionbottom
{
    float answer;
    switch(bottomControl.selectedSegmentIndex)
    {
        case 0: //[topTextField.delegate textField:bottomTextField shouldChangeCharactersInRange:range replacementString:str];
            if(topControl.selectedSegmentIndex == 0)
            {
                answer = 1.61 * [(topTextField.text) doubleValue];
                bottomTextField.text = [NSString stringWithFormat:@"%f", answer];
            }
            break;
        case 1: 
            if(topControl.selectedSegmentIndex == 1)
            {
                answer = 2.54 * [(topTextField.text) doubleValue];
                bottomTextField.text = [NSString stringWithFormat:@"%f", answer];
            }
            break;
        case 2: 
            if(topControl.selectedSegmentIndex == 2)
            {
                answer = ([(topTextField.text) doubleValue] - 32)/1.8;
                bottomTextField.text = [NSString stringWithFormat:@"%f", answer];
            }
            break;
    }
    //topControl.selectedSegmentIndex = bottomControl.selectedSegmentIndex;

}

#pragma UITextFieldDelegate methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range 
replacementString:(NSString *)string {
    
    NSString* newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSLog(@"%@", newString);
    //textField.text = newString;
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    float answer;
    if(textField == topTextField)
    {
        if(topControl.selectedSegmentIndex == bottomControl.selectedSegmentIndex)
        {
            switch(bottomControl.selectedSegmentIndex)
            {
                case 0: answer = 1.61 * [(topTextField.text) doubleValue];
                        bottomTextField.text = [NSString stringWithFormat:@"%f", answer];
                    break;
                case 1: answer = 2.54 * [(topTextField.text) doubleValue];
                        bottomTextField.text = [NSString stringWithFormat:@"%f", answer];
                    break;
                case 2: answer = ([(topTextField.text) doubleValue] - 32)/1.8;
                        bottomTextField.text = [NSString stringWithFormat:@"%f", answer];
                    break;
            }

        }  
    }
    
    else 
    {
        if(bottomControl.selectedSegmentIndex == topControl.selectedSegmentIndex)
        {
            switch(topControl.selectedSegmentIndex)
            {
                case 0: answer = 0.62 * [(bottomTextField.text) doubleValue];
                    topTextField.text = [NSString stringWithFormat:@"%f", answer];
                    break;
                case 1: answer = 0.39 * [(bottomTextField.text) doubleValue];
                    topTextField.text = [NSString stringWithFormat:@"%f", answer];
                    break;
                case 2: answer = ([(bottomTextField.text) doubleValue]*1.8) + 32;
                    topTextField.text = [NSString stringWithFormat:@"%f", answer];
                    break;
            }
            
        }  
    }
    
    [textField resignFirstResponder];
    return NO;
}

@end
