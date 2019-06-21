//
//  ViewController.m
//  GRPTableWithDifferentLabels
//
//  Created by Дмитрий Ванюшкин on 21/06/2019.
//  Copyright © 2019 Dmitry Vanyushkin. All rights reserved.
//

#import "ViewController.h"
#import "DifferentSizeTextTableViewCell.h"



@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSString*> *differentStringsArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain] ;
//    self.tableView = [UITableView new];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 600;
    
    NSString *reuseId = [DifferentSizeTextTableViewCell reuseId];
    [self.tableView registerClass:DifferentSizeTextTableViewCell.class forCellReuseIdentifier:reuseId];
    
    [self.view addSubview: self.tableView];
    
    [self setConstraints];
    
    [self generateArray];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // Do any additional setup after loading the view.
}

-(void) generateArray
{
    NSString *veryShortString = @"Hi!";
    NSString *shortString = @"Short string";
    NSString *mediumString = @"I'm a normal boy, probably I need two lines to fit";
    NSString *longString = @"I'm big boy, kuryu dope, chitayu teksta iz Platini i OG Budi I zanimayu mnogo mesta";
    NSString *veryLongString = @"Vse bablo letit na veter, mle4nii put ya na dugoi planete. Kuznetslii most 20. Alla Pugacheva. Million alih roz. A znaete otkuda vizhy? Da iz okna ya ih vizhu, no ya ne pussyboi";
    
    _differentStringsArray = [NSArray arrayWithObjects:veryShortString, shortString, mediumString, longString, veryLongString, nil];
}

-(void)setConstraints
{
    [self.tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
    [self.tableView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor].active = YES;
    [self.tableView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor].active = YES;
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    NSString *reuseId = [DifferentSizeTextTableViewCell reuseId];
    
    DifferentSizeTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    cell.flexTextLabel.text = self.differentStringsArray[indexPath.row % self.differentStringsArray.count];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.differentStringsArray.count * 2;
}


@end
