
#import <UIKit/UIKit.h>


#import <AVFoundation/AVFoundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreVideo/CoreVideo.h>
#import <CoreMedia/CoreMedia.h>


#ifndef MYAV_H
#define MYAV_H

@protocol MyAVDelegate;


@interface MyAVController : UIViewController <AVCaptureVideoDataOutputSampleBufferDelegate,AVCaptureVideoDataOutputSampleBufferDelegate> {

	AVCaptureSession *_captureSession;
	
	CALayer *_customLayer;
	AVCaptureVideoPreviewLayer *_prevLayer;
	
	
	id<MyAVDelegate> delegate;
	
	NSString * db_prefix;

	//UIButton *_button;
}


//@property (nonatomic, retain) UIButton* button;


@property (nonatomic, retain) NSString * db_prefix;

/*!
 @brief	The capture session takes the input from the camera and capture it
 */
@property (nonatomic, retain) AVCaptureSession *captureSession;


/*!
 @brief	The CALayer we use to display the CGImageRef generated from the imageBuffer
 */
@property (nonatomic, retain) CALayer *customLayer;
/*!
 @brief	The CALAyer customized by apple to display the video corresponding to a capture session
 */
@property (nonatomic, retain) AVCaptureVideoPreviewLayer *prevLayer;






@property (nonatomic, assign) id<MyAVDelegate> delegate;

- (id)initWithDelegate:(id<MyAVDelegate>)delegate;






/*!
 @brief	This method initializes the capture session
 */
- (void)initCapture;



- (UIColor*) getPixelColorAtLocation:(CGPoint)point;
- (CGContextRef) createARGBBitmapContextFromImage:(CGImageRef)inImage;

@end




@protocol MyAVDelegate
- (void)myavController:(MyAVController*)controller didScanResult:(NSString *)result;
@end





#endif
