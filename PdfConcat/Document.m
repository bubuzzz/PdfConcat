//
//  Document.m
//  PdfConcat
//
//  Created by bubuzzz on 2/8/13.
//  Copyright (c) 2013 bubuzzz. All rights reserved.
//

#import "Document.h"

@implementation Document

@synthesize btnButton;
@synthesize btnClear;
@synthesize btnDes;
@synthesize txtFolderPath;
@synthesize txtDesPath;
@synthesize tableView;
@synthesize txtFinalFile;

@synthesize fileArray;

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        controller  = [[AppController alloc] init];
        
    }
    return self;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
   }

+ (BOOL)autosavesInPlace
{
    return YES;
}

// Implementation

- (IBAction) getFolderPath:(id)sender{
    
    NSWindow* window = [[[self windowControllers] objectAtIndex:0] window];
    
    NSOpenPanel * openPanel = [[NSOpenPanel alloc] init];
    [openPanel setAllowsMultipleSelection:FALSE];
    [openPanel setCanChooseDirectories:TRUE];
    [openPanel setCanChooseFiles:FALSE];
    
    
    [openPanel setMessage:@"Select a directory"];
    
    
    // Display the panel attached to the document's window.
    [openPanel beginSheetModalForWindow:window completionHandler:^(NSInteger result){
        
        if (result == NSFileHandlingPanelOKButton) {
            
            NSURL * url= [openPanel URL];
            
            if (sender == btnButton) {
                [txtFolderPath setStringValue:[url path]];
                [controller fillTables:fileArray withFilesInPath:[url path]];

            } else if (sender == btnDes) {
                [txtDesPath setStringValue:[url path]];
            }
        }
        
    }];
}

- (IBAction) exportToPdfFile:(id)sender {
    NSArray *paths = [[fileArray arrangedObjects] valueForKey:@"keyPath"];
    NSString * destination = [txtDesPath stringValue];
    NSString * fileName = [txtFinalFile stringValue];
    
    BOOL done = [controller concateFiles:paths toDestination:destination withFileName:fileName];
    
    if (done == YES) {
        NSLog(@"Yes, baby");
    }
    else {
        NSLog(@"You are fucked ");
    }

}

- (IBAction) clearFiles:(id)sender {

    [[fileArray content] removeAllObjects];
    [tableView reloadData];

    [txtFolderPath setStringValue:@""];
    [txtDesPath setStringValue:@""];

}


@end
