//
//  AnimationCurvePicker.h
//  AnimationMy
//
//  Created by zgpeace on 11/07/2017.
//  Copyright © 2017 zgpeace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationCurvePicker : UIView

@property (nonatomic, weak) IBOutlet UITableView *animationList;

+ (id)newAnimationCurvePicker:(id)pickDelegate;

@end
