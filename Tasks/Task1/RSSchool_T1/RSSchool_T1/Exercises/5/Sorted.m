#import "Sorted.h"

@implementation ResultObject
@end

@implementation Sorted

// Complete the sorted function below.
- (ResultObject*)sorted:(NSString*)string {
    ResultObject *value = [ResultObject new];
    int oneIndex = 0;
    int twoIndex = 0;
    BOOL flagOneInd = false;
    BOOL flagTwoInd = false;
    BOOL isSwap = false;
    BOOL isSorted = true;
    
    NSMutableArray *array = [[string componentsSeparatedByString:@" "] mutableCopy];
    long lengthArray = array.count;
    
    //MARK: is sorted
    for (int i = 1; i < lengthArray; i++) {
        NSNumber *n1 = array[i-1];
        NSNumber *n2 = array[i];
        
        if ([n1 integerValue] > [n2 integerValue]) {
            isSorted = false;
            break;
        }
    }
    
    //MARK: isn't sorted
    if (!isSorted) {
        if (lengthArray == 2) {
            long n1 = [array[0] integerValue];
            long n2 = [array[1] integerValue];
            
            if (n1 > n2) {
                value.status = true;
                value.detail = @"swap 1 2";
            }
        } else {
            for (int i = 1; i < lengthArray; i++) {
                NSNumber *n1 = array[i-1];
                NSNumber *n2 = array[i];
                
                if ([n1 integerValue] > [n2 integerValue] && !flagOneInd) {
                    oneIndex = i;
                    flagOneInd = true;
                    continue;
                }
                
                if ([n1 integerValue] > [n2 integerValue] && !flagTwoInd) {
                    twoIndex = i + 1;
                    flagTwoInd = true;
                    break;
                }
            }
            
            if (oneIndex != 0 && twoIndex != 0) {
                NSMutableArray *newArray = [array mutableCopy];
                [newArray exchangeObjectAtIndex: oneIndex-1 withObjectAtIndex: twoIndex-1];
                
                for (int i = 1; i < lengthArray; i++) {
                    NSNumber *n1 = newArray[i-1];
                    NSNumber *n2 = newArray[i];
                    
                    if ([n1 integerValue] > [n2 integerValue]) {
                        isSorted = false;
                        break;
                    } else {
                        isSorted = true;
                    }
                }
                
                if (isSorted) {
                    isSwap = true;
                    value.status = true;
                    value.detail = [NSString stringWithFormat: @"swap %d %d", oneIndex, twoIndex];
                }
                
            }
            
            //MARK: reverse
            if (!isSwap) {
                int firstIndex = 0;
                int secondIndex = 0;
                BOOL firstFlag = false;
                BOOL secondFlag = false;
                
                for (int i = 1; i < lengthArray; i++) {
                    long n1 = [array[i-1] integerValue];
                    long n2 = [array[i] integerValue];
                    if (n1 < n2 && !firstFlag) {
                        firstIndex = i;
                        firstFlag = true;
                        continue;
                    }
                    
                    if (n1 < n2 && !secondFlag) {
                        secondIndex = i-1;
                        secondFlag = true;
                        break;
                    }
                }
                
                if (firstIndex != 0 && secondIndex != 0) {
                    long length = secondIndex + 1-firstFlag;
                    NSRange range = NSMakeRange(firstIndex, length);
                    NSMutableArray *subArray = [[array subarrayWithRange: range] mutableCopy];
                    NSUInteger i = 0;
                    NSUInteger j = subArray.count-1;
                    
                    while (i < j) {
                        [subArray exchangeObjectAtIndex: i withObjectAtIndex: j];
                        i++;
                        j--;
                    }
                    
                    [array replaceObjectsInRange: range withObjectsFromArray: subArray range: NSMakeRange(0, subArray.count)];
                    
                    for (int i = 1; i < lengthArray; i++) {
                        NSNumber *n1 = array[i-1];
                        NSNumber *n2 = array[i];
                        
                        if ([n1 integerValue] > [n2 integerValue]) {
                            isSorted = false;
                            break;
                        } else {
                            isSorted = true;
                        }
                    }
                    
                    if (isSorted) {
                        value.status = true;
                        value.detail = [NSString stringWithFormat: @"reverse %d %d", oneIndex, twoIndex + 1];
                    }
                }
            }
        }
    }
    
    return value;
}

@end
