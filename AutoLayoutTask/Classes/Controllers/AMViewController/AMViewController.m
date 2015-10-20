//
//  AMViewController.m
//  AutoLayoutTask
//
//  Created by Mark on 19.10.15.
//  Copyright © 2015 ThinkMobiles. All rights reserved.
//

#import "AMViewController.h"

#import "AMText.h"

#import "AMButton.h"

@interface AMViewController ()

@property (weak, nonatomic) IBOutlet UIButton *clearButton;
@property (weak, nonatomic) IBOutlet UIButton *loadButton;
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;

@end

@implementation AMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    [self addConstraints];
//    [self addConstraintsVisualFormat];
}

#pragma mark - Actions

- (IBAction)loadDataAction:(AMButton *)button
{
    [self loadData];
}

- (IBAction)clearLableAction:(AMButton *)button
{
    [self clearLabel];
}

#pragma mark - Private Methods

- (void)clearLabel
{
    if (![self.dataLabel.text isEqualToString:@"Click Load!!!"]) {
        self.dataLabel.text = @"Click Load!!!";
        self.dataLabel.backgroundColor = [UIColor clearColor];
    }
}

- (void)loadData
{
    AMText *text = [AMText textWithDataFromTextFile];
    self.dataLabel.text = text.text;
    self.dataLabel.backgroundColor = [UIColor colorWithRed:218.f/255.f green:235.f/255.f blue:245.f/255.f alpha:1.f];
}

#pragma mark - NSLayoutConstraint

- (void)addConstraints
{
    [self addDataLabelConstraints];
    [self addClearButtonConstraints];
    [self addLoadButtonConstraints];
}

- (void)addClearButtonConstraints
{
    self.clearButton.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *clearButtonLeadingConstraint = [NSLayoutConstraint constraintWithItem:self.clearButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.f constant:10.f];
    NSLayoutConstraint *clearButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.clearButton attribute:NSLayoutAttributeBottom multiplier:1.f constant:10.f];
    [self.view addConstraints:@[clearButtonLeadingConstraint, clearButtonBottomConstraint]];
}

- (void)addLoadButtonConstraints
{
    self.loadButton.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *loadButtonTrailingConstraint = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.loadButton attribute:NSLayoutAttributeTrailing multiplier:1.f constant:10.f];
    NSLayoutConstraint *loadButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.loadButton attribute:NSLayoutAttributeBottom multiplier:1.f constant:10.f];
    [self.view addConstraints:@[loadButtonTrailingConstraint, loadButtonBottomConstraint]];
}

- (void)addDataLabelConstraints
{
    self.dataLabel.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *dataLabelLeadingConstrait = [NSLayoutConstraint constraintWithItem:self.dataLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.f constant:25.f];
    NSLayoutConstraint *dataLabelTrailingConstraint = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.dataLabel attribute:NSLayoutAttributeTrailing multiplier:1.f constant:25.f];
    NSLayoutConstraint *dataLabelTopConstraint = [NSLayoutConstraint constraintWithItem:self.dataLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.f constant:30.f];
    NSLayoutConstraint *dataLabelBottomConstraint = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.dataLabel attribute:NSLayoutAttributeBottom multiplier:1.f constant:100.f];
    [self.view addConstraints:@[dataLabelLeadingConstrait, dataLabelTrailingConstraint,dataLabelTopConstraint, dataLabelBottomConstraint]];
}

#pragma mark - Visual Format Language

- (void)addConstraintsVisualFormat
{
    [self addClearButtonConstraintsVisualFormat];
    [self addLoadButtonConstraintsVisualFormat];
    [self addDataLabelConstraintsVisualFormat];
}

- (void)addClearButtonConstraintsVisualFormat
{
    UIButton *button = self.clearButton;
    button.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *views = NSDictionaryOfVariableBindings(button);
    NSArray *buttonHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[button]" options:0 metrics:nil views:views];
    NSArray *buttonVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[button]-10-|" options:0 metrics:nil views:views];
    [self.view addConstraints:buttonHorizontalConstraints];
    [self.view addConstraints:buttonVerticalConstraints];
}

- (void)addLoadButtonConstraintsVisualFormat
{
    UIButton *button = self.loadButton;
    button.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *views = NSDictionaryOfVariableBindings(button);
    NSArray *buttonHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[button]-10-|" options:0 metrics:nil views:views];
    NSArray *buttonVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[button]-10-|" options:0 metrics:nil views:views];
    [self.view addConstraints:buttonHorizontalConstraints];
    [self.view addConstraints:buttonVerticalConstraints];
}

- (void)addDataLabelConstraintsVisualFormat
{
    UILabel *label = self.dataLabel;
    id topGuide = self.topLayoutGuide;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *views = NSDictionaryOfVariableBindings(label,topGuide);
    NSArray *labelHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-25-[label]-25-|" options:0 metrics:nil views:views];
    NSArray *labelVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topGuide]-30-[label]->=100-|" options:0 metrics:nil views:views];
    [self.view addConstraints:labelHorizontalConstraints];
    [self.view addConstraints:labelVerticalConstraints];
}

@end
