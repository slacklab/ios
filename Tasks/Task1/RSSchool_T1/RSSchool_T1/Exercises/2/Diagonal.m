#import "Diagonal.h"

@implementation Diagonal

// Complete the diagonalDifference function below.
- (NSNumber *) diagonalDifference:(NSArray *)array {
    NSInteger index = 0;
    NSInteger primarySum = 0;
    NSInteger secondarySum = 0;
    
    unsigned long count = [array count];
    
    for (NSString *item in array) {
        NSArray *row = [item componentsSeparatedByCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
        primarySum = primarySum + [[row objectAtIndex: index] integerValue];
        secondarySum = secondarySum + [[row objectAtIndex: (count - index - 1)] integerValue];
        index++;
    }
    
    NSInteger result = labs(primarySum - secondarySum);
    
    return @(result);
}

@end


