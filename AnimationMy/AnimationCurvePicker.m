//
//  AnimationCurvePicker.m
//  AnimationMy
//
//  Created by zgpeace on 11/07/2017.
//  Copyright © 2017 zgpeace. All rights reserved.
//

#import "AnimationCurvePicker.h"

@implementation AnimationCurvePicker

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (id)newAnimationCurvePicker:(id)pickerDelegate
{
    UINib *nib = [UINib nibWithNibName:@"AnimationCurvePicker" bundle:nil];
    NSArray *nibArray = [nib instantiateWithOwner:self options:nil];
    AnimationCurvePicker *me = [nibArray objectAtIndex:0];
    me.animationList.delegate = pickerDelegate;
    me.animationList.dataSource = pickerDelegate;
    
    return me;
}

@end
