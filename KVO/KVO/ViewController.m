//
//  ViewController.m
//  KVO
//
//  Created by xjk on 22/09/2017.
//  Copyright © 2017 xjk. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+Observer.h"
@interface ViewController ()

@end

@implementation ViewController
{
    Person * _person;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person * person = [[Person alloc]init];
    
    [person xjk_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    _person = person;
    
    [self performSelector:@selector(updatePerson) withObject:nil afterDelay:3.0];
    
   
}



-(void)updatePerson{
    _person.name = @"xjk";
  
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@  object:",change);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
