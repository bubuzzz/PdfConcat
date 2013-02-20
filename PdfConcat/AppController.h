//
//  AppController.h
//  PdfConcat
//
//  Created by bubuzzz on 2/8/13.
//  Copyright (c) 2013 bubuzzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonUtils.h"
#import "FileModel.h"

@interface AppController : NSObject {
    CommonUtils * utils;

}

- (void) fillTables:(NSArrayController *) table withFilesInPath:(NSString *) path;
- (BOOL) concateFiles:(NSArray *) filePaths toDestination:(NSString *) destination withFileName:(NSString *) fileName;

@end
