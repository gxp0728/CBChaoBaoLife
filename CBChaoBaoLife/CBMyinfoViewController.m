//
//  CBMyinfoViewController.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/11/3.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBMyinfoViewController.h"
#import "CBUserInfoMngTool.h"
#import "UIView+Extension.h"
#import "CBTabBarHiddenTool.h"
#import "MBProgressHUD+MoreExtersion.h"
#import <QuartzCore/QuartzCore.h>
@interface CBMyinfoViewController ()

@property(weak,nonatomic)UILabel *sex;
@property(weak,nonatomic)UIImageView *icon;
@property (strong,nonatomic) NSString *name;
@property (weak,nonatomic) UIImage *image;
@property(weak,nonatomic)UILabel *userName;
@property (weak,nonatomic)UIButton *sure;
@property (weak,nonatomic)UITextField *title1;
@property (strong,nonatomic)UIImageView *imageView;

@end

@implementation CBMyinfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubviews];
}

#pragma mark 添加子控件
-(void)setSubviews{
    
    UIImageView *icon = [[UIImageView alloc]init];
    _icon = icon;
    [self.view addSubview:icon];
    icon.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-50.f, 64.f+50.f, 100.f, 100.f);
    icon.layer.cornerRadius = icon.width/2;
    icon.layer.masksToBounds = YES;
//    icon.backgroundColor = [UIColor redColor];
    [icon setImage:[CBUserInfoMngTool sharedCbUserInfoMngTool].image];
    
    UILabel *sex = [[UILabel alloc]init];
    _sex=sex;
    [self.view addSubview:sex];
    sex.frame = CGRectMake(icon.left, icon.bottom+60.f, 40.f, 25.f);
    
    UIPickerView *selectSex = [[UIPickerView alloc]init];
    selectSex.delegate = self;
    selectSex.frame = CGRectMake(sex.right+20.f, sex.top-30.f, 50.f, 30.f);
    [self.view addSubview:selectSex];
    
    UITextField *name = [[UITextField alloc]init];
    _title1 = name;
    [self.view addSubview:name];
    name.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-100.f, selectSex.bottom+20.f, 200.f, 40.f);
    name.text = [CBUserInfoMngTool sharedCbUserInfoMngTool].userName;
    name.textAlignment = NSTextAlignmentCenter;
    name.backgroundColor = [UIColor colorWithRed:242.f/255.f green:242.f/255.f blue:242.f/255.f alpha:1.f];
    name.layer.cornerRadius = 10.f;
    name.delegate = self;
    name.placeholder = @"还不知道你叫什么?";
    UIButton *sure = [[UIButton alloc]init];
    _sure = sure;
    [self.view addSubview:sure];
    sure.frame = CGRectMake(20.f, [UIScreen mainScreen].bounds.size.height-60.f, [UIScreen mainScreen].bounds.size.width-40.f, 40.f);
    [sure setTitle:@"完成" forState:UIControlStateNormal];
    sure.titleLabel.textColor = [UIColor grayColor];
    sure.backgroundColor = [UIColor redColor];
    sure.layer.cornerRadius = 10.f;
    sure.layer.masksToBounds = YES;
    [sure addTarget:self action:@selector(sure:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *select = [[UIButton alloc]init];
    select.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-25.f, icon.bottom+10.f, 50.f, 20.f);
    [select setTitle:@"头像" forState:UIControlStateNormal];
    [select setTitleColor:[UIColor colorWithRed:42.f/255.f green:102.f/255.f blue:255.f/255.f alpha:1] forState:UIControlStateNormal];
    [self.view addSubview:select];
    [select addTarget:self action:@selector(seticon:) forControlEvents:UIControlEventTouchUpInside];

    
}
#pragma mark 选择本地照片
-(void)seticon:(UIButton *)sender{
    UIImagePickerController *imagepicker = [[UIImagePickerController alloc]init];
    imagepicker.delegate =self;
    imagepicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagepicker animated:YES completion:nil];
}
#pragma mark 响应函数
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *image = info[UIImagePickerControllerOriginalImage ];
    _image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
    [_icon setImage:image];
}

#pragma mark 更新信息
-(void)sure:(UIButton *)sender{
    if (_title1.text.length == 0||[_title1.text isEqualToString:@""]) {
        [MBProgressHUD showTipToWindow:@"您还没有输入名字"];
    }else{
    [self.navigationController popViewControllerAnimated:YES];
        if (_image == nil) {
            _image =[CBUserInfoMngTool sharedCbUserInfoMngTool].image;
        }else{
    [CBUserInfoMngTool sharedCbUserInfoMngTool].image = _image;
        }
    [CBUserInfoMngTool sharedCbUserInfoMngTool].userName = _title1.text;
        
        NSData *data = UIImagePNGRepresentation(_image);
        NSString *imagename = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//        NSString *imageName = [[NSString alloc ]initWithData:data encoding:NSUTF8StringEncoding];
        [[NSUserDefaults standardUserDefaults]setObject:imagename forKey:@"imageName"];
        [[NSUserDefaults standardUserDefaults]setObject:[CBUserInfoMngTool sharedCbUserInfoMngTool].userName forKey:@"userName"];
        
        
        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
        NSString *name =@"default string";
        [defaults setObject:name forKey:@"name"];
        //获得UIImage实例
        
        UIImage *image=[[UIImage alloc]initWithContentsOfFile:@"photo.jpg"];
        
        NSData *imageData = UIImageJPEGRepresentation(image, 100);//UIImage对象转换成NSData
        
        [defaults synchronize];//用synchronize方法把数据持久化到standardUserDefaults数据库
    
        
//        UIGraphicsBeginImageContext(_icon.bounds.size);
//        [_icon.layer renderInContext:UIGraphicsGetCurrentContext()];
//        UIImage *temp = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        UIImageWriteToSavedPhotosAlbum(temp, nil, nil, nil);
//        
//        //2.保存到对应的沙盒目录中，具体代码如下：
//        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
//        NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"image"]];   // 保存文件的名称
//        BOOL result = [UIImagePNGRepresentation(_icon.image)writeToFile: filePath    atomically:YES]; // 保存成功会返回YES
        [self saveImage:_image withName:@"image"];
        
    }
}

#pragma mark 设置头像
-(BOOL) saveImage:(UIImage*)img withName:(NSString*)fileName
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* path = [paths objectAtIndex:0];
    NSString* filePath = [path stringByAppendingPathComponent:fileName];
    NSData *data = [NSData dataWithData:UIImagePNGRepresentation(img)];
    BOOL ret = [data writeToFile:filePath atomically:YES];
    return ret;
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    switch (row) {
        case 0:
        {
//            if ([CBUserInfoMngTool sharedCbUserInfoMngTool].sex == nil) {
//                [CBUserInfoMngTool sharedCbUserInfoMngTool].sex = @"男";
                _sex.text = @"男";
//            }else{
//                _sex.text = [CBUserInfoMngTool sharedCbUserInfoMngTool].sex;
//            }
           
        }
            break;
        case 1:
        {
//            if ([CBUserInfoMngTool sharedCbUserInfoMngTool].sex == nil) {
//                [CBUserInfoMngTool sharedCbUserInfoMngTool].sex = @"女";
                _sex.text = @"女";
//            }else{
//                _sex.text = [CBUserInfoMngTool sharedCbUserInfoMngTool].sex;
//            }
            
        }
            break;
        default:
            break;
    }
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
    
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (row == 0) {
        return @"男";
    }
    return @"女";
    
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return 2;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [[CBTabBarHiddenTool shareCBTabBarHiddenTool]hiddenTabBar];
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [[CBTabBarHiddenTool shareCBTabBarHiddenTool]showTabBar];
    
}

@end
