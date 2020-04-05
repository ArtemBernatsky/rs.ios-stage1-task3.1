#import "Combinator.h"

@implementation Combinator
- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    long posters = [[array objectAtIndex: 0] integerValue];
    long colors = [[array objectAtIndex: 1] integerValue];

    for (int n = 1; n < colors; n++) {
        long colorsFactorial = [self getFactorial: colors];
        long nFactorial = [self getFactorial: n];
        long colorsMinusNFactorial = [self getFactorial:(colors - n)];
        long combinations =  colorsFactorial/ (nFactorial * colorsMinusNFactorial);
        
        if (posters == combinations) {
            return [NSNumber numberWithInt: n];
        }

    }
    return nil;
}

- (NSUInteger) getFactorial:(long)n {
    
    if (n < 0) {
        return -1;
    }
    
    if (n == 0 || n == 1) {
        return 1;
    }

    return n * [self getFactorial: n - 1];
}
@end
