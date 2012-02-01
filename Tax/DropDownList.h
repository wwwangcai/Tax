//
//  DropDownList.h
//  Tax
//
//  Created by 刘 琳琳 on 12-1-31.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DropDownListDelegate <NSObject>

@required
-(void)selectedCity:(NSString *) city;

@end


@interface DropDownList : UIView <UITableViewDataSource, UITableViewDelegate> {
    UITextField *textField;
    UITableView *tableList;
    BOOL showList;
    CGRect oldFrame, newFrame;
    UIColor *lineColor, *listBgColor;
    CGFloat lineWidth;
    UITextBorderStyle borderStyle;
    id<DropDownListDelegate> delegate;
    
    NSArray *tempArray;
}

@property(nonatomic, retain) UITextField *textField;
@property(nonatomic, retain) UITableView *tableList;
@property(nonatomic, retain) UIColor *lineColor, *listBgColor;
@property(nonatomic, assign) UITextBorderStyle borderStyle;
@property(nonatomic, assign) BOOL showList;
@property(nonatomic, assign) CGRect oldFrame, newFrame;
@property(nonatomic, assign) CGFloat lineWidth;
@property(nonatomic, retain) NSArray *tempArray;
@property(nonatomic, assign) id<DropDownListDelegate> delegate;

-(void) drawView;
-(id) initWithFrame:(CGRect)frame andCityArray:(NSArray *) cityArray;
@end
