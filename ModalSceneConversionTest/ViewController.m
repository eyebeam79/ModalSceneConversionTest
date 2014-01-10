//
//  ViewController.m
//  ModalSceneConversionTest
//
//  Created by SDT1 on 2014. 1. 10..
//  Copyright (c) 2014년 SDT1. All rights reserved.
//

#import "ViewController.h"
#import "ModalViewController.h"

@interface ViewController () <UITextFieldDelegate>
@end

@implementation ViewController

// 세그웨이를 이용해서 전환전 준비 과정
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([@"ModalSegue" isEqualToString:segue.identifier])
    {
        ModalViewController *modalVC = segue.destinationViewController;
        
        // 모달 뷰 컨트롤러의 데이터에 값 전달
        modalVC.msg = self.mainInput.text;
    }
}

// 세그웨이를 코드로 실행해서 전환
- (IBAction)showModal1:(id)sender
{
    [self performSegueWithIdentifier:@"ModalSegue" sender:self];
}

// 뷰 컨트롤러를 이용해서 전환
- (IBAction)showModal2:(id)sender
{
    UIStoryboard *storyboard = self.storyboard;
    
    // 스토리 보드에서 뷰 컨트롤러를
    ModalViewController *modalVC = [storyboard instantiateViewControllerWithIdentifier:@"modalVC"];
    // 데이터 전달
    modalVC.msg = self.mainInput.text;
    
    // 뷰컨트롤러전환
    [self presentViewController:modalVC animated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.mainInput resignFirstResponder];
    
    return YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    //화면 전환시 키보드 감추기
    [self.mainInput resignFirstResponder];
    
    [super viewDidAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
