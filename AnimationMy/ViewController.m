//
//  ViewController.m
//  AnimationMy
//
//  Created by zgpeace on 11/07/2017.
//  Copyright © 2017 zgpeace. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Animation.h"
#import "FakeHUD.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UIButton *movingButton;

- (IBAction)btnMoveTo:(id)sender;

- (IBAction)btnDownUnder:(id)sender;

- (IBAction)btnHUD:(id)sender;

@end

static int curveValues[] = {
    UIViewAnimationOptionCurveEaseInOut,
    UIViewAnimationOptionCurveEaseIn,
    UIViewAnimationOptionCurveEaseOut,
    UIViewAnimationOptionCurveLinear
};

static NSString * const cellIdentifier = @"cellID";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _curvesList = @[@"EaseInOut", @"EaseIn", @"EaseOut", @"Linear"].mutableCopy;
    _selectedCurveIndex = 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - animation actions

- (IBAction)btnMoveTo:(id)sender
{
    UIButton *button = (UIButton *)sender;
    [_movingButton moveTo:CGPointMake(button.center.x - (_movingButton.frame.size.width / 2), button.frame.origin.y - (_movingButton.frame.size.height + 5.0)) duration:1 option:0];
}

- (IBAction)btnDownUnder:(id)sender
{
    UIButton *button = (UIButton *)sender;
    [button downUnder:1.0 option:UIViewAnimationOptionCurveLinear];
}


- (IBAction)btnZoom:(id)sender
{
    UIButton *button = (UIButton *)sender;
    _pickerView = [AnimationCurvePicker newAnimationCurvePicker:self];
    // the animation will start in the middle of the button
    _pickerView.center = button.center;
    [self.view addSubviewWithZoomInAnimation:_pickerView duration:1.0 option:curveValues[_selectedCurveIndex]];
}

- (IBAction)btnHUD:(id)sender
{
    FakeHUD *theSubView = [FakeHUD newFakeHUD];
    [self.view addSubviewWithFadeAnimation:theSubView duration:1.0 option:curveValues[_selectedCurveIndex]];
}

#pragma  mark - animation curves picker

// handling the picker, that is a simple tableview in this example
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_curvesList count]; 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = [_curvesList objectAtIndex:indexPath.row];
    
    if (indexPath.row == _selectedCurveIndex) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Select the Animation Curve to be used";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"Curves will not affect total duration but instant speed and acceleration";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    if (_selectedCurveIndex != indexPath.row) {
        NSIndexPath *oldPath = [NSIndexPath indexPathForRow:_selectedCurveIndex inSection:indexPath.section];
        cell = [tableView cellForRowAtIndexPath:oldPath];
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        _selectedCurveIndex = indexPath.row;
    }
    
    if (_pickerView) {
        [_pickerView removeWithZoomOutAnimation:1.0 option:curveValues[_selectedCurveIndex]];
        _pickerView = nil;
    }
    
}









@end
