//
//  FakeHUD.m
//  AnimationMy
//
//  Created by zgpeace on 12/07/2017.
//  Copyright © 2017 zgpeace. All rights reserved.
//

#import "FakeHUD.h"

@implementation FakeHUD

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (id)newFakeHUD
{
    UINib *nib = [UINib nibWithNibName:@"FakeHUD" bundle:nil];
    NSArray *nibArray = [nib instantiateWithOwner:self options:nil];
    FakeHUD *me = [nibArray firstObject];
    return me;
}

- (IBAction)btnStop
{
    [self removeWithSinkAnimation:40];
}


@end
