//
//  RootViewController.m
//  01AVAudioPlayerDemo
//
//  Created by yaojinyuan on 15-1-13.
//  Copyright (c) 2015年 福诺学院. All rights reserved.
//

#import "RootViewController.h"


@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    UIView *view = [[UIView alloc] init];
    //    [self.view addSubview:view];

    //设置音频会话支持后台播放
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback  error:NULL];
    
    
    
    NSString *filePath =[[NSBundle mainBundle] pathForResource:@"后会无期" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
    
    player.delegate = self;
    //准备播放
    [player prepareToPlay];
    
    //开始播放
//    [player play];
    
//    [player release];
    
    
    [playButton setTitle:@"播放" forState:UIControlStateNormal];
    
    volunmSlider.maximumValue = 1.0;
    volunmSlider.minimumValue = 0.0;
    
    
//    player.currentTime
    
    timeLabel.text =[NSString stringWithFormat:@"%f",player.currentTime];
    
    
    playSlider.minimumValue = 0.0;
    playSlider.maximumValue = player.duration;
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];


}

- (void)timeAction:(NSTimer *)timer;
{
    playSlider.value = player.currentTime;
    timeLabel.text =[NSString stringWithFormat:@"%f",player.currentTime];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//- (void)dealloc
//{
//    [super dealloc];
//}

- (void)dealloc {
    [volunmSlider release];
    [timeLabel release];
    [playSlider release];
    [playButton release];
    [super dealloc];
}
- (IBAction)volunmAction:(UISlider *)sender {
    player.volume = sender.value;
}

- (IBAction)movingAction:(UISlider *)sender {
    
    player.currentTime = sender.value;
    
}

- (IBAction)playButtonAction:(UIButton *)sender {
    
    if (player.playing) {
        [player pause];
        [playButton setTitle:@"播放" forState:UIControlStateNormal];
    }else
    {
        [player play];
        [playButton setTitle:@"暂停" forState:UIControlStateNormal];
    }
    
}


#pragma mark AVAudioPlayerDelegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSLog(@"播放结束");
}
@end
