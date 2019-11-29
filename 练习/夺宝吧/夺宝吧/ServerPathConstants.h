//
//  ServerPath.m
//  夺宝吧
//
//  Created by xiaocai on 15/11/24.
//  Copyright © 2015年 FangYuan. All rights reserved.
//


#pragma mark - 请求地址
#define DBB_IP @"https://1.dbba.cn/"
//#define DBB_IP @"http://t.dbba.cn/"
//营销方面接口
#define DBB_YX_IP @"http://api.dbba.cn:8080/"

#define IP_CHECK_SERVER  @"http://192.168.1.188:8080/db8_analytics/"
#pragma mark - 统计 服务器 购物车配置

//激活统计
#define JIHUO_URL @"activation"
//服务器维护管理
#define CHECK_SERVER @"maintain"
//

#pragma mark - 登录 验证码

#pragma mark - 首页 商品列表

//热门推荐URL
#define HOT_URL @"/api/ApiGoods/getGoodsList"
//请求广告图的链接
#define AD_IMGS @"/api/ApiMisc/getSlides"
//请求最新揭晓
#define NEW_PDC_URL @"/api/ApiGoods/getRevealList"
//商品详情
#define DETAIL_URL @"/api/ApiGoods/getGoodsDetail"
//新的最新揭晓界面的接口
#define  DETAIL_URL_NEW @"/api/ApiGoods/getGoodsDetailQuser"
//商品详情
#define NEW_PUBLISH_URL @"/api/ApiGoods/getRevealList"
//最新揭晓界面的单例
#define DETAIL_URL @"/api/ApiGoods/getGoodsDetail"
//新的最新揭晓界面的接口
#define  DETAIL_URL_NEW @"/api/ApiGoods/getGoodsDetailQuser"



#pragma mark - 支付

//支付请求
#define MAKE_ORDER_URL @"/api/ApiPay/generateCartOrdersForPay"

#define  PAY_URL @"/api/ApiPay/pay"

#define DEL_ORDER_URL @"/api/ApiPay/cancelCartOrdersForPay"
//支付前验证
#define YANZHENG_URL @"/api/ApiPay/pay"
//获取充值页面的配置信息
#define PEIZHI_URL @"/api/ApiPay/getRechargeConfig"
//取消订单
#define DEL_ORDER_URL @"/api/ApiPay/cancelCartOrdersForPay"
//生成充值验证
#define MAKEORDER_URL @"/api/ApiPay/generateRechargeOrderForPay"
//支付前验证
#define YANZHENG_URL @"/api/ApiPay/pay"


//获取意见反馈接口
#define FEEDBACK_URL @"api/ApiUser/feedback"
//获取充值页面的配置信息
#define PEIZHI_URL @"/api/ApiPay/getRechargeConfig"
//获取系统消息
#define NEWS_URL @"/api/ApiMisc/getSysMsgs"
//获取用户信息
#define GET_USERINFO_URL @"/api/ApiUser/getUserProfile"
//分享成功通知服务器
#define SHARE_SUCCESS @"/api/redpacket/share"

//判断字符串是否为空
//[_numZFB class] == [NSNull class] ||_numZFB.length == 0 || _numZFB == nil
