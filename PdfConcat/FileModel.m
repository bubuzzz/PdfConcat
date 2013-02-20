//
//  FileModel.m
//  PdfConcat
//
//  Created by bubuzzz on 2/8/13.
//  Copyright (c) 2013 bubuzzz. All rights reserved.
//

#import "FileModel.h"


@implementation FileModel

- (id) init {
    
    if (self = [super init]) {
      
    }
    
    return self;

}

- (id) initWithPath:(NSString *) path {
    if (self = [super init]) {
        
        
        NSArray * keys = [NSArray arrayWithObjects: @"keyName", @"keyPath", nil];
        NSArray * values = [NSArray arrayWithObjects: [path lastPathComponent], path, nil];
        
        [self setProperties: [[NSDictionary alloc] initWithObjects:values forKeys:keys]];
        
    }
    
    return self;
}

-  (void) setProperties: (NSDictionary *)newProperties{
    if (properties != newProperties) {
        
        properties = [[NSMutableDictionary alloc] initWithDictionary:newProperties];
    }
}

- (NSMutableDictionary *) getProperties {
    return properties;
}



@end
