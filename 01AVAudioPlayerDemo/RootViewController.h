//
//  RootViewController.h
//  01AVAudioPlayerDemo
//
//  Created by yaojinyuan on 15-1-13.
//  Copyright (c) 2015年 福诺学院. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface RootViewController : UIViewController<AVAudioPlayerDelegate>
{
    AVAudioPlayer *player;
    
    
    IBOutlet UIButton *playButton;
    
    IBOutlet UISlider *volunmSlider;
    
    IBOutlet UILabel *timeLabel;
    
    
    IBOutlet UISlider *playSlider;
    
    
}


- (IBAction)volunmAction:(UISlider *)sender;

- (IBAction)movingAction:(UISlider *)sender;

- (IBAction)playButtonAction:(UIButton *)sender;



@end
