//
//  TYKNearViewController.m
//  TestYingKe
//
//  Created by xujing on 16/11/21.
//  Copyright © 2016年 xujing. All rights reserved.
//

#import "TYKNearViewController.h"
#import "SXTNearLiveCell.h"
#import "TYKPlayerViewController.h"
#import "SXTHotLiveHandler.h"

static NSInteger kItemSizeW = 100;
static NSInteger kMargin = 5;
static NSString * identifier = @"SXTNearLiveCell";

@interface TYKNearViewController ()<UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray * dataList;

@end

@implementation TYKNearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerNib:[UINib nibWithNibName:@"SXTNearLiveCell" bundle:nil] forCellWithReuseIdentifier:identifier];
    
    [self loadData];

}

- (void)loadData {
    
    [SXTHotLiveHandler executeNearLiveTaskWithSuccess:^(id obj) {
        
        self.dataList = obj;
        [self.collectionView reloadData];
        
    } failed:^(id obj) {
        
        NSLog(@"%@",obj);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat outInset = self.view.width - 2 * kMargin;
    NSInteger count = outInset / kItemSizeW;
    NSInteger extraTotal = (NSInteger)(outInset - kMargin * (count - 1 ));
    
    CGFloat itemWH;
    
    if (extraTotal < count * kItemSizeW) {
        
        itemWH = extraTotal / count;
        
    } else {
        
        CGFloat extraWidth = extraTotal % kItemSizeW;
        itemWH = kItemSizeW + extraWidth / count;
    }
    
    return CGSizeMake(itemWH, itemWH + 25);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SXTNearLiveCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.live = self.dataList[indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TYKPlayerViewController * playerVC = [[TYKPlayerViewController alloc] init];
    
    playerVC.live = self.dataList[indexPath.row];
    [playerVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:playerVC animated:YES];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SXTNearLiveCell * c = (SXTNearLiveCell *)cell;
    [c showAnimation];
}






@end
