#import <UIKit/UIKit.h>
#import "SXTCreator.h"

@interface SXTLive : NSObject

@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) SXTCreator * creator;
@property (nonatomic, assign) NSInteger group;
@property (nonatomic, copy) NSString * ID;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, assign) NSInteger link;
@property (nonatomic, assign) NSInteger multi;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger online_users;
@property (nonatomic, assign) NSInteger optimal;
@property (nonatomic, assign) NSInteger pubStat;
@property (nonatomic, assign) NSInteger roomId;
@property (nonatomic, assign) NSInteger rotate;
@property (nonatomic, strong) NSString * shareAddr;
@property (nonatomic, assign) NSInteger slot;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * stream_addr;   //url:流
@property (nonatomic, assign) NSInteger version;

@property (nonatomic, strong) NSString * distance;

@property (nonatomic, assign ,getter=isShow) BOOL show;


@end
