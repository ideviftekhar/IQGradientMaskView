//
// IQGradientMaskView.m
// https://github.com/hackiftekhar/IQGradientMaskView
// Copyright (c) 2016 Iftekhar Qurashi.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "IQGradientMaskView.h"

@interface IQGradientMaskView ()

@property(nonatomic, strong) CAGradientLayer *maskLayer;

@end


@implementation IQGradientMaskView

-(void)commonInit
{
    self.maskLayer = [[CAGradientLayer alloc] init];
    self.maskLayer.bounds = self.layer.bounds;
    self.maskLayer.colors = @[(id)[[UIColor clearColor] CGColor],
                              (id)[[UIColor blackColor] CGColor],
                              (id)[[UIColor blackColor] CGColor],
                              (id)[[UIColor clearColor] CGColor]];
    self.maskLayer.anchorPoint = CGPointZero;
    self.maskLayer.bounds = self.layer.bounds;
    self.layer.mask = self.maskLayer;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    [self commonInit];
}

-(void)setTopGradientHeight:(CGFloat)topGradientHeight
{
    _topGradientHeight = topGradientHeight;
    [self update];
}

-(void)setBottomGradientHeight:(CGFloat)bottomGradientHeight
{
    _bottomGradientHeight = bottomGradientHeight;
    [self update];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self update];
}

-(void)update
{
    CGFloat topPosition = MIN(1,_topGradientHeight/self.frame.size.height);
    CGFloat bottomPosition = 1 - MIN(1,_bottomGradientHeight/self.frame.size.height);
    
    self.maskLayer.locations = @[@(0),@(topPosition),@(bottomPosition),@(1)];
    
    self.maskLayer.bounds = self.layer.bounds;
    self.layer.mask = self.maskLayer;
}

@end
