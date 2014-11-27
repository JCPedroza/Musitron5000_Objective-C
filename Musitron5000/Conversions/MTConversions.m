#import <math.h>
#import "MTConversions.h"

@implementation MTConversions

+ (float)frequencyToMIDI:(float)freq {
    return 12 * log2f(freq/440) + 69;
}

+ (int)frequencyToMIDIRounded:(float)freq {
    return roundf([self frequencyToMIDI:freq]);
}

+ (float)MIDIToFrequency:(float)midi {
    return exp2f((midi-69)/12) * 440;
}

+ (float)frequencyToPianoKey:(float)freq {
    return 12 * log2f(freq/440) + 49;
}

+ (int)frequencyToPianoKeyRounded:(float)freq {
    return roundf([self frequencyToPianoKey:freq]);
}

+ (float)pianoKeyToFrequency:(float)key {
    return exp2f((key-49)/12) * 440;
}

+ (float)pianoKeyToMIDI:(float)key {
    return key + 20;
}

+ (int)pianoKeyToMIDIRounded:(float)key {
    return roundf([self pianoKeyToMIDI:key]);
}

+ (float)MIDIToPianoKey:(float)midi {
    return midi - 20;
}

+ (int)MIDIToPianoKeyRounded:(float)midi {
    return roundf([self MIDIToPianoKey:midi]);
}

@end