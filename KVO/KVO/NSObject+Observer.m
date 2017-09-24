//
//  NSObject+Observer.m
//  KVO
//
//  Created by xjk on 24/09/2017.
//  Copyright © 2017 xjk. All rights reserved.
//

#import "NSObject+Observer.h"
#import <objc/message.h>
@implementation NSObject (Observer)
-(void)xjk_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context{
    
    //allocate new subclass
    NSString * selfClassStr = NSStringFromClass([self class]);
    NSString * subClassStr = [@"Xjk_" stringByAppendingString:selfClassStr];
    Class subClass = objc_allocateClassPair([self class], subClassStr.UTF8String, 0);
    // register new subClasses
    objc_registerClassPair(subClass);
    //modify self to subClass
    object_setClass(self, subClass);
    
    
    //help subclasses add the name method
    class_addMethod(subClass, @selector(setName:), (IMP)setName, "");
    
    //association observer to key
    objc_setAssociatedObject(self, @"key", observer, OBJC_ASSOCIATION_ASSIGN);
}


void setName(id self,SEL _cmd,NSString *name){
    
    NSLog(@"coming");
    // record class
    Class class = [self class];
    
    //modify  self class to superClass
    object_setClass(self, [self superclass]);
    objc_msgSend(self, @selector(setName:),name);
    
    
    
    //gets the value of associated key
    id observer = objc_getAssociatedObject(self, @"key");
    
    //send messages to observer
    objc_msgSend(observer, @selector(observeValueForKeyPath:ofObject:change:context:),@"name",self,@{@"newValue":name},nil);
    
    //update class to origin
    object_setClass(self, class);
}








@end
