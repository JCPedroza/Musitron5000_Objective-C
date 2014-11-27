#import <math.h>
#import "MTConversions.h"

@implementation MTConversions

static NSDictionary *noteFreqs = nil;

+ (void)initialize {
    [super initialize];
    noteFreqs = @{@"C"  : [NSNumber numberWithFloat:16.351598],
                  @"Db" : [NSNumber numberWithFloat:0],
                  @"D"  : [NSNumber numberWithFloat:0],
                  @"Eb" : [NSNumber numberWithFloat:0],
                  @"E"  : [NSNumber numberWithFloat:0],
                  @"F"  : [NSNumber numberWithFloat:0],
                  @"Gb" : [NSNumber numberWithFloat:0],
                  @"G"  : [NSNumber numberWithFloat:0],
                  @"Ab" : [NSNumber numberWithFloat:0],
                  @"A"  : [NSNumber numberWithFloat:27.5],
                  @"Bb" : [NSNumber numberWithFloat:29.135235],
                  @"B"  : [NSNumber numberWithFloat:30.867706]};
}

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