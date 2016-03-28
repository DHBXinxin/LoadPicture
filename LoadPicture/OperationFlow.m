//
//  OperationFlow.m
//  LoadPicture
//
//  Created by IOS on 16/3/28.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "OperationFlow.h"

#define Space 5//间隔

@interface OperationFlow ()
{
    CGFloat viewWidth;
    CGFloat viewHeight;//本view的宽和高
    
    BOOL firstPicture;
    
    UIView *leftView;
    UIView *rightView;//两列cell
    
    CGFloat columuWidth;//每列的宽度
    
    CGFloat leftHeight;
    CGFloat rightHeight;//左右边的高度
    
}

@property (strong, nonatomic) NSOperationQueue *mainQueue;


@end
@implementation OperationFlow
@synthesize lower = _lower;
@synthesize mainScroll = _mainScroll;
@synthesize pictures = _pictures;

- (NSOperationQueue *)mainQueue {
    if (_mainQueue) {
        return _mainQueue;
    }
    
    _mainQueue = [[NSOperationQueue alloc]init];
    [_mainQueue setMaxConcurrentOperationCount:1];
    return _mainQueue;
}
- (UIScrollView *)mainScroll {
    if (_mainScroll) {
        return _mainScroll;
    }
    _mainScroll = [[UIScrollView alloc]initWithFrame:self.frame];
    [_mainScroll setContentSize:self.frame.size];
    
    leftView = [[UIView alloc]initWithFrame:CGRectMake(Space, Space, columuWidth, 0)];
    [_mainScroll addSubview:leftView];
    
    rightView = [[UIView alloc]initWithFrame:CGRectMake(Space * 2 + columuWidth, Space, columuWidth, 0)];
    [_mainScroll addSubview:rightView];
    
    return _mainScroll;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        viewWidth = frame.size.width;
        viewHeight = frame.size.height;
        columuWidth = (viewWidth - Space * 3) / 2;
        firstPicture = YES;
        
        [self addSubview:self.mainScroll];
        
    }
    return self;
}
- (void)setPictures:(NSArray *)pictures {
    [self refreshWithData:pictures];
}
- (void)addMore:(NSArray *)pictures {
    [self getImageData:pictures];
}
- (void)refreshWithData:(NSArray *)pictures {
    firstPicture = YES;
    if (leftView.subviews.count > 0) {
        [leftView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        leftView.frame = CGRectMake(leftView.frame.origin.x, leftView.frame.origin.y, columuWidth, 0);
    }
    if (rightView.subviews.count > 0) {
        [rightView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        rightView.frame = CGRectMake(rightView.frame.origin.x, rightView.frame.origin.y, columuWidth, 0);
    }
    [_mainScroll setContentSize:self.frame.size];
    if (_mainQueue) {
        [_mainQueue cancelAllOperations];
        _mainQueue = nil;
    }
    [self getImageData:pictures];
}
- (void)getImage:(NSString *)string {
    NSURL *url = [NSURL URLWithString:string];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [[UIImage alloc]initWithData:data];
    [self performSelectorOnMainThread:@selector(makePictuerVisible:) withObject:image waitUntilDone:YES];
}
- (void)getImageData:(NSArray *)pictures {
    for (NSInteger i = 0; i < pictures.count; i++) {
        NSInvocationOperation *op = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(getImage:) object:pictures[i]];
        [self.mainQueue addOperation:op];
    }
}
- (void)makePictuerVisible:(UIImage *)image {
    _lower = [self checkList];
    CGFloat pictuerWidth = columuWidth;
    CGFloat pictuerHeight = pictuerWidth * image.size.height / image.size.width;
    UIImageView *picture = nil;
    switch (_lower) {
        case Left:
        {
            picture = [[UIImageView alloc]initWithFrame:CGRectMake(0, leftHeight, pictuerWidth, pictuerHeight)];
            leftView.frame = CGRectMake(leftView.frame.origin.x, leftView.frame.origin.y, columuWidth, leftHeight + pictuerHeight + Space);
            [leftView addSubview:picture];
        }
            break;
        case Right:
            picture = [[UIImageView alloc]initWithFrame:CGRectMake(0, rightHeight, pictuerWidth, pictuerHeight)];
            rightView.frame = CGRectMake(rightView.frame.origin.x, rightView.frame.origin.y, columuWidth, rightHeight + pictuerHeight + Space);
            [rightView addSubview:picture];
            break;
        default:
            break;
    }
    picture.image = image;
    [_mainScroll setContentSize:CGSizeMake(viewWidth, CGRectGetMaxY(picture.frame) + Space)];
}
- (LowerList)checkList {
    LowerList temp;
    leftHeight = leftView.frame.size.height;
    rightHeight = rightView.frame.size.height;
    
    if (firstPicture) {
        temp = Left;
        firstPicture = NO;
    } else {
        if (leftHeight >= rightHeight) {
            temp = Right;
        } else {
            temp = Left;
        }
    }
    return temp;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
