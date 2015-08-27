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
//    [self p_attributeString:@"Test String \nabcdefghijklmnopqrstuvwxyz\n0123456789"];
    [self p_attributeString:@"floot"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)p_attributeString:(NSString *)string{
    /**
    1. NSFontAttributeName
    字体大小、字体Style
    2. NSParagraphStyleAttributeName
    段落格式（首行缩进、行首行尾缩进等）
    3. NSForegroundColorAttributeName
    字体颜色
    4. NSBackgroundColorAttributeName
    背景颜色
    5. NSLigatureAttributeName(NSNumber containing integer, default 1: default ligatures, 0: no ligatures)
    连写字符设置，默认为1 有连写字符。设置为0则为无连写字符。（1、0都是NSNumber）
    6. NSKernAttributeName
    字符间隔（NSNumber containing floating point value）
    7. NSStrikethroughStyleAttributeName
    删除线 （NSNumber  删除线的宽度）
    8. NSUnderlineStyleAttributeName
    下划线 （NSNumber  下划线线的宽度）
    9. NSStrokeColorAttributeName
    描边线颜色
    10. NSStrokeWidthAttributeName
    描边线宽度 (正数时不显示字体颜色，负数时显示字体颜色  需要跟NSStrokeColorAttributeName一起使用)
    负值填充效果，正值中空效果
    11. NSShadowAttributeName
    阴影设置 （NSShadow）有背景颜色时，阴影显示在背景颜色的下面，被遮挡。
    12. NSTextEffectAttributeName
    设置文本特殊效果，取值为 NSString 对象，目前只有图版印刷效果可用
    13. NSAttachmentAttributeName
    14. NSLinkAttributeName
    链接属性（点击跳转）UILabel 中无法跳转，不知道是不是设置问题？TextView中可以跳转
    15. NSBaselineOffsetAttributeName
    设置基线偏移值，取值为 NSNumber （float）,正值上偏，负值下偏
    16. NSUnderlineColorAttributeName
    下划线颜色
    17. NSStrikethroughColorAttributeName
    删除线颜色
    18. NSObliquenessAttributeName
    设置字形倾斜度，取值为 NSNumber （float）,正值右倾，负值左倾
    19. NSExpansionAttributeName
    设置文本横向拉伸属性，取值为 NSNumber （float）,正值横向拉伸文本，负值
    20. NSWritingDirectionAttributeName
    设置文字书写方向，从左向右书写或者从右向左书写
    21. NSVerticalGlyphFormAttributeName
    横竖排版（NSNumber）  0为横排  1为竖排
    */
    
    //段落样式
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.firstLineHeadIndent = 100.0f;
    paragraphStyle.headIndent = 50.0f;//除首行外的其他行首缩进
//    paragraphStyle.tailIndent = -50.0f;//所有行的右缩进（为负数）  为正数时变成竖式。。。？？
    paragraphStyle.paragraphSpacing = 100.f;
    
    //阴影
    NSShadow *shadow1 = [[NSShadow alloc]init];
    shadow1.shadowOffset = CGSizeMake(3, 3);
    
    NSShadow *shadow2 = [[NSShadow alloc]init];
    shadow2.shadowOffset = CGSizeMake(-2, -4);
    shadow2.shadowColor = [UIColor redColor];
    shadow2.shadowBlurRadius = 0.5;
    
    NSShadow *shadow3 = [[NSShadow alloc]init];
    shadow3.shadowOffset = CGSizeMake(-2, 4);
    shadow3.shadowColor = [UIColor colorWithRed:0.6 green:0.1 blue:0.4 alpha:0.5];
    shadow3.shadowBlurRadius = 5;
//    shadow.shadowColor = [UIColor blueColor];
    
    
//    NSDictionary *attributeStringDic1 = @{NSFontAttributeName: [UIFont systemFontOfSize:28],
//                                          NSKernAttributeName: [NSNumber numberWithInt:5],
//                                          NSForegroundColorAttributeName: [UIColor redColor],
//                                          NSParagraphStyleAttributeName: paragraphStyle,
//                                          NSShadowAttributeName:shadow,
//                                          NSBackgroundColorAttributeName: [UIColor orangeColor],
//                                          NSStrokeColorAttributeName: [UIColor yellowColor],
//                                          NSStrokeWidthAttributeName: @-3,
//                                          NSLigatureAttributeName: @0,
//                                          NSStrikethroughStyleAttributeName: @1,
//                                          NSUnderlineStyleAttributeName:@2,
//                                          NSStrikethroughColorAttributeName:[UIColor greenColor],
//                                          NSUnderlineColorAttributeName:[UIColor cyanColor]};
//    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc]initWithString:string];
//    [attributedString setAttributes:attributeStringDic1 range:NSMakeRange(0, [string length] - 8)];
//    [attributedString setAttributes:attributeStringDic1 range:NSMakeRange(12, [string length]-12)];
//    [attributedString addAttribute:NSBackgroundColorAttributeName value:[UIColor purpleColor] range:NSMakeRange(1, 1)];
//    self.attributeStringLabel.layer.cornerRadius = 5.0;
//    self.attributeStringLabel.layer.borderWidth = 3.0;
//    self.attributeStringLabel.layer.borderColor = [UIColor blackColor].CGColor;
//    NSDictionary *attributeStringDic1 = @{NSFontAttributeName: [UIFont systemFontOfSize:34],
//                                          NSForegroundColorAttributeName: [UIColor redColor],
//                                          NSBackgroundColorAttributeName: [UIColor blackColor],
//                                          NSWritingDirectionAttributeName: @[@(NSWritingDirectionRightToLeft|NSWritingDirectionOverride)],
//                                          };
//    NSDictionary *attributeStringDic2 = @{NSFontAttributeName: [UIFont systemFontOfSize:34],
//                                          NSForegroundColorAttributeName: [UIColor orangeColor],
//                                          NSBackgroundColorAttributeName: [UIColor blueColor],
//                                          NSWritingDirectionAttributeName: @[@(NSWritingDirectionRightToLeft|NSWritingDirectionEmbedding)],
//                                          };
//    NSDictionary *attributeStringDic3 = @{NSFontAttributeName: [UIFont systemFontOfSize:34],
//                                          NSForegroundColorAttributeName: [UIColor purpleColor],
//                                          NSBackgroundColorAttributeName: [UIColor yellowColor],
//                                          NSWritingDirectionAttributeName: @[@(NSWritingDirectionLeftToRight|NSWritingDirectionEmbedding)],
//                                          };
//    
//
    NSDictionary *dic = @{NSLigatureAttributeName: @1,
                          NSFontAttributeName: [UIFont fontWithName:@"futura" size:38]};
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:string attributes:dic];
    
//
//    [attributedString setAttributes:attributeStringDic1 range:[string rangeOfString:@"Test String"]];
//    [attributedString setAttributes:attributeStringDic2 range:[string rangeOfString:@"abcdefghijklmnopqrstuvwxyz"]];
//    [attributedString setAttributes:attributeStringDic3 range:[string rangeOfString:@"0123456789"]];
    
    //设置文本附件，取值为NSTextAttachenment
//    NSTextAttachment *textAttachment1 = [[NSTextAttachment alloc]init];
//    textAttachment1.image = [UIImage imageNamed:@"lufy.jpg"];
//    textAttachment1.bounds = CGRectMake(0, 0, 30, 30);
//    
//    NSAttributedString *attachmentStr = [NSAttributedString attributedStringWithAttachment:textAttachment1];
//    [attributedString insertAttributedString:attachmentStr atIndex:2];
    
    self.attributeStringLabel.attributedText = attributedString;
    
    

    //设置NSLinkAttributeName 用TextView
//    NSMutableAttributedString *textViewString = [[NSMutableAttributedString alloc]initWithString:@"This is a link: www.baidu.com"];
//    NSString *linkStr = @"www.baidu.com";
//    NSDictionary *dic = @{NSLinkAttributeName: [NSURL URLWithString:@"https://www.baidu.com"]};
//    [textViewString setAttributes:dic range:[[textViewString string] rangeOfString:linkStr]];
//    [attributedString setAttributes:dic range:NSMakeRange(0, 10)];
//    self.textview.attributedText = textViewString;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange NS_AVAILABLE_IOS(7_0){
    NSLog(@"url:%@", URL);
    return YES;
}

@end
