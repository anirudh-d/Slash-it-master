//
//  GameCenterScreenViewController.m
//  Screen
//
//  Created by iceking on 3/8/14.
//  Copyright (c) 2014 iceking. All rights reserved.
//

#import "GameCenterScreenViewController.h"
#import "HomeScreenViewController.h"
#import "Audio.h"

@interface GameCenterScreenViewController ()

@end

@implementation GameCenterScreenViewController

- (IBAction)backbutton:(id)sender {
    
    [[Audio sharedInstance] playMusic:@"button_press.wav"];
    [self.navigationController popViewControllerAnimated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *backgroundImage = [UIImage imageNamed:@"scoreboard.png"];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    [self.view insertSubview:backgroundImageView atIndex:0];
    backgroundImageView.image=backgroundImage;
	// Do any additional setup after loading the view.
    [self fetchScore];
}

-(void)fetchScore{
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistLevel = [rootPath stringByAppendingPathComponent:@"Player-score.plist"];
    NSDictionary *levelSetDictionary = [[NSDictionary alloc] initWithContentsOfFile:plistLevel];
    
    if(levelSetDictionary == nil){
        rootPath = [[NSBundle mainBundle] bundlePath];
        plistLevel = [rootPath stringByAppendingPathComponent:@"Player-score.plist"];
        levelSetDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:plistLevel];
    }
    NSDictionary *levelDictionary1 = [[NSDictionary alloc] initWithDictionary:[levelSetDictionary objectForKey:@"set1"]];
    NSDictionary *levelDictionary2 = [[NSDictionary alloc] initWithDictionary:[levelSetDictionary objectForKey:@"set2"]];
    NSDictionary *levelDictionary3 = [[NSDictionary alloc] initWithDictionary:[levelSetDictionary objectForKey:@"set3"]];
    
    //NSMutableArray *playerScores = [[NSMutableArray alloc]init];
    
    NSArray *s1L1 = [[NSArray alloc] init];
    NSArray *s1L2 = [[NSArray alloc] init];
    NSArray *s1L3 = [[NSArray alloc] init];
    NSArray *s2L1 = [[NSArray alloc] init];
    NSArray *s2L2 = [[NSArray alloc] init];
    NSArray *s2L3 = [[NSArray alloc] init];
    NSArray *s3L1 = [[NSArray alloc] init];
    NSArray *s3L2 = [[NSArray alloc] init];
    NSArray *s3L3 = [[NSArray alloc] init];
    
    //NSArray *setLevel = [NSArray arrayWithObjects:@"s1l1",@"s1l2",@"s1l3",@"s2l1",@"s2l2",@"s2l3",@"s3l1",@"s3l2",@"s3l3",nil];
    
    s1L1 = [NSArray arrayWithArray:[levelDictionary1 objectForKey:@"level1"]];
    s1L2 = [NSArray arrayWithArray:[levelDictionary1 objectForKey:@"level2"]];
    s1L3 = [NSArray arrayWithArray:[levelDictionary1 objectForKey:@"level3"]];
    
    s2L1 = [NSArray arrayWithArray:[levelDictionary2 objectForKey:@"level1"]];
    s2L2 = [NSArray arrayWithArray:[levelDictionary2 objectForKey:@"level2"]];
    s2L3 = [NSArray arrayWithArray:[levelDictionary2 objectForKey:@"level3"]];
    
    s3L1 = [NSArray arrayWithArray:[levelDictionary3 objectForKey:@"level1"]];
    s3L2 = [NSArray arrayWithArray:[levelDictionary3 objectForKey:@"level2"]];
    s3L3 = [NSArray arrayWithArray:[levelDictionary3 objectForKey:@"level3"]];
    
    int max=0;
    
    for(int i=0;i<3;i++){
        int val = [[s1L1 objectAtIndex:i] integerValue];
        if(val>max)
            max=val;
    }
    [_set1Level1 setText:[NSString stringWithFormat:@"%d",max]];
    max=0;
    
    for(int i=0;i<3;i++){
        int val = [[s1L2 objectAtIndex:i] integerValue];
        if(val>max)
            max=val;
    }
    [_set1Level2 setText:[NSString stringWithFormat:@"%d",max]];
    max=0;
    
    for(int i=0;i<3;i++){
        int val = [[s1L3 objectAtIndex:i] integerValue];
        if(val>max)
            max=val;
    }
    [_set1Level3 setText:[NSString stringWithFormat:@"%d",max]];
    max=0;
    
    for(int i=0;i<3;i++){
        int val = [[s2L1 objectAtIndex:i] integerValue];
        if(val>max)
            max=val;
    }
    [_set2Level1 setText:[NSString stringWithFormat:@"%d",max]];
    max=0;
    
    for(int i=0;i<3;i++){
        int val = [[s2L2 objectAtIndex:i] integerValue];
        if(val>max)
            max=val;
    }
    [_set2Level2 setText:[NSString stringWithFormat:@"%d",max]];
    max=0;
    
    for(int i=0;i<3;i++){
        int val = [[s2L3 objectAtIndex:i] integerValue];
        if(val>max)
            max=val;
    }
    [_set2Level3 setText:[NSString stringWithFormat:@"%d",max]];
    max=0;
    
    for(int i=0;i<3;i++){
        int val = [[s3L1 objectAtIndex:i] integerValue];
        if(val>max)
            max=val;
    }
    [_set3Level1 setText:[NSString stringWithFormat:@"%d",max]];
    max=0;
    
    for(int i=0;i<3;i++){
        int val = [[s3L2 objectAtIndex:i] integerValue];
        if(val>max)
            max=val;
    }
    [_set3Level2 setText:[NSString stringWithFormat:@"%d",max]];
    max=0;
    
    for(int i=0;i<3;i++){
        int val = [[s3L3 objectAtIndex:i] integerValue];
        if(val>max)
            max=val;
    }
    [_set3Level3 setText:[NSString stringWithFormat:@"%d",max]];
    max=0;
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
