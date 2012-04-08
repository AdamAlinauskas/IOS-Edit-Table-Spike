//
//  SectionButton.m
//  EditTable
//
//  Created by Adam Alinauskas on 12-04-08.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SectionButton.h"

@implementation SectionButton

@synthesize section;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


+ (id)buttonWithFrame:(CGRect)frame {
    return [[self alloc] initWithFrame:frame];
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
