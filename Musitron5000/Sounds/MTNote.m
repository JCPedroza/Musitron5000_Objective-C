#import "MTNote.h"
#import "MTAdsr.h"

@implementation MTNote

#pragma mark - Initializers

- (instancetype)initWithName:(NSString *)name
                   frequency:(float)freq
                   amplitude:(float)amp
                    envelope:(MTAdsr *)env {
    
    if (self = [super initWithFrequency:freq
                              amplitude:amp
                               envelope:env]) {
        _name = name;
    }
    return self;
}

- (instancetype)initWithFrequency:(float)freq
                        amplitude:(float)amp
                         envelope:(MTAdsr *)env {
    
    return [self initWithName:@"UNKNOWN"
                    frequency:freq
                    amplitude:amp
                     envelope:env];
    
}


#pragma mark - Class Factory Methods

+ (instancetype)noteWithName:(NSString *)name
                   frequency:(float)freq
                   amplitude:(float)amp
                    envelope:(MTAdsr *)env {
    
    return [[self alloc] initWithName:name
                            frequency:freq
                            amplitude:amp
                             envelope:env];
}

+ (instancetype)noteWithFrequency:(float)freq
                        amplitude:(float)amp
                         envelope:(MTAdsr *)env {
    
    return [[self alloc] initWithFrequency:freq
                                 amplitude:amp
                                  envelope:env];
}


#pragma mark - Other Methods

- (NSString *)description {
    return [NSString stringWithFormat:@"<Note with name:%@ freq:%f amp:%f envelope:%@>",
            self.name, self.frequency, self.amplitude, self.envelope];
}


#pragma mark - NSCopying Protocol

- (id)copyWithZone:(NSZone *)zone {
    id copy = [super copyWithZone:zone];
    [copy setName:self.name];
    return copy;
}

@end