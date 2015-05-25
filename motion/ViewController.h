//
//  ViewController.h
//  motion
//
//  Created by mayumi on 2015/05/23.
//  Copyright (c) 2015年 mayumi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController

@property (nonatomic, retain) IBOutlet UILabel *accelerometerX;
@property (nonatomic, retain) IBOutlet UILabel *accelerometerY;
@property (nonatomic, retain) IBOutlet UILabel *accelerometerZ;

@property (nonatomic, retain) IBOutlet UILabel *gyroX;
@property (nonatomic, retain) IBOutlet UILabel *gyroY;
@property (nonatomic, retain) IBOutlet UILabel *gyroZ;


@end

