//
//  WaterFlow.h
//  LoadPicture
//
//  Created by IOS on 16/3/25.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Space 5//间隔

typedef NS_ENUM(NSInteger, LowerList) {
    Left,
    Right
};
@interface WaterFlow : UIView {
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
