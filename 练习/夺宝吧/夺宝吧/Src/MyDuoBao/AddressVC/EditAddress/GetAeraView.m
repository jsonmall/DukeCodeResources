//
//  GetAeraView.m
//  夺宝吧
//
//  Created by xiaocai on 15/7/24.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "GetAeraView.h"


@interface GetAeraView ()<HZAreaPickerDelegate>
{
    NSString *_area;
    
    __weak IBOutlet UIButton *ensureBtn;
    __weak IBOutlet UIButton *cancelBtn;
}
@end
@implementation GetAeraView


- (void)awakeFromNib
{
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    
    ensureBtn.layer.cornerRadius = 2;
    cancelBtn.layer.cornerRadius = 2;
    ensureBtn.layer.borderWidth = 1;
    cancelBtn.layer.borderWidth = 1;
    ensureBtn.layer.masksToBounds = YES;
    cancelBtn.layer.masksToBounds = YES;
    ensureBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    cancelBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    ensureBtn.backgroundColor = QBB_RED_COLOR;
//    [self addSubview:[WYPublic getFenGexian:0 :CGRectGetMinY(ensureBtn.frame)-8 :300 :1]];
//    [self cancelLocatePicker];
    self.locatePicker = [[HZAreaPickerView alloc] initWithStyle:HZAreaPickerWithStateAndCityAndDistrict delegate:self];
    [self.locatePicker showInView:self];
    _area = @"北京通州";
}
#pragma mark - HZAreaPicker delegate
-(void)pickerDidChaneStatus:(HZAreaPickerView *)picker
{
    if (picker.pickerStyle == HZAreaPickerWithStateAndCityAndDistrict) {
        _area = [NSString stringWithFormat:@"%@ %@ %@", picker.locate.state, picker.locate.city, picker.locate.district];
    }
}

- (IBAction)ensurebtnOnClick:(id)sender {
    self.father.sheng = self.locatePicker.locate.state;
    self.father.shi = self.locatePicker.locate.city;
    self.father.xian = self.locatePicker.locate.district;
    [self.father changeArea:_area];
    [self removeFromSuperview];
}

- (IBAction)cancelBtnOnClick:(id)sender {
    [self.father removeZheZhao];
    [self removeFromSuperview];
}

-(void)cancelLocatePicker
{
    [self.locatePicker cancelPicker];
    self.locatePicker.delegate = nil;
    self.locatePicker = nil;
}


@end
