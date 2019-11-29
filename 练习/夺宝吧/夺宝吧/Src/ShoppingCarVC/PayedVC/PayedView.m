//
//  PayedView.m
//  夺宝吧
//
//  Created by xiaocai on 15/7/15.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "PayedView.h"
#import "DuoBaoHisVC.h"
#import "MingXiVC.h"
#define CZ_TONGJI_URL @"charge"
@interface PayedView ()
{
    __weak IBOutlet UIButton *buyCotuniueBtn;
    __weak IBOutlet UIButton *showbtn;
    __weak IBOutlet UILabel *fengeLab;
    __weak IBOutlet UILabel *rltLab;
    
}
@end
@implementation PayedView
- (void)setRltType:(ResType)rltType
{
    _rltType = rltType;
    switch (rltType) {
        case PdcSuccess:
        {
            //上架前处理
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            NSNumber *flag = [user objectForKey:@"user_show_pay"];
            if ([flag intValue] == 0) {
                rltLab.text = @"恭喜您，支付成功！";
            }else{
                rltLab.text = @"恭喜您，参与成功！\n请等待系统为您揭晓！";
            }
            //1,清空购物车
            NSArray *pdcs = [[WYDataBase sharedDataBase]getAllpdcInCar];
            for (WYShopCarModel *model in pdcs) {
                [[WYDataBase sharedDataBase]deletePdcInCarById:[model.car_new_id intValue]];
            }
            [[WYMainTabBarVC shareMainTaBarVC]updateCountToCar];
            [self tongji];
        }
            break;
        case PdcFailed:
        {
            rltLab.textAlignment = NSTextAlignmentCenter;
            rltLab.text = @"支付失败！";
        }
            break;
        case ChongZhiSuccess:
        {
            rltLab.text = @"恭喜您，充值成功！";
            [showbtn setTitle:@"查看充值记录" forState:UIControlStateNormal];
            [self tongji];
        }
            break;
        case ChongZhiFailed:
        {
            rltLab.text = @"充值失败！";
            [showbtn setTitle:@"查看充值记录" forState:UIControlStateNormal];
        }
            break;
        default:
            break;
    }
   
}
/**************
 *充值成功统计
 *****************/
- (void)tongji
{
    NSLog(@"self tongji");
    NSDictionary *params = @{@"money":[WYPublic getUsefullStr:self.father.money]};
    [WYRequest startPostForTongJiWithUrlStR:[NSString stringWithFormat:@"%@%@",DBB_YX_IP,CZ_TONGJI_URL] Parameters:params successBlock:^(NSDictionary *dic) {
        
    } failedBlock:^{
        
    } needLog:YES];
}
- (void)awakeFromNib
{
    buyCotuniueBtn.backgroundColor = QBB_RED_COLOR;
    buyCotuniueBtn.layer.masksToBounds =YES;
    showbtn.layer.masksToBounds = YES;
    showbtn.layer.cornerRadius = 2;
    buyCotuniueBtn.layer.cornerRadius = 2;
    showbtn.layer.borderWidth = 1;
    showbtn.layer.borderColor = QBB_RED_COLOR.CGColor;
    [showbtn setTitleColor:QBB_RED_COLOR forState:UIControlStateNormal];
    showbtn.titleLabel.textColor = QBB_RED_COLOR;
    [self addSubview:[WYPublic getFenGexian:0 :self.frame.size.height - 0.5 :WYMWITH :0.5]];
    [fengeLab addSubview:[WYPublic getFenGexian:0 :0 :WYMWITH :0.5]];
    [fengeLab addSubview:[WYPublic getFenGexian:0 :fengeLab.frame.size.height - 0.5 :WYMWITH :0.5]];
}
//继续抢购
- (IBAction)buyBtn:(id)sender {
    [[WYMainTabBarVC shareMainTaBarVC].navigationController popToRootViewControllerAnimated:YES];
    [[WYMainTabBarVC shareMainTaBarVC]changeSelectedWithIndex:0];
}

//参与记录

- (IBAction)showbtnOnclick:(id)sender {
   
    switch (self.rltType) {
        case PdcSuccess:
        {
            DuoBaoHisVC *hisVC = [[DuoBaoHisVC alloc]init];
            hisVC.isMyRecordFlag = YES;
            [[WYMainTabBarVC shareMainTaBarVC].navigationController pushViewController:hisVC animated:YES];
        }
            break;
        case PdcFailed:
        {
            DuoBaoHisVC *hisVC = [[DuoBaoHisVC alloc]init];
            hisVC.isMyRecordFlag = YES;
            [[WYMainTabBarVC shareMainTaBarVC].navigationController pushViewController:hisVC animated:YES];
        }
            break;
        case ChongZhiSuccess:
        {
            MingXiVC *mingxiVC = [[MingXiVC alloc]init];
            [[WYMainTabBarVC shareMainTaBarVC].navigationController pushViewController:mingxiVC animated:YES];
        }
            break;
        case ChongZhiFailed:
        {
            MingXiVC *mingxiVC = [[MingXiVC alloc]init];
            [[WYMainTabBarVC shareMainTaBarVC].navigationController pushViewController:mingxiVC animated:YES];

        }
            break;
        default:
            break;
    }
    
}

@end
