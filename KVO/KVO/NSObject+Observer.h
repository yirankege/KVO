//
//  NSObject+Observer.h
//  KVO
//
//  Created by xjk on 24/09/2017.
//  Copyright © 2017 xjk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Observer)
-(void)xjk_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context;

@end
