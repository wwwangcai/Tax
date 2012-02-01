//
//  DropDownList.m
//  Tax
//
//  Created by 刘 琳琳 on 12-1-31.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "DropDownList.h"

@implementation DropDownList

@synthesize textField;
@synthesize lineColor;
@synthesize listBgColor;
@synthesize borderStyle;
@synthesize tableList;
@synthesize showList;
@synthesize oldFrame;
@synthesize newFrame;
@synthesize lineWidth;
@synthesize tempArray;
@synthesize delegate;   

//- (id)initWithFrame:(CGRect)frame 
- (id)initWithFrame:(CGRect)frame andCityArray:(NSArray *) cityArray
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.tempArray = cityArray;
        self.newFrame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height * [self.tempArray count]);
        
        self.lineColor = [UIColor lightGrayColor];
        self.listBgColor = [UIColor whiteColor];
        self.lineWidth = 1;
        
        self.borderStyle = UITextBorderStyleRoundedRect;
        self.oldFrame = frame;
        self.backgroundColor = [UIColor blackColor];
        
        [self drawView];
        self.showList = NO;
    }
    return self;
}

-(void) drawView {
    textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, oldFrame.size.width, oldFrame.size.height)];
    textField.borderStyle = borderStyle;
    [self addSubview:textField];
    

    [textField addTarget:self action:@selector(dropdown) forControlEvents:UIControlEventAllTouchEvents];
    
    tableList = [[UITableView alloc] initWithFrame:CGRectMake(0, oldFrame.size.height+lineWidth, oldFrame.size.width - lineWidth * 2, oldFrame.size.height*[self.tempArray count]-lineWidth*2)];
    tableList.delegate = self;
    tableList.dataSource = self;
    tableList.backgroundColor = listBgColor;
    tableList.separatorColor = lineColor;
    tableList.hidden = !showList;
    [self addSubview:tableList];
    [tableList release];
    //self.clipsToBounds=YES;
}

-(void) dropdown {
    [textField resignFirstResponder];
    if (showList) {
        return;
    }
    [self.superview bringSubviewToFront:self];
    [self setShowList:YES];
    
}

#pragma table view datasource and delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tempArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellid = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid] autorelease];
    }
    
    //cell.textLabel.text = [self.tempArray objectAtIndex:[indexPath row]];
    cell.textLabel.text = [[self.tempArray objectAtIndex:[indexPath row]] objectForKey: @"value"];
    cell.textLabel.font = textField.font;
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return oldFrame.size.height;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    textField.text = [[self.tempArray objectAtIndex:[indexPath row]] objectForKey: @"value"];
    [self setShowList:NO];
    if (delegate != nil) {
        [delegate performSelector:@selector(selectedCity:) withObject:[[self.tempArray objectAtIndex:[indexPath row]] objectForKey: @"tag"]];
    }
}

-(BOOL) showList {
    return showList;
}

-(void) setShowList:(BOOL)b {
    showList = b;
    if (showList) {
        self.frame = newFrame;
    } else {
        self.frame = oldFrame;
    }
    tableList.hidden = !b;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
