#include <math.h>
#include "MTConversions.h"

float frequencyToMIDI(float freq) {
    return 12 * log2(freq/440) + 69;
}

int frequencyToMIDIRounded(float freq) {
    float num = frequencyToMIDI(freq);
    return (num - floor(num) > 0.5) ? ceil(num) : floor(num);
}