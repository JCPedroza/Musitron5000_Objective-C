#import <Foundation/Foundation.h>

@interface MTAdsr : NSObject <NSCopying>

// Times are in milliseconds. Sustain range is [0, 1].
@property (nonatomic) float att;
@property (nonatomic) float dec;
@property (nonatomic) float susTime;
@property (nonatomic) float susAmp;
@property (nonatomic) float rel;

// Designated Initializer
- (instancetype)initWithAtt:(float)a
                        dec:(float)d
                    susTime:(float)st
                     susAmp:(float)sa
                        rel:(float)r;

+ (instancetype)adsrWithAtt:(float)a
                        dec:(float)d
                    susTime:(float)st
                     susAmp:(float)sa
                        rel:(float)r;

@end