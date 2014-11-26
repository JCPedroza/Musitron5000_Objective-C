#import "MTNoteCollection.h"

@interface MTChord : MTNoteCollection <NSCopying>

@property (nonatomic, copy) NSString *name;

// Designated Initializer
- (instancetype)initWithName:(NSString *)name
                       notes:(NSArray *)notes;

+ (instancetype)chordWithName:(NSString *)name
                        notes:(NSArray *)notes;

+ (instancetype)chordWithNotes:(NSArray *)notes;

@end