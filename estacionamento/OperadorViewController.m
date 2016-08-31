//
//  OperadorViewController.m
//  estacionamento
//
//  Created by rony tjioe chung on 14/07/16.
//  Copyright © 2016 pato. All rights reserved.
//

#import "OperadorViewController.h"
#import <FastttCamera.h>
#import <FastttFilterCamera.h>
#import "ReceiptsManager.h"
#import "RecordsManager.h"
#import "UIView+RZViewActions.h"

@interface OperadorViewController () <FastttCameraDelegate, UIAlertViewDelegate>
@property (nonatomic, strong) FastttCamera *fastCamera;
@end

@implementation OperadorViewController

#pragma mark - IFTTTFastttCameraDelegate

- (void)cameraController:(FastttCamera *)cameraController
 didFinishCapturingImage:(FastttCapturedImage *)capturedImage
{
    /**
     *  Here, capturedImage.fullImage contains the full-resolution captured
     *  image, while capturedImage.rotatedPreviewImage contains the full-resolution
     *  image with its rotation adjusted to match the orientation in which the
     *  image was captured.
     */
        NSLog(@"finished taking pic");
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImageWriteToSavedPhotosAlbum(capturedImage.fullImage, nil, nil, nil);
    });
}

NSTimeInterval lastPhototime = -1;
- (IBAction)takePicture:(id)sender
{
    NSTimeInterval curTime = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval dt = curTime-lastPhototime;
    if (lastPhototime<0 || dt >4)
    {
        NSLog( @"take pic!: dt %.2f, curTime: %.2f, lastPhototime: %.2f,",dt,curTime,lastPhototime );
        [self.fastCamera takePicture];
        rm.nPhotos ++;
        [rem saveEventWithDate:[NSDate date] eventType:eventType_Picture operador:rm.curUser];
        lastPhototime = curTime;
        
        [self animateViOK];
    }
    else
    {
        NSLog( @"NO pic!: dt %.2f, curTime: %.2f, lastPhototime: %.2f,",dt,[NSDate timeIntervalSinceReferenceDate],lastPhototime );
//        NSLog(@"did not take pic: Photo Interval less than 2 seconds");
    }
//    UIAlertController *alertController = [UIAlertController
//                                          alertControllerWithTitle:@"Sucesso!"
//                                          message:@"Recibo Registrado"
//                                          preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *okAction = [UIAlertAction
//                               actionWithTitle:@"OK"
//                               style:UIAlertActionStyleDefault
//                               handler:^(UIAlertAction *action)
//                               {
//                                   NSLog(@"OK action");
//                               }];
//    [alertController addAction: okAction];
//    [self presentViewController:alertController animated:YES completion:nil];
    
    
    

    
}

- (void) animateViOK
{
    RZViewAction *scaleUp = [RZViewAction action:^{
        vi_ok.transform = CGAffineTransformScale(vi_ok.transform, 1.3f, 1.3f);
    } withOptions:UIViewAnimationOptionCurveEaseOut duration:0.2];
    
    RZViewAction *scaleDown = [RZViewAction action:^{
        vi_ok.transform = CGAffineTransformIdentity;
    } withDuration:0.15];
    
    RZViewAction *fadeOut = [RZViewAction action:^{
        vi_ok.alpha = 0;
    } withDuration:0.15];
    
    RZViewAction *wait = [RZViewAction waitForDuration:2.];
    
    RZViewAction *heartbeat = [RZViewAction sequence:@[scaleUp,scaleDown, wait, fadeOut]];
    
    vi_ok.hidden = NO;
    vi_ok.alpha = 1.;
    [UIView rz_runAction:heartbeat withCompletion:^(BOOL finished) {
        NSLog(@"Animation complete!");
        vi_ok.hidden = YES;
    }];
}

- (IBAction)logout:(id)sender
{
    
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Logout:"
                                          message:[NSString stringWithFormat:@"%i recibos registrados!",rm.nPhotos]
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   NSLog(@"OK action");
                                   [self performSegueWithIdentifier:@"operadorUnwindSegue" sender:sender];
                                   NSLog(@"lolog");
                               }];
    [alertController addAction: okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
    rm.nPhotos = 0;
    [rem saveEventWithDate:[NSDate date] eventType:eventType_Logout operador:rm.curUser];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _fastCamera = [FastttCamera new];
    self.fastCamera.delegate = self;
    
    [self fastttAddChildViewController:self.fastCamera];
//    self.fastCamera.view.frame = self.view.frame;
//    NSLog(@"x %.2f", self.view.frame.origin.x);
//    NSLog(@"y %.2f", self.view.frame.origin.y);
//    NSLog(@"w %.2f", self.view.frame.size.width);
//    NSLog(@"h %.2f", self.view.frame.size.height);
    self.fastCamera.view.frame = CGRectMake(0, 60, 320, 568-120);
    // Do any additional setup after loading the view.
//    UIImage *lookupFilterImage = [UIImage imageNamed:@"YourLookupImage"];
//    _fastCamera = [FastttFilterCamera cameraWithFilterImage:lookupFilterImage];
//    self.fastCamera.delegate = self;
//    
//    [self fastttAddChildViewController:self.fastCamera];
//    self.fastCamera.view.frame = self.view.frame;
    __weak typeof(self) weakSelf = self;
    self.volumeHandler = [JPSVolumeButtonHandler volumeButtonHandlerWithUpBlock:^{
        NSLog(@"up");
        [weakSelf takePicture:nil];
    } downBlock:^{
        NSLog(@"down");
        [weakSelf takePicture:nil];
    }];
    
    [self.view bringSubviewToFront:vi_ok];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
