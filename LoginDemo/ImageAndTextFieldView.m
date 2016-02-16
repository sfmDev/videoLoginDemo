//
//  ImageAndTextFieldView.m
//  LoginDemo
//
//  Created by Get-CC on 16/2/16.
//  Copyright © 2016年 shifengming. All rights reserved.
//

#import "ImageAndTextFieldView.h"

@implementation ImageAndTextFieldView
{
    UIImageView *leftImage;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    leftImage.image = image;
}

- (void)setPlaceholdString:(NSString *)placeholdString
{
    _placeholdString = placeholdString;
    _inputTextField.placeholder = placeholdString;
    [_inputTextField setValue:[[UIColor whiteColor] colorWithAlphaComponent:0.5f]forKeyPath:@"_placeholderLabel.textColor"];
}

- (void)setUpUI
{
    UIImageView *bgImage = [[UIImageView alloc]initWithFrame:self.bounds];
    bgImage.image = [UIImage imageNamed:@"bg_input_down"];
    bgImage.userInteractionEnabled = YES;
    bgImage.layer.cornerRadius = 5.0f;
    bgImage.layer.borderWidth = 1.0f;
    bgImage.layer.borderColor = [UIColor clearColor].CGColor;
    bgImage.layer.masksToBounds = YES;
    [self addSubview:bgImage];

    leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.height)];
    [leftImage setContentMode:UIViewContentModeCenter];
    [bgImage addSubview:leftImage];
    
    _inputTextField = [[UITextField alloc]initWithFrame:CGRectMake(leftImage.frame.origin.x+leftImage.frame.size.width+5, 0, self.bounds.size.width-leftImage.frame.size.width, leftImage.frame.size.height)];
    _inputTextField.textColor = [UIColor whiteColor];
    _inputTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [bgImage addSubview:_inputTextField];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
