#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    long numbersLength = numbers.count;
    
    if (numbersLength == 0) {
        return nil;
    }
    
    NSMutableString *result = [[NSMutableString alloc] init];
    
    for (int i = 0; i < numbersLength; i ++) {
        long currentDegree = numbersLength - 1 - i;
        int currentNumber = [[numbers objectAtIndex: i] intValue];
        BOOL isPositive = currentNumber > 0;
        int justNumber = abs(currentNumber);
        NSString *sign = i == 0 ? isPositive ? @"" : @"- " : currentNumber == 0 ? @"" : isPositive ? @" + " : @" - ";
        NSString *displayedNumber = justNumber > 1 ? [NSString stringWithFormat: @"%i", justNumber] : @"";

        NSString *displayedValue = justNumber == 0 ? @"" :
        currentDegree == 0 ?
            [NSString stringWithFormat: @"%@", displayedNumber] :
                currentDegree == 1 ?
                [NSString stringWithFormat: @"%@x", displayedNumber] :
                [NSString stringWithFormat: @"%@x^%li", displayedNumber, currentDegree];
        
        [result appendString:[NSString stringWithFormat:@"%@%@", sign, displayedValue]];
    }
    return result;
}
// (@"2x^7 - 6x^6 + 45x^5 + 5x^4 + 32x^3 + 3x + 5");

@end
