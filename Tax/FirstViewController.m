//
//  FirstViewController.m
//  Tax
//
//  Created by 刘 琳琳 on 12-1-28.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"

@implementation FirstViewController
@synthesize salaryAfterTax;
@synthesize taxBase;
@synthesize tax;
@synthesize enSure;
@synthesize salaryBeforeTax;
@synthesize cityTaxDic;
@synthesize taxRateDic;
@synthesize salary;
@synthesize selectCity;
/*
-(void) loadView {
    
}
 */

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CityTax" ofType:@"plist"];
    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.cityTaxDic = dic;
    [dic release];
    
    NSMutableArray *listForDropDownList = [[NSMutableArray alloc] init];
    for (NSString *city in [self.cityTaxDic allKeys]) {
        //NSLog(@"key is %@", city);
        NSDictionary *tempDict = [NSDictionary dictionaryWithObjectsAndKeys:city,@"tag",[[self.cityTaxDic objectForKey:city] objectForKey:@"name"],@"value", nil];
        [listForDropDownList addObject:tempDict];
    }
    
    NSString *dpath = [[NSBundle mainBundle] pathForResource:@"TaxRate" ofType:@"plist"];
    NSDictionary *ddic = [[NSDictionary alloc] initWithContentsOfFile:dpath];
    self.taxRateDic = ddic;
    [ddic release];

    DropDownList *listt = [[DropDownList alloc] initWithFrame:CGRectMake(120, 5, 111, 31) andCityArray:listForDropDownList];
    listt.delegate = self;
    [listForDropDownList release];
    listt.borderStyle = UITextBorderStyleRoundedRect;
    NSLog(@"temp array is %@", listt.tempArray);
    
    [self.view addSubview:listt];
    [listt release];
    
    
}

-(IBAction)cityFieldEditDone:(id)sender {
    [sender resignFirstResponder];
}

-(IBAction)backgrundTap:(id)sender {
    [salaryBeforeTax resignFirstResponder];
    [taxBase resignFirstResponder];
}

-(BOOL) inputValidate {
    if ([salaryBeforeTax.text floatValue]== 0 || self.selectCity == nil) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"请输入税前工资" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return NO;
    }
    return YES;
}

-(IBAction) calculate {
    if (![self inputValidate]) {
        return;
    }
    float salaryBaseTax_f = 3500.0;
    float taxTop = [[[self.cityTaxDic objectForKey:self.selectCity] objectForKey:@"ensuretop"] floatValue];
    
    //NSLog(@"before retain count is %i", [salaryBeforeTax.text retainCount]);
    //NSString *salaryString = salaryBeforeTax.text;
    //NSLog(@"after retain count is %i", [salaryBeforeTax.text retainCount]);    
    float salaryBeforeTax_f = [self.salaryBeforeTax.text floatValue];
    //[salaryString release];
    //NSLog(@"finally retain count is %i", [salaryBeforeTax.text retainCount]);
    self.salary = salaryBeforeTax_f;
    
    if ([self.taxBase.text floatValue] != 0) {
        salaryBaseTax_f = [self.taxBase.text floatValue];
    }
    
    float minusTaxSalary = salaryBeforeTax_f > taxTop ? taxTop : salaryBeforeTax_f;
    
    float yanglaogeren = [[[self.cityTaxDic objectForKey:self.selectCity] objectForKey:@"yanglaogeren"] floatValue] * minusTaxSalary * 0.01;
    
    float shiyegeren = [[[self.cityTaxDic objectForKey:self.selectCity] objectForKey:@"shiyegeren"] floatValue] * minusTaxSalary * 0.01;
    
    float yiliaogeren = [[[self.cityTaxDic objectForKey:self.selectCity] objectForKey:@"yiliaogeren"] floatValue] * minusTaxSalary * 0.01;
    
    float gongjijingeren = [[[self.cityTaxDic objectForKey:self.selectCity] objectForKey:@"gongjijingeren"] floatValue] * minusTaxSalary * 0.01;
    
    float ensureTotal = yanglaogeren + yiliaogeren + shiyegeren + gongjijingeren;
    
    float salaryAfterTax_f = salaryBeforeTax_f - ensureTotal - salaryBaseTax_f;
    //NSLog(@"Tax calculate base on %.2f", salaryAfterTax_f);
    
    float tax_f = [self calculateTax:salaryAfterTax_f];
    
    NSString *salaryAfterTaxString = [NSString stringWithFormat:@"%.2f", salaryBeforeTax_f - ensureTotal - tax_f];
    NSString *ensureTotalString = [NSString stringWithFormat:@"%.2f", ensureTotal];
    NSString *taxString = [[NSString alloc] initWithFormat:@"%.2f", tax_f];
    
    
    self.enSure.text = ensureTotalString;
    //[ensureTotalString release];
    self.salaryAfterTax.text = salaryAfterTaxString;
    //[salaryAfterTaxString release];
    self.tax.text = taxString;
    //[taxString release];
    
    //[singleCityTax release];
    
}

-(float) calculateTax:(float)salary_f {
    NSMutableArray *array = [[[NSMutableArray alloc] init] autorelease];
    [array addObject:[NSNumber numberWithInt:0]];
    for (NSString *rateString in [self.taxRateDic allKeys]) {
        float rate = [rateString floatValue];
        //NSLog(@"rate is %f", rate);
        //NSLog(@"del value is %f", [[self.taxRateDic objectForKey:rateString] floatValue]);
        float value = salary_f * rate - [[self.taxRateDic objectForKey:rateString] floatValue];
        [array addObject:[NSNumber numberWithFloat:value]];
    }
    [array sortUsingSelector:@selector(compare:)];
    /*
    for (int i = 0; i < [array count]; i++) {
        NSLog(@"%@", [array objectAtIndex:i]);
    }
     */
    return [[array objectAtIndex:[array count] - 1] floatValue];
}

-(IBAction) clearInput {
    self.salaryAfterTax.text = nil;
    self.salaryBeforeTax.text = nil;
    self.enSure.text = nil;
    self.tax.text = nil;
    self.salary = 0;
    
}

-(IBAction) reverseCalculate {

}

-(IBAction) detailEnsure {
    SecondViewController *detailController = [[SecondViewController alloc] initWithTaxDic:[self.cityTaxDic objectForKey:self.selectCity] andSalary:salary];
    detailController.title = @"社保与公积金缴费明细";
    [self.navigationController pushViewController:detailController animated:YES];
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

#pragma DropDownListDelegate

-(void) selectedCity:(NSString *)city {
    self.selectCity = city;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.salaryAfterTax = nil;
    self.salaryBeforeTax = nil;
    self.tax = nil;
    self.enSure = nil;
    self.taxBase = nil;
    self.taxRateDic = nil;
    self.cityTaxDic = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void) dealloc {
    
    [salaryBeforeTax release];
    [salaryAfterTax release];
    [taxBase release];
    [tax release];
    [enSure release];
    [taxRateDic release];
    [cityTaxDic release];
    [super dealloc];
}

@end
