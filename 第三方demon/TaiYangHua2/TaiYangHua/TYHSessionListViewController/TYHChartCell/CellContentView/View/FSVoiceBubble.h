//
//  FSVoiceBubble.h
//  Pods
//
//  Created by Wenchao Ding on 3/25/15.
//
//

#import <UIKit/UIKit.h>

@class FSVoiceBubble;

#ifndef IBInspectable
#define IBInspectable
#endif

@protocol FSVoiceBubbleDelegate <NSObject>

- (void)voiceBubbleDidStartPlaying:(FSVoiceBubble *)voiceBubble;

@end

@interface FSVoiceBubble : UIView

@property (strong, nonatomic) IBInspectable UIColor *textColor;
@property (strong, nonatomic) IBInspectable UIColor *waveColor;
@property (strong, nonatomic) IBInspectable UIColor *animatingWaveColor;
@property (strong, nonatomic) IBInspectable UIImage *bubbleImage;
@property (assign, nonatomic) IBInspectable BOOL    invert;
@property (assign, nonatomic) IBInspectable BOOL    exclusive;  //
@property (assign, nonatomic) IBInspectable BOOL    durationInsideBubble;
@property (assign, nonatomic) IBInspectable CGFloat waveInset;
@property (assign, nonatomic) IBInspectable CGFloat textInset;
@property (assign, nonatomic) IBOutlet id<FSVoiceBubbleDelegate> delegate;
@property (nonatomic,copy)NSString * seconds;//时长，用于在线下载音频时候
@property (readonly, getter=isPlaying) BOOL playing;

- (void)startAnimating;
- (void)stopAnimating;

@end
