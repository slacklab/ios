#import "Encryption.h"

@implementation Encryption

// Complete the encryption function below.
- (NSString *)encryption:(NSString *)string {
    NSInteger row = 0;
    NSInteger column = 0;
    double square = sqrt([string length]);
    double min = floor(square);
    double max = ceil(square);
    NSMutableArray *encrypted = [NSMutableArray array];
    
    if (min * max >= [string length]) {
        row = min;
        column = max;
    } else {
        row = max;
        column = max;
    }
    
    for (NSInteger i = 0; i < column; i++) {
        for (NSInteger j = 0; j < row; j++) {
            NSInteger position = i + j * column;
            if (position >= [string length]) {
                break;
            }
            unichar item = [string characterAtIndex: position];
            [encrypted addObject: [NSString stringWithFormat:@"%c", item]];
        }
        
        if(i != column - 1) {
            [encrypted addObject: @" "];
        }
    }
    
    return [encrypted componentsJoinedByString: @""];
}

@end
