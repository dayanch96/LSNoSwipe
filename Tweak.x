#import <UIKit/UIKit.h>

@interface UIGestureRecognizerTarget : NSObject
@property id target;
@end

%hook CSScrollView
- (void)handlePan:(UIGestureRecognizer *)pan {
    NSArray *targets = [pan valueForKey:@"_targets"];
    for (UIGestureRecognizerTarget *recTarget in targets) {
        if ([recTarget.target isKindOfClass:%c(CSCoverSheetViewController)]) {
            return;
        }
    }

    %orig;
}
%end