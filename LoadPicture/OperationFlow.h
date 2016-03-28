//
//  OperationFlow.h
//  LoadPicture
//
//  Created by IOS on 16/3/28.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LowerList) {
    Left,
    Right
};
/**
 *  使用operation控制图片加载
 */
@interface OperationFlow : UIView{
    UIScrollView *_mainScroll;
    NSArray *_pictures;
    LowerList _lower;
}
@property (assign, nonatomic) LowerList lower;
@property (strong, nonatomic) UIScrollView *mainScroll;
@property (strong, nonatomic) NSArray *pictures;

- (void)addMore:(NSArray *)pictures;

- (void)refreshWithData:(NSArray *)pictures;

@end
