//
//  SecondViewController.h
//  Tax
//
//  Created by 刘 琳琳 on 12-1-28.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController {
    NSDictionary *taxDic;
    float salaryBeforeTax;
    
    UITextField *yanglaogeren;
    UITextField *yanglaogeren_rate;
    
    UITextField *yiliaogeren;
    UITextField *yiliaogeren_rate;
    
    UITextField *shiyegeren;
    UITextField *shiyegeren_rate;
    
    UITextField *gongjijingeren;
    UITextField *gongjijingeren_rate;
    
    UITextField *yanglaogongsi;
    UITextField *yanglaogongsi_rate;
    
    UITextField *yiliaogongsi;
    UITextField *yiliaogongsi_rate;
    
    UITextField *shiyegongsi;
    UITextField *shiyegongsi_rate;
    
    UITextField *gongjijingongsi;
    UITextField *gongjijingongsi_rate;
    
    UITextField *gongshang;
    UITextField *gongshang_rate;
    
    UITextField *shengyu;
    UITextField *shengyu_rate;
    
    UITextField *perTotal;
    UITextField *comTotal;
    
}
@property(nonatomic, retain) NSDictionary *taxDic;
@property(nonatomic) float salaryBeforeTax;
@property(nonatomic, retain) IBOutlet UITextField *yanglaogeren;
@property(nonatomic, retain) IBOutlet UITextField *yanglaogeren_rate;

@property(nonatomic, retain) IBOutlet UITextField *yiliaogeren;
@property(nonatomic, retain) IBOutlet UITextField *yiliaogeren_rate;

@property(nonatomic, retain) IBOutlet UITextField *shiyegeren;
@property(nonatomic, retain) IBOutlet UITextField *shiyegeren_rate;

@property(nonatomic, retain) IBOutlet UITextField *gongjijingeren;
@property(nonatomic, retain) IBOutlet UITextField *gongjijingeren_rate;

@property(nonatomic, retain) IBOutlet UITextField *yanglaogongsi;
@property(nonatomic, retain) IBOutlet UITextField *yanglaogongsi_rate;

@property(nonatomic, retain) IBOutlet UITextField *yiliaogongsi;
@property(nonatomic, retain) IBOutlet UITextField *yiliaogongsi_rate;

@property(nonatomic, retain) IBOutlet UITextField *shiyegongsi;
@property(nonatomic, retain) IBOutlet UITextField *shiyegongsi_rate;

@property(nonatomic, retain) IBOutlet UITextField *gongjijingongsi;
@property(nonatomic, retain) IBOutlet UITextField *gongjijingongsi_rate;

@property(nonatomic, retain) IBOutlet UITextField *gongshang;
@property(nonatomic, retain) IBOutlet UITextField *gongshang_rate;

@property(nonatomic, retain) IBOutlet UITextField *shengyu;
@property(nonatomic, retain) IBOutlet UITextField *shengyu_rate;

@property(nonatomic, retain) IBOutlet UITextField *perTotal;
@property(nonatomic, retain) IBOutlet UITextField *comTotal;

-(id) initWithTaxDic:(NSDictionary *)tax andSalary:(float)salary; 
@end
