//
//  qgTableViewController.m
//  菜单
//
//  Created by Strong on 16/7/5.
//  Copyright © 2016年 strong. All rights reserved.
//

#import "qgTableViewController.h"

@interface qgTableViewController ()
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *images;
@end



@implementation qgTableViewController
- (NSArray *)titles {
    if (!_titles) {
        _titles = [self.dataDic allKeys];
    }
    return _titles;
}
- (NSArray *)images {
    if (!_images) {
        _images = [self.dataDic allValues];
    }
    return _images;
}


- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return self.titles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
   cell.textLabel.text = self.titles[indexPath.row];
  cell.imageView.image = self.images[indexPath.row];
   
    return cell;
}

- (CGSize)preferredContentSize {
    if (self.presentingViewController && self.tableView != nil) {
        CGSize tempSize = self.presentingViewController.view.bounds.size;
        tempSize.width = 150;
        CGSize size = [self.tableView sizeThatFits:tempSize];  //sizeThatFits返回的是最合适的尺寸，但不会改变控件的大小
        return size;
    }else {
        return [super preferredContentSize];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row+1);
    [self  dismissViewControllerAnimated:YES completion:nil];
}


@end
