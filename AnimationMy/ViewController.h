//
//  ViewController.h
//  AnimationMy
//
//  Created by zgpeace on 11/07/2017.
//  Copyright © 2017 zgpeace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationCurvePicker.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *curvesList;
@property (nonatomic, assign) NSInteger selectedCurveIndex;
@property (nonatomic, strong) UIView *pickerView;


@end

