#import <Foundation/Foundation.h>
@class MTAdsr;

@interface MTSound : NSObject <NSCopying>

@property (nonatomic) float frequency;
@property (nonatomic) float amplitude;
@property (nonatomic) MTAdsr *envelope;

// Designated Initializer
- (instancetype)initWithFrequency:(float)freq
                        amplitude:(float)amp
                         envelope:(MTAdsr *)env;

+ (instancetype)soundWithFrequency:(float)freq
                         amplitude:(float)amp
                          envelope:(MTAdsr *)env;

@end