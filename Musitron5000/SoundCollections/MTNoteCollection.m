#import "MTNoteCollection.h"
#import "MTNote.h"

@interface MTNoteCollection () {
    NSMutableArray *_notes;
}
@end

@implementation MTNoteCollection


#pragma mark - Initializers

- (instancetype)initWithNotes:(NSArray *)notes {
    if (self = [super init]) {
        _notes = [notes mutableCopy];
    }
    return self;
}

- (instancetype)init {
    return [self initWithNotes:@[]];
}


#pragma mark - Class Factory Methods

+ (instancetype)noteCollectionWithNotes:(NSArray *)notes {
    return [[self alloc] initWithNotes:notes];
}


#pragma mark - Accessors

- (void)setNotes:(NSArray *)notes {
    _notes = [notes mutableCopy];
}

- (void)addNote:(MTNote *)note {
    [_notes addObject:note];
}

- (void)removeNote:(MTNote *)note {
    [_notes removeObject:note];
}

- (void)removeNoteAtIndex:(unsigned int)index {
    [_notes removeObjectAtIndex:index];
}

- (void)removeNotesAtIndexes:(NSIndexSet *)indexes {
    [_notes removeObjectsAtIndexes:indexes];
}

// Based on Java's Collections.rotate()
- (void)rotate:(int)distance {
    
    unsigned long size = self.size;
    if (size == 0) {
        return;
    }
    
    distance %= size;
    if (distance == 0) {
        return;
    }
    if (distance < 0) {
        distance += size;
    }
    
    // Determine the least common multiple of distance and size, as there
    // are (distance / LCM) loops to cycle through.
    unsigned long a = size;
    int lcm = distance;
    int b = a % lcm;
    while (b != 0) {
        a = lcm;
        lcm = b;
        b = a % lcm;
    }
    
    // Now, make the swaps. We must take the remainder every time through
    // the inner loop so that we don't overflow i to negative values.
    while (--lcm >= 0) {
        MTNote *buffer;
        MTNote *note = _notes[lcm];
        for (int i = lcm + distance; i != lcm; i = (i + distance) % size) {
            buffer = _notes[i];
            _notes[i] = note;
            note = buffer;
        }
        _notes[lcm] = note;
    }
    
}

- (void)invert {
    [self rotate:-1];
}

- (void)invertBack {
    [self rotate:1];
}

- (void)inversion:(int)number {
    [self rotate:-number];
}

- (unsigned long)size {
    return [_notes count];
}


#pragma mark - Other Methods

- (NSString *)description {
    return [NSString stringWithFormat:@"<NoteCollection with notes:%@>", self.notes];
}


#pragma mark - Protocols

- (id)copyWithZone:(NSZone *)zone {
    return [[self class] noteCollectionWithNotes:self.notes];
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(__unsafe_unretained id [])buffer
                                    count:(NSUInteger)len {
    return [self.notes countByEnumeratingWithState:state objects:buffer count:len];
}

@end