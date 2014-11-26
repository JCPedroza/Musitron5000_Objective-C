#import "MTChord.h"

@implementation MTChord

#pragma mark - Initializers

- (instancetype)initWithName:(NSString *)name
                       notes:(NSArray *)notes {
    
    if (self = [super initWithNotes:notes]) {
        _name = name;
    }
    return self;
}

- (instancetype)initWithNotes:(NSArray *)notes {
    return [self initWithName:@"UNKNOWN" notes:notes];
}


#pragma mark - Class Factory Methods

+ (instancetype)chordWithName:(NSString *)name
                        notes:(NSArray *)notes {
    return [[self alloc] initWithName:name notes:notes];
}

+ (instancetype)chordWithNotes:(NSArray *)notes {
    return [[self alloc] initWithNotes:notes];
}


#pragma mark - Other Methods

- (NSString *)description {
    return [NSString stringWithFormat:@"<Chord with name:%@ notes:%@>",
            self.name, self.notes];
}


#pragma mark - Protocols

- (id)copyWithZone:(NSZone *)zone {
    return [[self class] chordWithName:self.name notes:self.notes];
}

@end