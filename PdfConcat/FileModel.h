//
//  FileModel.h
//  PdfConcat
//
//  Created by bubuzzz on 2/8/13.
//  Copyright (c) 2013 bubuzzz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileModel : NSObject {
    NSMutableDictionary * properties;
}

- (id) initWithPath:(NSString *) path;
- (void) setProperties: (NSDictionary *)newProperties;
- (NSMutableDictionary *) getProperties;

@end
