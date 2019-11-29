//
//  ThreeViewController.m
//  ReactiveLearn
//
//  Created by GPsmile on 17/5/16.
//  Copyright © 2017年 gpsmile. All rights reserved.
//

#import "ThreeViewController.h"
#define LYWeakify(object) __weak __typeof__(object) weak##_##object = object
#define LYStrongify(object) __typeof__(object) object = weak##_##object
@interface ThreeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *reulstLabel;
@property (weak, nonatomic) IBOutlet UITextField *ractextField;

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置信号
        LYWeakify(self);
        [[[[[[self requestAccessToSingal] then:^RACSignal *{
            LYStrongify(self);
          return   self.ractextField.rac_textSignal;
        }] filter:^BOOL(NSString *value) { //filter过滤数据传递的条件
            LYStrongify(self);
            return [self isVaildSearchText:value];
        }]
         flattenMap:^RACStream *(NSString *value) {
          LYStrongify(self);
             return
             [self singalForSearchText:value];
             
         }]//服务器的返回的结果要在主线程刷新UI
          deliverOn:[RACScheduler mainThreadScheduler]]
          subscribeNext:^(id x) {
              NSLog(@"%@",x);
              LYStrongify(self);
              self.reulstLabel.text = x;
          } error:^(NSError *error) {
              
          }];
}
//创建一个搜索的信号网络请求的信号
-(RACSignal *)singalForSearchText:(NSString * )textNumber
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSString *strm =[NSString stringWithFormat:@"服务器返回的结果%@",textNumber];
            [subscriber sendNext:strm];
            [subscriber sendCompleted];
        return nil;
    }];
}

- (RACSignal *)requestAccessToSingal
{
    NSError *Error = [NSError errorWithDomain:@"返回参数错误" code:1000 userInfo:nil];
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        int x = 20;
        if (x>15) {
            [subscriber sendNext:@(x)];
            [subscriber sendCompleted];
        }else{
            [subscriber sendError:Error];
        }
        return nil;
    }];
}

- (BOOL)isVaildSearchText:(NSString *)text
{
    if (text.length>6) {
        return YES;
    }else{
        return NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
