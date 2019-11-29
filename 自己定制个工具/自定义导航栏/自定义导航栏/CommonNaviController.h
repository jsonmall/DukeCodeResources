//


//

#import "HMCustomViewController.h"
//#import "RDVTabBarController.h"

#define Navi_LeftImgNormal          @"Navi_LeftImgNormal"
#define Navi_LeftImgHighlighted     @"Navi_LeftImgHighlighted"
#define Navi_LeftImgSelected        @"Navi_LeftImgSelected"
#define Navi_RightImgNormal         @"Navi_RightImgNormal"
#define Navi_RightImgHighlighted    @"Navi_RightImgHighlighted"
#define Navi_RightImgSelected       @"Navi_RightImgSelected"
#define Navi_Title                  @"Navi_Title"
#define Navi_LeftTitle              @"Navi_LeftTitle"
#define Navi_RightTitle             @"Navi_RightTitle"
#define Navi_BarBackgroundColor     @"Navi_BarBackgroundColor"

typedef enum _NaviBarType{
    navi_OnlyLeftBtn = 1,
    navi_OnlyRightBtn,
    navi_OnlyLeftTitle,
    navi_OnlyRightTitle,
    
    navi_LeftBtn_RightBtn,
    navi_LeftBtn_RightTitle,
    navi_LeftTitle_RightBtn,
    navi_LeftTitle_RightTitle,
    navi_none
    
}NaviBarType;

@interface CommonNaviController : HMCustomViewController

@property (nonatomic, assign) NaviBarType  barType;

/**
 *  初始化NaviBar
 *
 *  @param dic  储存图片名或title
 *  @param type 导航栏的类型
 */
-(void)customizeNaviBarForDictionary:(NSDictionary *)dic barType:(NaviBarType)type;

-(void)leftBtnClick:(UIButton *)click;

-(void)rightBtnClick:(UIButton *)click;

-(void)setNaviLeftBtnFrame:(CGRect)frame;

-(void)setNaviRightBtnFrame:(CGRect)frame;

/**
 *  导航栏底部增加线条
 */
-(void)setNaviBarLine;


/**
 *  插座控制界面，根据开关设置不同的导航栏颜色
 *
 *  @param leftSelected  YES:左按钮设置为Selected状态  NO:Normal状态
 *  @param rightSelected 同上
 *  @param titleIsGreen  标题是否是绿色
 *  @param naviIsGreen   导航栏是否是绿色
 *  @param disappear     Controller的View消失的时候设置为YES，将不设置状态栏的颜色
 */
-(void)leftBtnSelected:(BOOL)leftSelected
      rightBtnSelected:(BOOL)rightSelected
     titleIsGreenColor:(BOOL)titleIsGreen
      naviColorIsGreen:(BOOL)naviIsGreen
         ViewDisappear:(BOOL)disappear;


@end
