#import "MTAdsr.h"

@interface MTAdsr () 
    
- (float)sustainCheck:(float)s;

@end

@implementation MTAdsr

#pragma mark - Initializers

- (instancetype)initWithAtt:(float)a
                        dec:(float)d
                    susTime:(float)st
                     susAmp:(float)sa
                        rel:(float)r {
    
    if (self = [super init]) {
        _att = a;
        _dec = d;
        _susTime = st;
        _susAmp = [self sustainCheck:sa];
        _rel = r;
    }
    return self;
}

- (instancetype)init {
    return [self initWithAtt:0 dec:0 susTime:1 susAmp:1 rel:0];
}


#pragma mark - Class Factory Methods

+ (instancetype)adsrWithAtt:(float)a
                        dec:(float)d
                    susTime:(float)st
                     susAmp:(float)sa
                        rel:(float)r {
    
    return [[self alloc] initWithAtt:a dec:d susTime:st susAmp:sa rel:r];
    
}


#pragma mark - Private Helper Methods

// Mantains sustain amplitude value in range [0, 1].
- (float)sustainCheck:(float)s {
    if (s > 1) {
        return 1;
    } else if (s < 0) {
        return 0;
    } else {
        return s;
    }
}


#pragma mark - Accessors

- (void)setSusAmp:(float)susAmp {
    _susAmp = [self sustainCheck:susAmp];
}


#pragma mark - Other Methods

- (NSString *)description {
    return [NSString stringWithFormat:@"<Adsr with a:%f d:%f st:%f sa:%f r:%f>",
            self.att, self.dec, self.susTime, self.susAmp, self.rel];
}

#pragma mark - NSCopying Protocol

- (id)copyWithZone:(NSZone *)zone {
    return [[self class] adsrWithAtt:0 dec:0 susTime:1 susAmp:1 rel:0];
}

@end