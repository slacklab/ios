#import "Pangrams.h"

@implementation Pangrams

// Complete the pangrams function below.
- (BOOL)pangrams:(NSString *)string {
    NSString *alphabetic = @"abcdefghijklmnopqrstuvwxyz";
    
    for (int i = 0; i < [alphabetic length]; i++) {
        NSString *sym = [alphabetic substringWithRange: NSMakeRange(i, 1)];
        if (![[string lowercaseString] containsString: sym]) {
            
            return NO;
        }
    }
    
    return YES;
}

@end
