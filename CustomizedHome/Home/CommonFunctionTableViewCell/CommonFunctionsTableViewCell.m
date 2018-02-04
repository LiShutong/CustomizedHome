
//  CommonFunctionsTableViewCell.m
//  CustomizedHome
//
//  Created by 吴柳燕 on 2018/2/3.
//  Copyright © 2018年 吴柳燕. All rights reserved.
//

#import "CommonFunctionsTableViewCell.h"
#import "MyCollectionViewCell.h"

@interface CommonFunctionsTableViewCell() <UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource> {
    int num;
    int j;
}
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionView *collectionView1;
@property (nonatomic, assign) NSInteger currentCellNum;

@end

@implementation CommonFunctionsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.scrollView];
        [self.contentView addSubview:self.pageControl];
    }
    return self;
}

- (UIScrollView *)scrollView {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 180)];
    _scrollView.delegate = self;
    _scrollView.backgroundColor = [UIColor yellowColor];

    _scrollView.showsHorizontalScrollIndicator = true;
    _scrollView.showsVerticalScrollIndicator = true;
    _scrollView.pagingEnabled  = true;
    _scrollView.contentSize = CGSizeMake(ScreenWidth * 2, 0);
    _scrollView.bounces = false;
    [self setUpCollectionView];
    return _scrollView;
}

- (UIPageControl *)pageControl {
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.numberOfPages = 2;
    _pageControl.pageIndicatorTintColor = [UIColor blueColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    _pageControl.currentPage = 0;
    _pageControl.frame = CGRectMake(100, _scrollView.frame.size.height - 5, 100, 30);
    return _pageControl;
}

- (void)setUpCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(ScreenWidth / 4 - 6, 90);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 2;
    layout.minimumInteritemSpacing = 2;

    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 180) collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.showsVerticalScrollIndicator = false;
    collectionView.showsHorizontalScrollIndicator = true;
    collectionView.pagingEnabled = true;
    collectionView.scrollEnabled = false;
    [collectionView registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"MyCollectionViewCell"];
    collectionView.tag = 1;
    [_scrollView addSubview:collectionView];

    UICollectionViewFlowLayout *layout1 = [[UICollectionViewFlowLayout alloc] init];
    layout1.itemSize = CGSizeMake(ScreenWidth / 4 - 6, 90);
    layout1.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout1.minimumLineSpacing = 2;
    layout1.minimumInteritemSpacing = 2;

    UICollectionView *collectionView1 = [[UICollectionView alloc] initWithFrame:CGRectMake(ScreenWidth * 1, 0, ScreenWidth, 180) collectionViewLayout:layout1];
    collectionView1.delegate = self;
    collectionView1.dataSource = self;
    collectionView1.backgroundColor = [UIColor whiteColor];
    collectionView1.showsVerticalScrollIndicator = false;
    collectionView1.showsHorizontalScrollIndicator = true;
    collectionView1.pagingEnabled = true;
    collectionView1.scrollEnabled = false;
    [collectionView1 registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"MyCollectionViewCell"];
    collectionView1.tag = 2;
    [_scrollView addSubview:collectionView1];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger tag = collectionView.tag;
    if (tag == 1) {
        MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionViewCell" forIndexPath:indexPath];
        cell.textLabel.text = [[NSString alloc] initWithFormat:@"%li",(long)indexPath.row];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    } else if (tag == 2) {
        MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionViewCell" forIndexPath:indexPath];
        cell.textLabel.text = [[NSString alloc] initWithFormat:@"%li",(long)indexPath.row];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }
    return  nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView.tag == 1) {
        NSLog(@"1");
    }
    if (collectionView.tag == 2) {
        NSLog(@"2");
    }
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (collectionView.tag == 1) {
        return 8;
    }
    if (collectionView.tag == 2) {
        return 5;
    }
    return 0;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);
    int currentPage = page % 2;
    _pageControl.currentPage = currentPage;
}

@end
