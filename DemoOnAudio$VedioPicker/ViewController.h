//
//  ViewController.h
//  DemoOnAudio$VedioPicker
//
//  Created by volive on 6/29/18.
//  Copyright © 2018 volive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,MPMediaPickerControllerDelegate>

@property UIImagePickerController *picker;
@end

