//
//  Document.h
//  PdfConcat
//
//  Created by bubuzzz on 2/8/13.
//  Copyright (c) 2013 bubuzzz. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppController.h"
#import "FileModel.h"

@interface Document : NSPersistentDocument {
    AppController * controller;
}

@property (nonatomic, strong) IBOutlet NSTextField * txtFolderPath;
@property (nonatomic, strong) IBOutlet NSTextField * txtDesPath;
@property (nonatomic, strong) IBOutlet NSTextField * txtFinalFile;
@property (nonatomic, strong) IBOutlet NSButton * btnButton;
@property (nonatomic, strong) IBOutlet NSButton * btnDes;
@property (nonatomic, strong) IBOutlet NSButton * btnClear;
@property (strong) IBOutlet NSArrayController *fileArray;
@property (nonatomic, strong) IBOutlet NSTableView *tableView;

- (IBAction) getFolderPath:(id)sender;
- (IBAction) exportToPdfFile:(id)sender;
- (IBAction) clearFiles:(id)sender;
@end
