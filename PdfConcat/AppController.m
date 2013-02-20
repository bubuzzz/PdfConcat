//
//  AppController.m
//  PdfConcat
//
//  Created by bubuzzz on 2/8/13.
//  Copyright (c) 2013 bubuzzz. All rights reserved.
//

#import "AppController.h"

@implementation AppController

- (id) init {
    if (self = [super init]) {
        utils = [[CommonUtils alloc] init];
    }
    
    return self;
}

- (void) fillTables:(NSArrayController *) table withFilesInPath:(NSString *) path {
    
    NSArray * pdfFiles = [utils getFilesFromDir:path];
    
    for (id pathStr in pdfFiles) {
        FileModel * file = [[FileModel alloc] initWithPath: [NSString stringWithFormat:@"%@/%@", path, pathStr] ];
        [table addObject:[file getProperties]];
    }
    
    
}

- (BOOL) concateFiles:(NSArray *) filePaths toDestination:(NSString *) destination withFileName:(NSString *) fileName {
   return [utils concateFiles:filePaths toDestination: destination withFileName: fileName];
}

@end
