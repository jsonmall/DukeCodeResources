//
//  LYPopMenuViewDelegate.h
//  LYPopMenuView


#import <Foundation/Foundation.h>

@class LYPopMenuView, PopMenuModel, PopMenuButton;

@protocol LYPopMenuViewDelegate <NSObject>

- (void)popMenuView:(LYPopMenuView*)popMenuView didSelectItemAtIndex:(NSUInteger)index;


@end
