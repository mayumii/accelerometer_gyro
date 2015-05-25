//
//  ViewController.m
//  motion
//
//  Created by mayumi on 2015/05/23.
//  Copyright (c) 2015年 mayumi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    CMMotionManager *motionManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    motionManager = [[CMMotionManager alloc]init];
    
    [self startCMAccelerometerData];
    [self startCMGyroData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startCMAccelerometerData{
    // 加速度センサーの有無を確認
    if (motionManager.accelerometerAvailable){
        //センサーの更新間隔の指定、100hz
        motionManager.accelerometerUpdateInterval = 0.5f;
        
        //ハンドラを指定
        CMAccelerometerHandler handler = ^(CMAccelerometerData *data, NSError *error){
            // 加速度センサー
            double xac = data.acceleration.x;
            double yac = data.acceleration.y;
            double zac = data.acceleration.z;
            
            //画面に表示
            self.accelerometerX.text = [NSString stringWithFormat:@"x:%0.3f", xac];
            self.accelerometerY.text = [NSString stringWithFormat:@"y:%0.3f", yac];
            self.accelerometerZ.text = [NSString stringWithFormat:@"z:%0.3f", zac];
            
        };
        
        //加速度の取得開始
        [motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:handler];
        
    }
    
    if (motionManager.accelerometerActive) {
        [motionManager stopAccelerometerUpdates];
    }
}

-(void)startCMGyroData{
    if (motionManager.gyroAvailable){
        motionManager.gyroUpdateInterval = 0.5f;
        
        CMGyroHandler handler = ^(CMGyroData *data, NSError *error){
            // ジャイロ
            double xgy = data.rotationRate.x;
            double ygy = data.rotationRate.y;
            double zgy = data.rotationRate.z;

            self.gyroX.text = [NSString stringWithFormat:@"x:%0.3f", xgy];
            self.gyroY.text = [NSString stringWithFormat:@"y:%0.3f", ygy];
            self.gyroZ.text = [NSString stringWithFormat:@"z:%0.3f", zgy];
        };
        [motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:handler];
    }
    
    if(motionManager.gyroActive){
        [motionManager stopGyroUpdates];
    }
}

@end
