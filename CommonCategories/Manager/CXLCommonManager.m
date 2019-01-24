//
//  CXLCommonManager.m
//  CommonCategories
//
//  Created by 曹学亮 on 2019/1/23.
//  Copyright © 2019 caoxueliang.cn. All rights reserved.
//

#import "CXLCommonManager.h"

@implementation CXLCommonManager

+ (UIImage *)createAzteCodeWithString:(NSString *)string size:(CGSize)imageSize{
    return [CXLCommonManager generateCodeWithFilterName:@"CIQRCodeGenerator" string:string size:imageSize];
}


+ (UIImage *)createBarCodeWithString:(NSString *)string size:(CGSize)imageSize{
    return [CXLCommonManager generateCodeWithFilterName:@"CICode128BarcodeGenerator" string:string size:imageSize];
}


+ (UIImage *)generateCodeWithFilterName:(NSString *)filtername string:(NSString *)str size:(CGSize)imageSize{
    
    CIFilter *filter = [CIFilter filterWithName:filtername];
    [filter setDefaults];
    
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];
    
    CIImage *outputImage = [filter outputImage];
    return [CXLCommonManager createNonInterpolatedUIImageFormCIImage:outputImage withSize:imageSize];
}


+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGSize) size {
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size.width/CGRectGetWidth(extent), size.height/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}


@end
