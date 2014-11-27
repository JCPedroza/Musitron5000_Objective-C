#import <Foundation/Foundation.h>

// Piano key stuff uses 88 key piano
@interface MTConversions : NSObject

+ (float)frequencyToMIDI:(float)freq;
+ (int)frequencyToMIDIRounded:(float)freq;
+ (float)MIDIToFrequency:(float)midi;


+ (float)frequencyToPianoKey:(float)freq;
+ (int)frequencyToPianoKeyRounded:(float)freq;
+ (float)pianoKeyToFrequency:(float)key;

+ (float)pianoKeyToMIDI:(float)key;
+ (int)pianoKeyToMIDIRounded:(float)key;
+ (float)MIDIToPianoKey:(float)midi;
+ (int)MIDIToPianoKeyRounded:(float)midi;

@end