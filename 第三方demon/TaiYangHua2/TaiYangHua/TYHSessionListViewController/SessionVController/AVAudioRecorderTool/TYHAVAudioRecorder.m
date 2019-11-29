//
//  TYHAVAudioRecorder.m
//  TaiYangHua
//
//  Created by Vieene on 16/3/17.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "TYHAVAudioRecorder.h"
#import "lame.h"

@interface TYHAVAudioRecorder()
//记录录音文件的名字

@property (nonatomic,strong) AVAudioRecorder *recorder;
@property (nonatomic,strong) AVURLAsset *asset;
@end
@implementation TYHAVAudioRecorder
- (void)beginRecord

{
    //录音设置
    NSMutableDictionary *settings = [[NSMutableDictionary alloc] init];
    //设置录音格式  AVFormatIDKey==kAudioFormatLinearPCM
    [settings setValue:[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
    //设置录音采样率(Hz) 如：AVSampleRateKey==8000/44100/96000（影响音频的质量）, 采样率必须要设为11025才能使转化成mp3格式后不会失真
    [settings setValue:[NSNumber numberWithFloat:11025.0] forKey:AVSampleRateKey];
    //录音通道数  1 或 2 ，要转换成mp3格式必须为双通道
    [settings setValue:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
    //线性采样位数  8、16、24、32
    [settings setValue:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
    //录音的质量
    [settings setValue:[NSNumber numberWithInt:AVAudioQualityMax] forKey:AVEncoderAudioQualityKey];
    
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayAndRecord error: nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];//根据实际情况播放完成可以将会话关闭，其他音频应用继续播放
    
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"yyyyMMddHHmmss"];
    NSString *fileName = [NSString stringWithFormat:@"Identifiy_%@.caf",[dateFormater stringFromDate:now]];
    _fileName=fileName;
    NSString *filePath=[NSString cachePathWith:fileName];
    
    
    NSURL *fileUrl=[NSURL fileURLWithPath:filePath];
    NSError *error;
    _recorder   =[[AVAudioRecorder alloc]initWithURL:fileUrl settings:settings error:&error];
    [_recorder prepareToRecord];
    [_recorder setMeteringEnabled:YES];
    [_recorder peakPowerForChannel:0];
    [_recorder record];
    

}
- (float)updateMeters
{
    [_recorder updateMeters];
    return [_recorder averagePowerForChannel:0];
}

- (void)stop
{
    [self.recorder stop];
}
- (void)completeRecore
{

    [self transformCAFToMP3];
    [[AVAudioSession sharedInstance] setActive:NO error:nil];
}

- (void)transformCAFToMP3 {
    NSArray *arrStr = [_fileName componentsSeparatedByString:@"."];
    NSString * mp3fileName = [[arrStr firstObject] stringByAppendingString:@".mp3"];
    NSString *mp3filePathStr=[NSString cachePathWith:mp3fileName];
    
    NSURL* mp3FilePath = [NSURL URLWithString:mp3filePathStr];
    NSURL* recordUrl;
    NSString *filePath=[NSString cachePathWith:_fileName];
    recordUrl=[NSURL URLWithString:filePath];
    @try {
        int read, write;
        FILE *pcm = fopen([[recordUrl absoluteString] cStringUsingEncoding:1], "rb");   //source 被转换的音频文件位置
        fseek(pcm, 4*1024, SEEK_CUR);                                                   //skip file header
        FILE *mp3 = fopen([[mp3FilePath absoluteString] cStringUsingEncoding:1], "wb"); //output 输出生成的Mp3文件位置
        const int PCM_SIZE = 8192;
        const int MP3_SIZE = 8192;
        short int pcm_buffer[PCM_SIZE*2];
        unsigned char mp3_buffer[MP3_SIZE];
        
        lame_t lame = lame_init();
        lame_set_in_samplerate(lame, 11025.0);
        lame_set_VBR(lame, vbr_default);
        lame_init_params(lame);
        
        do {
            read = fread(pcm_buffer, 2*sizeof(short int), PCM_SIZE, pcm);
            if (read == 0)
                write = lame_encode_flush(lame, mp3_buffer, MP3_SIZE);
            else
                write = lame_encode_buffer_interleaved(lame, pcm_buffer, read, mp3_buffer, MP3_SIZE);
            
            fwrite(mp3_buffer, write, 1, mp3);
            
        } while (read != 0);
        lame_close(lame);
        fclose(mp3);
        fclose(pcm);
    }
    @catch (NSException *exception) {
        NSLog(@"%@",[exception description]);
    }
    @finally {
        NSURL* audioFileSavePath;
        
        audioFileSavePath = mp3FilePath;
        _fileName = mp3fileName;
    }
}

@end
