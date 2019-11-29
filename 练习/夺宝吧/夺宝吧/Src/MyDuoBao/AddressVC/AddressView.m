//
//  AddressView.m
//  夺宝吧
//
//  Created by xiaocai on 15/7/23.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "AddressView.h"
#import "EditAddressVC.h"
@interface AddressView ()
{

    __weak IBOutlet UILabel *nameLab;
    __weak IBOutlet UILabel *phoneLab;
    __weak IBOutlet UILabel *addressLab;
    
    NSString *_name;
    NSString *_phone;
    NSString *_sheng;
    NSString *_shi;
    NSString *_xian;
    NSString *_xiangxi;
}
@end
@implementation AddressView

- (void)awakeFromNib
{
    [self addSubview:[WYPublic getFenGexian:0 :40 :WYMWITH :0.5]];
}
//隐藏子控件
- (void)hiddenSubViews:(BOOL)hiddenFlag
{
    nameLab.hidden = hiddenFlag;
    phoneLab.hidden = hiddenFlag;
    addressLab.hidden = hiddenFlag;
}
//填充数据
- (void)fillViewWithName:(NSString *)name Phone:(NSString *)phone Address:(NSString *)address Sheng:(NSString *)sheng Shi:(NSString *)shi Xian:(NSString *)xian XiangXi:(NSString *)xiangxi
{
    if ([name class] != [NSNull class]) {
        nameLab.text = [NSString stringWithFormat:@"%@%@",@"收货人: ",name];
    }
    if ([phone class] != [NSNull class]) {
        phoneLab.text = [NSString stringWithFormat:@"%@%@",@"手机号码: ",phone];
    }
    if ([phone class] != [NSNull class]) {
        addressLab.text = [NSString stringWithFormat:@"%@%@",@"收货地址: ",address];
    }
    _name = name;
    _phone = phone;
    _sheng = sheng;
    _shi = shi;
    _xian = xian;
    _xiangxi = xiangxi;
}

- (IBAction)tmBtnOnClick:(id)sender {
    EditAddressVC *editVC = [[EditAddressVC alloc]init];
    NSString *address = @"";
    if (_sheng.length != 0) {
        address = [address stringByAppendingString:_sheng];
    }
    if (_shi.length != 0) {
        address = [address stringByAppendingString:_shi];
    }
    if (_xian.length != 0) {
        address = [address stringByAppendingString:_xian];
    }
    [editVC MorenInfoWitnName:_name Phone:_phone Address:address Detail:_xiangxi Sheng:_sheng Shi:_shi Xian:_xian];
    [[WYMainTabBarVC shareMainTaBarVC].navigationController pushViewController:editVC animated:YES];
}

@end
