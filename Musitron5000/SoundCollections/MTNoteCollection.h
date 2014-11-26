#import <Foundation/Foundation.h>
@class MTNote;

@interface MTNoteCollection : NSObject <NSCopying, NSFastEnumeration>

@property (nonatomic, copy) NSArray *notes;

// Designated Initializer
- (instancetype)initWithNotes:(NSArray *)notes;

+ (instancetype)noteCollectionWithNotes:(NSArray *)notes;

- (void)addNote:(MTNote *)note;
- (void)removeNote:(MTNote *)note;
- (void)removeNoteAtIndex:(unsigned int)index;
- (void)removeNotesAtIndexes:(NSIndexSet *)indexes;
- (void)rotate:(int)distance;
- (void)invert;
- (void)invertBack;
- (void)inversion:(int)number;

- (unsigned long)size;

@end