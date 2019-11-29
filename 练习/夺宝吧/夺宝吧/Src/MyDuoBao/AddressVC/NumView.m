//
//  NumView.m
//  夺宝吧
//
//  Created by xiaocai on 15/7/23.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "NumView.h"
#import "EditNumVC.h"
@interface NumView ()
{
    __weak IBOutlet UILabel *phoneLab;
    __weak IBOutlet UILabel *qqLab;
    __weak IBOutlet UILabel *zfbLab;
    
    NSString *_phone;
    NSString *_qq;
    NSString *_zfb;
}
@end
@implementation NumView

- (void)awakeFromNib
{
    [self addSubview:[WYPublic getFenGexian:0 :40 :WYMWITH :0.5]];
}
//隐藏子控件
- (void)hiddenSubViews:(BOOL)hiddenFlag
{
    phoneLab.hidden = hiddenFlag;
    qqLab.hidden = hiddenFlag;
    zfbLab.hidden = hiddenFlag;
}
//填充数据
- (void)fillViewWithPhone:(NSString *)phone QQ:(NSString *)qq ZFB:(NSString *)zfb
{
    if ([phone class]!= [NSNull class]) {
        phoneLab.text = [NSString stringWithFormat:@"%@%@",@"手机号码: ",phone];
    }
    if([qq class] != [NSNull class]){
        qqLab.text = [NSString stringWithFormat:@"%@%@",@"QQ号码: ",qq];
    }
    if([zfb class] != [NSNull class]){
        zfbLab.text = [NSString stringWithFormat:@"%@%@",@"支付宝: ",zfb];
    }
    _phone = phone;
    _qq = qq;
    _zfb = zfb;
}

- (IBAction)tmBtnOnClick:(id)sender {
    EditNumVC *editVC = [[EditNumVC alloc]init];
    [editVC morenInfoWithPhone:_phone QQ:_qq ZFB:_zfb];
    [[WYMainTabBarVC shareMainTaBarVC].navigationController pushViewController:editVC animated:YES];
}
@end
