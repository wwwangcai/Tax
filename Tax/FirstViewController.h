//
//  FirstViewController.h
//  Tax
//
//  Created by 刘 琳琳 on 12-1-28.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
#import "DropDownList.h"

@interface FirstViewController : UIViewController <DropDownListDelegate>{
    UITextField *salaryBeforeTax;
    UITextField *taxBase;
    UITextField *enSure;
    UITextField *salaryAfterTax;
    UITextField *tax;
    NSDictionary *cityTaxDic;
    NSDictionary *taxRateDic;
    
    //DropDownList *cityList;
    NSString *selectCity;
    float salary;
}

@property(nonatomic, retain) IBOutlet UITextField *salaryBeforeTax;
@property(nonatomic, retain) IBOutlet UITextField *taxBase;
@property(nonatomic, retain) IBOutlet UITextField *enSure;
@property(nonatomic, retain) IBOutlet UITextField *salaryAfterTax;
@property(nonatomic, retain) IBOutlet UITextField *tax;
@property(nonatomic, retain) NSDictionary *cityTaxDic;
@property(nonatomic, retain) NSDictionary *taxRateDic;
@property(nonatomic, assign) float salary;
@property(nonatomic, retain) NSString *selectCity;

-(IBAction) calculate;
-(IBAction) clearInput;
-(IBAction) detailEnsure;
-(IBAction) reverseCalculate;
-(IBAction) cityFieldEditDone:(id)sender;
-(IBAction) backgrundTap:(id)sender;
-(float) calculateTax:(float) salary_f;
-(BOOL) inputValidate;
@end
