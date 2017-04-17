//
//  MainCollectionViewCell.m
//  ThemeAndNightMode
//
//  Created by shen on 17/4/17.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "MainCollectionViewCell.h"

@implementation MainCollectionViewCell

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self){
        
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 1.0f;
        
    }else{
        for (UIView *view in self.contentView.subviews) {
            [view removeFromSuperview];
        }
    }
    
    return self;
}


@end
