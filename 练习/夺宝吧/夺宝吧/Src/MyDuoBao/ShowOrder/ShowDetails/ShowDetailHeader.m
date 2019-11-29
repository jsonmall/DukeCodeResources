//
//  ShowDetailHeader.m
//  夺宝吧
//
//  Created by xiaocai on 15/8/4.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "ShowDetailHeader.h"
#import "WYPublicWeb.h"

@interface ShowDetailHeader ()
{
    __weak IBOutlet UILabel *titleLab;
    __weak IBOutlet UILabel *countLab;
    __weak IBOutlet UILabel *pdctitleLab;
    __weak IBOutlet UILabel *numLab;
    __weak IBOutlet UILabel *codeLab;
    __weak IBOutlet UILabel *timeLab;
    __weak IBOutlet UILabel *companyLab;
    __weak IBOutlet UILabel *comPanyNumLab;
    __weak IBOutlet UILabel *contentLab;
    
    __weak IBOutlet UIButton *kuaidiBtn;
    
    __weak IBOutlet UILabel *showTimeLab;
    __weak IBOutlet UIView *bgView;
    
    __weak IBOutlet UILabel *yc1;
    __weak IBOutlet UILabel *yc2;
    
    __weak IBOutlet UIImageView *jifenImg;
    __weak IBOutlet UILabel *jiangliLab;
    __weak IBOutlet UILabel *jifenNumLab;
    
}
@end
@implementation ShowDetailHeader

-(void)awakeFromNib
{
    countLab.textColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"db_blu_color"]];
    codeLab.textColor = QBB_RED_COLOR;
    pdctitleLab.textColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"db_blu_color"]];
    comPanyNumLab.textColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"db_blu_color"]];
    bgView.backgroundColor = QBB_GRAY_COLOR;
    
}

- (void)setFather:(ShowDetailVC *)father
{
    _father = father;
    titleLab.text = [WYPublic getUsefullStr:self.father.sd_title];
    countLab.text = [WYPublic getUsefullStr:self.father.sd_username];
    pdctitleLab.text = [NSString stringWithFormat:@"(第%@期)%@",[WYPublic getUsefullStr:self.father.sd_pdc_qishu],[WYPublic getUsefullStr:self.father.sd_pdc_title]];
    numLab.text = [NSString stringWithFormat:@"%@人次",[WYPublic getUsefullStr:self.father.sd_go_total]];
    codeLab.text = [WYPublic getUsefullStr:self.father.sd_code];
    timeLab.text = [WYPublic getUsefullStr:self.father.sd_pdc_end_time];
    companyLab.text = [WYPublic getUsefullStr:self.father.sd_company];
    comPanyNumLab.text = [WYPublic getUsefullStr:self.father.sd_company_code];
    showTimeLab.text = [WYPublic getUsefullStr:self.father.sd_time];
    contentLab.text = [WYPublic getUsefullStr:self.father.sd_sd_content];
    
    CGSize size = [self.father.sd_sd_content boundingRectWithSize:CGSizeMake(WYMWITH, WYMHEIGHT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: contentLab.font} context:nil].size;
    if (size.height > contentLab.frame.size.height) {
        CGRect frame = contentLab.frame;
        frame.size.height = size.height;
        [contentLab setAdjustsFontSizeToFitWidth:YES];
        [contentLab setFrame:frame];
        
        CGRect selfframe = self.frame;
        selfframe.size.height += (size.height-50);
        [self setFrame:selfframe];
    }
    
    if ([WYPublic getUsefullStr:self.father.sd_score].length == 0 || [[WYPublic getUsefullStr:self.father.sd_score] isEqualToString:@"0"]) {
        jifenImg.hidden = YES;
        jiangliLab.hidden = YES;
        jifenNumLab.hidden = YES;
    }else{
        //奖励积分
        jifenNumLab.text = [WYPublic getUsefullStr:self.father.sd_score];
    }
    
    //调整坐标
    if (!_sizeFlag) {
        bgView.frame = CGRectMake(bgView.frame.origin.x, bgView.frame.origin.y, bgView.frame.size.width, bgView.frame.size.height - 44);
        companyLab.hidden = YES;
        comPanyNumLab.hidden = YES;
        yc1.hidden = YES;
        yc2.hidden = YES;
        kuaidiBtn.hidden = YES;
        contentLab.frame = CGRectMake(contentLab.frame.origin.x, CGRectGetMaxY(bgView.frame)+8, contentLab.frame.size.width, contentLab.frame.size.height);
    }
    //加分割线
    [bgView addSubview:[WYPublic getFenGexian:0 :0 :WYMWITH :0.5]];
    [bgView addSubview:[WYPublic getFenGexian:0 :bgView.frame.size.height-0.5 :WYMWITH :0.5]];
}

//查询快递
- (IBAction)kuaidi:(id)sender {
    if ([self.father.sd_company_type class] == [NSNull class]) {
        return;
    }
    if ([self.father.sd_company_code class] == [NSNull class]) {
        return;
    }
    WYPublicWeb *web = [[WYPublicWeb alloc]init];
    web.mtitle = @"快递查询";
    web.urlStr = [NSString stringWithFormat:@"http://m.kuaidi100.com/index_all.html?type=%@&postid=%@",self.father.sd_company_type,self.father.sd_company_code];
    [[WYMainTabBarVC shareMainTaBarVC].navigationController pushViewController:web animated:YES];
}
@end
