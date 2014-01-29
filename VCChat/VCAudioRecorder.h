//
//  VCAudioRecorder.h
//  VCChat
//
//  Created by ravenchen on 1/27/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface VCAudioRecorder : NSObject
{
AVAudioPlayer *audioPlayer;
AVAudioRecorder *audioRecorder;
int recordEncoding;
enum
{
    ENC_AAC = 1,
    ENC_ALAC = 2,
    ENC_IMA4 = 3,
    ENC_ILBC = 4,
    ENC_ULAW = 5,
    ENC_PCM = 6,
} encodingTypes;

float Pitch;
NSTimer *timerForPitch;
}
-(void) startRecording;
-(NSData *) stopRecording;
-(void) playRecording;
-(void) playRecording:(NSData * )data;
-(void) stopPlaying;
@end
