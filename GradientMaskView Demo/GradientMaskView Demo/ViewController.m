//
//  ViewController.m
//  GradientMaskView Demo

//  https://github.com/hackiftekhar/IQGradientMaskView
//  Copyright (c) 2016 Iftekhar Qurashi.

#import "ViewController.h"
#import "IQGradientMaskView.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet IQGradientMaskView *gradientView;

@property (strong, nonatomic) IBOutlet UISlider *slider1;
@property (strong, nonatomic) IBOutlet UISlider *slider2;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)slider1Action:(UISlider *)sender {
    self.gradientView.topGradientHeight = _slider1.value;
}

- (IBAction)slider2Action:(UISlider *)sender {
    self.gradientView.bottomGradientHeight = _slider2.value;
}

@end
