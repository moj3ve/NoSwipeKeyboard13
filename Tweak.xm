#import <UIKit/UIKit.h>
BOOL NoGesturesKeyboard;
//No Gestures Keyboard
%hook SBHomeGesturePanGestureRecognizer
-(void)touchesBegan:(NSSet *)touches withEvent:(id)event {
    if (NoGesturesKeyboard) return;
    return %orig;
}
%end

%ctor
{
    @autoreleasepool
    {
        [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardDidShowNotification object:nil queue:nil usingBlock:^(NSNotification *n)
        {
            NoGesturesKeyboard = true;
        }];
        [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillHideNotification object:nil queue:nil usingBlock:^(NSNotification *n)
        {
            NoGesturesKeyboard = false;
        }];
    }
}