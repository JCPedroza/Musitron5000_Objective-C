#import "MTSound.h"
@class MTAdsr;

@interface MTNote : MTSound

@property (nonatomic, copy) NSString *name;


// Designated Initializer
- (instancetype)initWithName:(NSString *)name
                   frequency:(float)freq
                   amplitude:(float)amp
                    envelope:(MTAdsr *)env;

+ (instancetype)noteWithName:(NSString *)name
                   frequency:(float)freq
                   amplitude:(float)amp
                    envelope:(MTAdsr *)env;

+ (instancetype)noteWithFrequency:(float)freq
                        amplitude:(float)amp
                         envelope:(MTAdsr *)env;

@end