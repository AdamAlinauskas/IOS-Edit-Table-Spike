//
//  SectionButton.h
//  EditTable
//
//  Created by Adam Alinauskas on 12-04-08.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Section.h"

@interface SectionButton : UIButton

@property (nonatomic,strong) Section* section;
+ (id)buttonWithFrame:(CGRect)frame;

@end
