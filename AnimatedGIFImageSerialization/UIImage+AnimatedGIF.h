//
//  UIImage+AnimatedGIF.h
//  
//
//  Created by ParkMyunkyu on 2015. 7. 21..
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIImage (AnimatedGIF)
+(UIImage *)gifImageNamed:(NSString *)name;
+(UIImage *)gifImageNamed:(NSString *)name duration:(NSTimeInterval)duration;
@end
