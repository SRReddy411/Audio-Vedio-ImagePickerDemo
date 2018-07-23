//
//  ViewController.m
//  DemoOnAudio$VedioPicker
//
//  Created by volive on 6/29/18.
//  Copyright © 2018 volive. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>



@interface ViewController ()

@end

@implementation ViewController


- (IBAction)pickerViewBtn_Action:(id)sender {
    
    [self forImgae];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    NSLog(@"file path %@",chosenImage);
    NSLog(@"vedio file %@",info[UIImagePickerControllerMediaType]);
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)forImgae{
    
    
    UIAlertController * view=   [UIAlertController
                                 alertControllerWithTitle:@"Pick The Image"
                                 message:@"From"
                                 preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* PhotoLibrary = [UIAlertAction
                                   actionWithTitle:@"Photo Library"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                        //Do some thing here
                                       [self selectPhoto];
                                       
                                       [view dismissViewControllerAnimated:YES completion:nil];
                                       
                                   }];
    UIAlertAction* camera = [UIAlertAction
                             actionWithTitle:@"Camera"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 
                                 [self takePhoto];
                                 [view dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
    UIAlertAction* vedio = [UIAlertAction
                             actionWithTitle:@"Vedio"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                        [self getVideo];
                                 [view dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
    UIAlertAction* audio = [UIAlertAction
                            actionWithTitle:@"Audio"
                            style:UIAlertActionStyleDefault
                            handler:^(UIAlertAction * action)
                            {
                                [self getVideo];
                                [view dismissViewControllerAnimated:YES completion:nil];
                                
                            }];
    
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleCancel
                             handler:^(UIAlertAction * action)
                             {
                          
                                 [view dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
    [cancel setValue:[UIColor colorWithRed:240.0f/255.0f green:98.0f/255.0f blue:115.0f/255.0f alpha:1] forKey:@"_titleTextColor"];
    
    [view addAction:PhotoLibrary];
    [view addAction:camera];
    [view addAction:vedio];
    [view addAction:audio];
    [view addAction:cancel];
    [self presentViewController:view animated:YES completion:nil];
    
}
- (void)takePhoto {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}
- (void)selectPhoto {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    
}
- (void)getVideo {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.mediaTypes = @[ (NSString *) kUTTypeMovie ];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(void)getAudio{
    MPMediaPickerController *pickerController = [[MPMediaPickerController alloc] initWithMediaTypes:MPMediaTypeMusic];
    pickerController.prompt = @"Select Song From Your Music App";
    pickerController.delegate = self;
    [self presentViewController:pickerController animated:YES completion:nil];
}

- (void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection{
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"You picked : %@",mediaItemCollection);
}

@end
