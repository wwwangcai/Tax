//
//  SecondViewController.m
//  Tax
//
//  Created by 刘 琳琳 on 12-1-28.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController

@synthesize taxDic;
@synthesize salaryBeforeTax;

@synthesize yanglaogeren;
@synthesize yanglaogeren_rate;

@synthesize yiliaogeren;
@synthesize yiliaogeren_rate;

@synthesize shiyegeren;
@synthesize shiyegeren_rate;

@synthesize gongjijingeren;
@synthesize gongjijingeren_rate;

@synthesize yanglaogongsi;
@synthesize yanglaogongsi_rate;

@synthesize yiliaogongsi;
@synthesize yiliaogongsi_rate;

@synthesize shiyegongsi;
@synthesize shiyegongsi_rate;

@synthesize gongjijingongsi;
@synthesize gongjijingongsi_rate;

@synthesize gongshang;
@synthesize gongshang_rate;

@synthesize shengyu;
@synthesize shengyu_rate;

@synthesize perTotal;
@synthesize comTotal;

-(id) initWithTaxDic:(NSDictionary *)tax andSalary:(float) salary {
    if (self=[super init]) {
        self.taxDic = tax;
        self.salaryBeforeTax = salary;
        //NSLog(@"In init method salary is %f", salary);
    }
    return self;
} 

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    float taxTopSalary = [[self.taxDic objectForKey:@"ensuretop"] floatValue];
    float minusTaxSalary = self.salaryBeforeTax > taxTopSalary ? taxTopSalary : self.salaryBeforeTax;
    
    float yanglaogeren_f = [[self.taxDic objectForKey:@"yanglaogeren"] floatValue];
    NSString *yanglaogerenString = [[NSString alloc] initWithFormat:@"%.1f", yanglaogeren_f];
    self.yanglaogeren_rate.text = yanglaogerenString;
    [yanglaogerenString release];    
    yanglaogeren_f = minusTaxSalary * yanglaogeren_f * 0.01;
    NSString *yanglaogerenStr = [[NSString alloc] initWithFormat:@"%.1f", yanglaogeren_f];
    self.yanglaogeren.text = yanglaogerenStr;
    [yanglaogerenStr release];
    
    float yiliaogeren_f = [[self.taxDic objectForKey:@"yiliaogeren"] floatValue];
    NSString *yiliaogerenString = [[NSString alloc] initWithFormat:@"%.1f", yiliaogeren_f];
    self.yiliaogeren_rate.text = yiliaogerenString;
    [yiliaogerenString release];
    yiliaogeren_f = minusTaxSalary * yiliaogeren_f * 0.01;
    NSString *yiliaogerenStr = [[NSString alloc] initWithFormat:@"%.1f", yiliaogeren_f];
    self.yiliaogeren.text = yiliaogerenStr;
    [yiliaogerenStr release];
    
    float shiyegeren_f = [[self.taxDic objectForKey:@"shiyegeren"] floatValue];
    NSString *shiyegerenString = [[NSString alloc] initWithFormat:@"%.1f", shiyegeren_f];
    self.shiyegeren_rate.text = shiyegerenString;
    [shiyegerenString release];
    shiyegeren_f = minusTaxSalary * shiyegeren_f * 0.01;
    NSString *shiyegerenStr = [[NSString alloc] initWithFormat:@"%.1f", shiyegeren_f];
    self.shiyegeren.text = shiyegerenStr;
    [shiyegerenStr release];
    
    float gongjijingeren_f = [[self.taxDic objectForKey:@"gongjijingeren"] floatValue];
    NSLog(@"personal gongjijin rate is %f", gongjijingeren_f);
    NSString *gongjijingerenString = [[NSString alloc] initWithFormat:@"%.1f", gongjijingeren_f];
    self.gongjijingeren_rate.text = gongjijingerenString;
    [gongjijingerenString release];    
    gongjijingeren_f = minusTaxSalary * gongjijingeren_f * 0.01;
    NSLog(@"personal gongjijin value is %f", gongjijingeren_f);
    NSString *gongjijingerenStr = [[NSString alloc] initWithFormat:@"%.1f", gongjijingeren_f];
    self.gongjijingeren.text = gongjijingerenStr;
    [gongjijingerenStr release];
    
    float yanglaogongsi_f = [[self.taxDic objectForKey:@"yanglaogongsi"] floatValue];
    NSString *yanglaogongsiString = [[NSString alloc] initWithFormat:@"%.1f", yanglaogongsi_f];
    self.yanglaogongsi_rate.text = yanglaogongsiString;
    [yanglaogongsiString release];    
    yanglaogongsi_f = minusTaxSalary * yanglaogongsi_f * 0.01;
    NSString *yanglaogongsiStr = [[NSString alloc] initWithFormat:@"%.1f", yanglaogongsi_f];
    self.yanglaogongsi.text = yanglaogongsiStr;
    [yanglaogongsiStr release];
    
    float yiliaogongsi_f = [[self.taxDic objectForKey:@"yiliaogongsi"] floatValue];
    NSString *yiliaogongsiString = [[NSString alloc] initWithFormat:@"%.1f", yiliaogongsi_f];
    self.yiliaogongsi_rate.text = yiliaogongsiString;
    [yiliaogongsiString release];    
    yiliaogongsi_f = minusTaxSalary * yiliaogongsi_f * 0.01;
    NSString *yiliaogongsiStr = [[NSString alloc] initWithFormat:@"%.1f", yiliaogongsi_f];
    self.yiliaogongsi.text = yiliaogongsiStr;
    [yiliaogongsiStr release];
    
    float shiyegongsi_f = [[self.taxDic objectForKey:@"shiyegongsi"] floatValue];
    NSString *shiyegongsiString = [[NSString alloc] initWithFormat:@"%.1f", shiyegongsi_f];
    self.shiyegongsi_rate.text = shiyegongsiString;
    [shiyegongsiString release];    
    shiyegongsi_f = minusTaxSalary * shiyegongsi_f * 0.01;
    NSString *shiyegongsiStr = [[NSString alloc] initWithFormat:@"%.1f", shiyegongsi_f];
    self.shiyegongsi.text = shiyegongsiStr;
    [shiyegongsiStr release];
    
    float gongjijingongsi_f = [[self.taxDic objectForKey:@"gongjijingongsi"] floatValue];
    NSString *gongjijingongsiString = [[NSString alloc] initWithFormat:@"%.1f", gongjijingongsi_f];
    self.gongjijingongsi_rate.text = gongjijingongsiString;
    [gongjijingongsiString release];    
    gongjijingongsi_f = minusTaxSalary * gongjijingongsi_f * 0.01;
    NSString *gongjijingongsiStr = [[NSString alloc] initWithFormat:@"%.1f", gongjijingongsi_f];
    self.gongjijingongsi.text = gongjijingongsiStr;
    [gongjijingongsiStr release];
    
    float gongshang_f = [[self.taxDic objectForKey:@"gongshanggongsi"] floatValue];
    NSString *gongshangString = [[NSString alloc] initWithFormat:@"%.1f", gongshang_f];
    self.gongshang_rate.text = gongshangString;
    [gongshangString release];    
    gongshang_f = minusTaxSalary * gongshang_f * 0.01;
    NSString *gongshangStr = [[NSString alloc] initWithFormat:@"%.1f", gongshang_f];
    self.gongshang.text = gongshangStr;
    [gongshangStr release];
    
    float shengyu_f = [[self.taxDic objectForKey:@"shengyugongsi"] floatValue];
    NSString *shengyuString = [[NSString alloc] initWithFormat:@"%.1f", shengyu_f];
    self.shengyu_rate.text = shengyuString;
    [shengyuString release];    
    shengyu_f = minusTaxSalary * shengyu_f * 0.01;
    NSString *shengyuStr = [[NSString alloc] initWithFormat:@"%.1f", shengyu_f];
    self.shengyu.text = shengyuStr;
    [shengyuStr release];
    
    float perTotal_f = yanglaogeren_f + yiliaogeren_f + gongjijingeren_f + shiyegeren_f;
    float comTotal_f = yanglaogongsi_f + yiliaogongsi_f + gongjijingongsi_f + shiyegongsi_f + shengyu_f + gongshang_f;
    
    NSString *perTotalString = [[NSString alloc] initWithFormat:@"%.2f", perTotal_f];
    perTotal.text = perTotalString;
    [perTotalString release];
    
    NSString *comTotalString = [[NSString alloc] initWithFormat:@"%.2f", comTotal_f];
    comTotal.text = comTotalString;
    [comTotalString release];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.taxDic=nil;
    
    self.yanglaogeren=nil;
    self.yanglaogeren_rate=nil;
    
    self.yiliaogeren=nil;
    self.yiliaogeren_rate=nil;
    
    self.shiyegeren=nil;
    self.shiyegeren_rate=nil;
    
    self.gongjijingeren=nil;
    self.gongjijingeren_rate=nil;
    
    self.yanglaogongsi=nil;
    self.yanglaogongsi_rate=nil;
    
    self.yiliaogongsi=nil;
    self.yiliaogongsi_rate=nil;
    
    self.shiyegongsi=nil;
    self.shiyegongsi_rate=nil;
    
    self.gongjijingongsi=nil;
    self.gongjijingongsi_rate=nil;
    
    self.gongshang=nil;
    self.gongshang_rate=nil;
    
    self.shengyu=nil;
    self.shengyu_rate=nil;
    
    self.perTotal=nil;
    self.comTotal=nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}

@end
