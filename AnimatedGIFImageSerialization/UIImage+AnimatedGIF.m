//
//  UIImage+AnimatedGIF.m
//  
//
//  Created by ParkMyunkyu on 2015. 7. 21..
//
//

#import "UIImage+AnimatedGIF.h"
#import "AnimatedGIFImageSerialization.h"

@implementation UIImage (AnimatedGIF)
+(UIImage *)gifImageNamed:(NSString *)name
{
    return [UIImage gifImageNamed:name duration:0.0f];
}

+(UIImage *)gifImageNamed:(NSString *)name duration:(NSTimeInterval)duration
{
    NSString *type = [name pathExtension];
    if ([type isEqualToString:@""]) {
        type = @"gif";
    }
    NSString *path = [[NSBundle mainBundle] pathForResource:[name stringByDeletingPathExtension] ofType:type];
    
    float scale = 1.0f;
    if (!path) {
        path = [[NSBundle mainBundle] pathForResource:[[name stringByDeletingPathExtension] stringByAppendingString:@"@2x"] ofType:type];
        scale = 2.0f;
    }
    
    NSAssert(path != nil, @"Couldn't find an image. Please check image's name is correct.");
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSAssert(AnimatedGifDataIsValid(data), @"Image isn't gif file. Please check type of the image.");
    return UIImageWithAnimatedGIFData(data, scale, duration, nil);
}
@end
