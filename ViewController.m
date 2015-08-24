//
//  ViewController.m
//  CYSAttributeString
//
//  Created by YS_Chan on 15/8/4.
//  Copyright (c) 2015年 YS_Chan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *attributeStringLabel;
@property (weak, nonatomic) IBOutlet UITextView *textview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textview.delegate = self;
    self.textview.editable = NO;
    self.textview.dataDetectorTypes = UIDataDetectorTypeLink;
    self.attributeStringLabel.numberOfLines = 0;
    [self p_attributeString:@"Test String ssssssss sssssssssssddddddddd fffffffffffffffffffffff"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)p_attributeString:(NSString *)string{
    //NSFontAttributeName 字体大小
    //NSKernAttributeName 字符间隔
    //NSForegroundColorAttributeName 字体颜色
    //NSParagraphStyleAttributeName 段落格式 --》NSMutableParagraphStyle
    //NSBackgroundColorAttributeName 背景颜色
    //NSStrokeColorAttributeName 描边颜色
    //NSStrokeWidthAttributeName 描边宽度 正数时不显示字体颜色，负数时显示字体颜色  需要跟NSStrokeColorAttributeName一起使用
    //NSLigatureAttributeName 连体字体 默认为0， 1时对应特定字体会有效果
    
    //段落样式
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.firstLineHeadIndent = 20.0f;
    paragraphStyle.headIndent = 20.0f;//除首行外的其他行首缩进
    paragraphStyle.tailIndent = -50.0f;//所有行的右缩进（为负数）  为正数时变成竖式。。。？？
    paragraphStyle.paragraphSpacing = 100.f;
    
    //阴影
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowOffset = CGSizeMake(3, 3);
//    shadow.shadowColor = [UIColor blueColor];
    
    
    NSDictionary *attributeStringDic1 = @{NSFontAttributeName: [UIFont systemFontOfSize:28],
                                          NSKernAttributeName: [NSNumber numberWithInt:5],
                                          NSForegroundColorAttributeName: [UIColor redColor],
                                          NSParagraphStyleAttributeName: paragraphStyle,
                                          NSShadowAttributeName:shadow,
                                          NSBackgroundColorAttributeName: [UIColor orangeColor],
                                          NSStrokeColorAttributeName: [UIColor yellowColor],
                                          NSStrokeWidthAttributeName: @-3,
                                          NSLigatureAttributeName: @0,
                                          NSStrikethroughStyleAttributeName: @1,
                                          NSUnderlineStyleAttributeName:@2,
                                          NSStrikethroughColorAttributeName:[UIColor greenColor],
                                          NSUnderlineColorAttributeName:[UIColor cyanColor]};
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc]initWithString:string];
    [attributedString setAttributes:attributeStringDic1 range:NSMakeRange(0, [string length] - 8)];
    [attributedString setAttributes:attributeStringDic1 range:NSMakeRange(12, [string length]-12)];
    [attributedString addAttribute:NSBackgroundColorAttributeName value:[UIColor purpleColor] range:NSMakeRange(1, 1)];
    
    
    
    
//    self.attributeStringLabel.layer.cornerRadius = 5.0;
//    self.attributeStringLabel.layer.borderWidth = 3.0;
//    self.attributeStringLabel.layer.borderColor = [UIColor blackColor].CGColor;
    
    NSMutableAttributedString *textViewString = [[NSMutableAttributedString alloc]initWithString:@"This is a link: www.baidu.com"];
    NSString *linkStr = @"www.baidu.com";
    NSDictionary *dic = @{NSLinkAttributeName: [NSURL URLWithString:@"https://www.baidu.com"]};
    [textViewString setAttributes:dic range:[[textViewString string] rangeOfString:linkStr]];
    
    
    [attributedString setAttributes:dic range:NSMakeRange(0, 10)];
    self.attributeStringLabel.attributedText = attributedString;
    self.textview.attributedText = textViewString;
}

//- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange NS_AVAILABLE_IOS(7_0){
//    NSLog(@"url:%@", URL);
//    return YES;
//}

@end
