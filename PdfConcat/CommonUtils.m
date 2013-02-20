//
//  CommonUtils.m
//  PdfConcat
//
//  Created by bubuzzz on 2/8/13.
//  Copyright (c) 2013 bubuzzz. All rights reserved.
//

#import "CommonUtils.h"

@implementation CommonUtils

- (NSArray *) getFilesFromDir:(NSString *)path {

    BOOL isDir;
    if ([[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir] && isDir) {
        NSArray * listOfFiles = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
        
        NSArray *pdfFiles = [listOfFiles filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self ENDSWITH '.pdf'"]];
        
        return pdfFiles;
    }
    else {
        return Nil;
    }
    
}

- (BOOL) concateFiles:(NSArray *) filePaths toDestination:(NSString *) destination withFileName:(NSString *) fileName {
    PDFDocument * outputDocument = [[PDFDocument alloc] init];
    PDFDocument * inputDocument;
    NSUInteger pageIndex = 0;
    
    for (id file in filePaths) {
        NSURL * pdfFile = [NSURL  fileURLWithPath:file];
        if ((inputDocument = [[PDFDocument alloc] initWithURL: pdfFile]) == NULL) {
            NSLog(@"error opening");
            return 0;
        }
        
        for (NSUInteger page = 0; page < [inputDocument pageCount]; page ++ ) {
            [outputDocument insertPage: [inputDocument pageAtIndex:page] atIndex:pageIndex++ ];
        }
    }
    
    BOOL done;

    NSString * filePath= [NSString stringWithFormat:@"%@/%@.pdf", destination, fileName];
    
    done = [outputDocument writeToFile:filePath];
    
    return done;
}



@end
