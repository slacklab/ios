#import "SummArray.h"

@implementation SummArray

// Complete the summArray function below.
- (NSNumber *)summArray:(NSArray *)array {
    NSInteger sum = 0;
    
    for (NSNumber *item in array) {
        NSLog(@"%@", item);
        sum += [item integerValue];
    }
    
    return @(sum);
}

@end
