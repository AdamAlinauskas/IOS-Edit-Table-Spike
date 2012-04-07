//
//  Section.h
//  EditTable
//
//  Created by Adam Alinauskas on 12-04-07.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Section : NSObject

@property (nonatomic) NSString* title;
@property (nonatomic,strong) NSMutableArray* questions;

@end
