#import "MTSound.h"
#import "MTAdsr.h"
#import "../Conversions/MTConversions.h"

@implementation MTSound

#pragma mark - Initializers

- (instancetype)initWithFrequency:(float)freq
                        amplitude:(float)amp
                         envelope:(MTAdsr *)env {
    
    if (self = [super init]) {
        _frequency = freq;
        _amplitude = amp;
        _envelope = env;
    }
    return self;
}

- (instancetype)init {
    return [self initWithFrequency:0 amplitude:0 envelope:[[MTAdsr alloc] init]];
}


#pragma mark - Class Factory Methods

+ (instancetype) soundWithFrequency:(float)freq
                          amplitude:(float)amp
                           envelope:(MTAdsr *)env {
    
    return [[self alloc] initWithFrequency:freq
                                 amplitude:amp
                                  envelope:env];
}


#pragma mark- Accessors

- (float)MIDINote {
    return frequencyToMIDI(self.frequency);
}

- (int)MIDINoteRounded {
    return frequencyToMIDIRounded(self.frequency);
}

- (float)pianoKey {
    return frequencyToPianoKey(self.frequency);
}

- (int)pianoKeyRounded {
    return frequencyToPianoKeyRounded(self.frequency);
}


#pragma mark - Other Methods

- (NSString *)description {
    return [NSString stringWithFormat:@"<Sound with freq:%f amp:%f env:%@>",
            self.frequency, self.amplitude, self.envelope];
}


#pragma mark - NSCopying Protocol

- (id)copyWithZone:(NSZone *)zone {
    return [[self class] soundWithFrequency:self.frequency
                                  amplitude:self.amplitude
                                   envelope:[self.envelope copy]];
}


@end