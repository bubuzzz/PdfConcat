//
//  CommonUtils.h
//  PdfConcat
//
//  Created by bubuzzz on 2/8/13.
//  Copyright (c) 2013 bubuzzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Quartz/Quartz.h>

@interface CommonUtils : NSObject
- (NSArray *) getFilesFromDir:(NSString *)path;
- (BOOL) concateFiles:(NSArray *) filePaths toDestination:(NSString *) destination withFileName:(NSString *) fileName;

@end
