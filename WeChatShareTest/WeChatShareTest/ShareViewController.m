//
//  ShareViewController.m
//  WeChatShareTest
//
//  Created by 马锐 on 16/1/14.
//  Copyright © 2016年 huahua. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController () <UIAlertViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UIButton *sendBtn;

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    
}

- (void)createSubViews {
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 120, 120)];
    self.imgView.layer.borderWidth = 0.5;
    self.imgView.layer.borderColor = [[UIColor orangeColor] CGColor];
    [self.view addSubview:self.imgView];
    
    UITapGestureRecognizer *tap  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView)];
    [self.imgView addGestureRecognizer:tap];
    
    self.sendBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 350, 60, 30)];
    [self.sendBtn setTitle:@"分享" forState:UIControlStateNormal];
    self.sendBtn.layer.borderColor = [[UIColor orangeColor] CGColor];
    self.sendBtn.layer.borderWidth = 0.5;
    [self.view addSubview:self.sendBtn];
    
    [self.sendBtn addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchUpInside];
}

//点击imageView
- (void)tapImageView {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"选择图片" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"相机", @"相册", nil];
    [alertView show];
}

//相机
- (void)openCamera {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *cameraVC = [[UIImagePickerController alloc] init];
        cameraVC.delegate = self;
        cameraVC.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:cameraVC animated:YES completion:nil];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"当前设备不支持拍照" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    }
}

//相册
- (void)openPhotoLibrary {
    UIImagePickerController *photoLibrary = [[UIImagePickerController alloc] init];
    photoLibrary.delegate = self;
    photoLibrary.allowsEditing = YES;
    photoLibrary.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:photoLibrary animated:YES completion:nil];
}

//分享按钮
- (void)shareAction:(UIButton *)button {
    
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 1:
            [self openCamera];
            break;
        case 2:
            [self openPhotoLibrary];
            break;
            
        default:
            break;
    }
}


#pragma mark - UIImagePickerControllerDelegate
- 



#pragma mark - **
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
