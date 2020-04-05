#import "ViewController.h"

@implementation ViewController

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];

    self.viewResultColor = [[UIView alloc] initWithFrame: CGRectMake(110, 100, 230, 40)];
    self.viewResultColor.backgroundColor = [UIColor grayColor];
    [self.view addSubview: self.viewResultColor];
    self.labelResultColor = [[UILabel alloc] initWithFrame: CGRectMake(20, 100, 150, 40)];
    [self.labelResultColor setText: @"Color"];
    [self.view addSubview: self.labelResultColor];

    UILabel *labelRed = [[UILabel alloc] initWithFrame: CGRectMake(20, 180, 150, 30)];
    [labelRed setText: @"RED"];
    [self.view addSubview: labelRed];
    self.textFieldRed = [[UITextField alloc] initWithFrame: CGRectMake(90, 180, 250, 30)];
    self.textFieldRed.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    self.textFieldRed.leftViewMode = UITextFieldViewModeAlways;
    self.textFieldRed.layer.borderWidth = 0.5;
    self.textFieldRed.layer.borderColor = [UIColor grayColor].CGColor;
    self.textFieldRed.layer.cornerRadius = 6;
    [self.textFieldRed setFont:[UIFont systemFontOfSize:14]];
    self.textFieldRed.placeholder = @"0..255";
    [self.view addSubview: self.textFieldRed];

    UILabel *labelGreen = [[UILabel alloc] initWithFrame: CGRectMake(20, 240, 150, 30)];
    [labelGreen setText: @"GREEN"];
    [self.view addSubview: labelGreen];
    self.textFieldGreen = [[UITextField alloc] initWithFrame: CGRectMake(90, 240, 250, 30)];
    self.textFieldGreen.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    self.textFieldGreen.leftViewMode = UITextFieldViewModeAlways;
    self.textFieldGreen.layer.borderWidth = 0.5;
    self.textFieldGreen.layer.borderColor = [UIColor grayColor].CGColor;
    self.textFieldGreen.layer.cornerRadius = 6;
    [self.textFieldGreen setFont:[UIFont systemFontOfSize:14]];
    self.textFieldGreen.placeholder = @"0..255";
    [self.view addSubview: self.textFieldGreen];

    UILabel *labelBlue = [[UILabel alloc] initWithFrame: CGRectMake(20, 300, 150, 30)];
    [labelBlue setText: @"BLUE"];
    [self.view addSubview: labelBlue];
    self.textFieldBlue = [[UITextField alloc] initWithFrame: CGRectMake(90, 300, 250, 30)];
    self.textFieldBlue.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    self.textFieldBlue.leftViewMode = UITextFieldViewModeAlways;
    self.textFieldBlue.layer.borderWidth = 0.5;
    self.textFieldBlue.layer.borderColor = [UIColor grayColor].CGColor;
    self.textFieldBlue.layer.cornerRadius = 6;
    [self.textFieldBlue setFont:[UIFont systemFontOfSize:14]];
    self.textFieldBlue.placeholder = @"0..255";
    [self.view addSubview: self.textFieldBlue];

    self.processButton = [[UIButton alloc] initWithFrame: CGRectMake(self.view.center.x - 50, 380, 100, 30)];
    [self.processButton setTitleColor: [[UIColor alloc] initWithRed: 0.05 green: 0.5 blue: 1 alpha: 0.7] forState: UIControlStateNormal];
    [self.processButton setTitle: @"Process" forState: UIControlStateNormal];
    [self.processButton addTarget: self action:@selector(process) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: self.processButton];

    [self.textFieldRed addTarget:self action:@selector(setCollorToRes) forControlEvents: UIControlEventAllTouchEvents];
    [self.textFieldGreen addTarget:self action:@selector(setCollorToRes) forControlEvents: UIControlEventAllTouchEvents];
    [self.textFieldBlue addTarget:self action:@selector(setCollorToRes) forControlEvents: UIControlEventAllTouchEvents];

    self.view.accessibilityIdentifier = @"mainView";
    self.textFieldRed.accessibilityIdentifier = @"textFieldRed";
    self.textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
    self.textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
    self.processButton.accessibilityIdentifier = @"buttonProcess";
    labelRed.accessibilityIdentifier = @"labelRed";
    labelGreen.accessibilityIdentifier = @"labelGreen";
    labelBlue.accessibilityIdentifier = @"labelBlue";
    self.labelResultColor.accessibilityIdentifier = @"labelResultColor";
    self.viewResultColor.accessibilityIdentifier = @"viewResultColor";

}


- (void) setCollorToRes {
    [self.labelResultColor setText: @"Color"];
}

- (NSString *)hexStringForColor:(UIColor *)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    int red = r * 255;
    int green = g * 255;
    int blue = b * 255;

    NSString *hexString=[NSString stringWithFormat:@"%02X%02X%02X", red, green, blue];
    return  [@"0x" stringByAppendingString: hexString];
}

-(void) process {
    
    int red = self.textFieldRed.text.intValue;
    int green = self.textFieldGreen.text.intValue;
    int blue = self.textFieldBlue.text.intValue;
    
    BOOL redExist = [self.textFieldRed hasText];
    BOOL redCorrect = red >= 0 && red <= 255;
    BOOL redString = [[NSString stringWithFormat:@"%d", red] isEqualToString: self.textFieldRed.text];
    
    BOOL greenExist = [self.textFieldGreen hasText];
    BOOL greenCorrect = green >= 0 && green <= 255;
    BOOL greenString = [[NSString stringWithFormat:@"%d", green] isEqualToString: self.textFieldGreen.text];
    
    BOOL blueExist = [self.textFieldBlue hasText];
    BOOL blueCorrect = blue >= 0 && blue <= 255;
    BOOL blueString = [[NSString stringWithFormat:@"%d", blue] isEqualToString: self.textFieldBlue.text];
    
    BOOL fieldsFilled = redExist && greenExist && blueExist;
    BOOL rangeCorrect = redCorrect && greenCorrect && blueCorrect;
    BOOL stingInTextfields = redString && greenString && blueString;
    
    [self.view endEditing: YES];
    
    if (!rangeCorrect || !fieldsFilled || !stingInTextfields)
    {
        [self.labelResultColor setText: @"Error"];
        return;
    }

    UIColor *color = [UIColor colorWithRed:red / 255.0 green: green / 255.0 blue: blue / 255.0 alpha: 1.0];
    self.viewResultColor.backgroundColor = color;
    [self.labelResultColor setText: [self hexStringForColor: self.viewResultColor.backgroundColor]];

    self.textFieldRed.text = @"";
    self.textFieldGreen.text = @"";
    self.textFieldBlue.text = @"";
}

@end
