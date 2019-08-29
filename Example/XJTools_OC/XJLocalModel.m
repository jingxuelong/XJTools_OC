
/**
 
 Created     by JXL
 Copyright   JXL. All rights reserved.
 CreateDate: 2019/8/25
 E_Mail:     jingxuelong@gmail.com
 
 */

#import "XJLocalModel.h"

@implementation XJLocalModel
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self.name =  [aDecoder decodeObjectForKey:@"name"];
    self.time =  [aDecoder decodeObjectForKey:@"time"];
    self.date =  [aDecoder decodeObjectForKey:@"date"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.time forKey:@"time"];
    [aCoder encodeObject:self.date forKey:@"date"];


}

@end
