//
//  CollectionVC.m
//  HJCarouselDemo
//
//  Created by GPsmile on 16/8/15.
//  Copyright © 2016年 olinone. All rights reserved.
//

#import "CollectionVC.h"
#import "HJCarouselViewCell.h"
#import "GPCollectionReusableView.h"
#import "WaterfulldownFlowLayout.h"

static NSString *const cellone=@"collectionCell";
static NSString *const headr=@"headerColletionHeader";
@interface CollectionVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSArray *heightArr;
@end

@implementation CollectionVC
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self collectionView];
}
-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:self.flowLayout];
       self.flowLayout.headerReferenceSize=CGSizeMake(self.view.bounds.size.width, 45);
        self.collectionView.alwaysBounceVertical = YES;
        _collectionView.backgroundColor=[UIColor lightGrayColor];
        self.flowLayout.minimumLineSpacing=10;
        self.flowLayout.minimumInteritemSpacing=10;
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        _collectionView.showsHorizontalScrollIndicator=YES;
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([HJCarouselViewCell class]) bundle:nil] forCellWithReuseIdentifier:cellone];
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([GPCollectionReusableView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headr];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HJCarouselViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellone forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", arc4random()%20]];
    //[cell makeStyle:self.roundStyle Corner:cell.frame.size.width/2];
    return cell;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind==UICollectionElementKindSectionHeader) {
        GPCollectionReusableView *headrV=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headr forIndexPath:indexPath];
        headrV.headerTitleLabel.text=[NSString stringWithFormat:@"Header%ld",indexPath.section];
        return headrV;
    }else{
        return nil;
    }
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.carouselAnim==GPSuSpension) {
        return 20;
    }
    else if (self.carouselAnim==GPCirlel)
    {
        return 10;
    }
    else
    {
    return 50;
    }
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (self.carouselAnim==GPSuSpension) {
        return 3;
    }else{
        return 1;
    }
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.item);
}
@end
