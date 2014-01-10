//
//  ModalViewController.m
//  ModalSceneConversionTest
//
//  Created by SDT1 on 2014. 1. 10..
//  Copyright (c) 2014년 SDT1. All rights reserved.
//

#import "ModalViewController.h"
#import "ViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController


// 모달 닫기
- (IBAction)closeModalVC:(id)sender
{
    // 메인 뷰 컨트롤러에게 값 전달
    ViewController *mainVC = (ViewController *)self.presentingViewController;
    
    // 뷰에 직접 넣기
    mainVC.mainInput.text = self.modalInput.text;
    
    // 모달뷰 닫기
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 뷰가 나타나면서 테이터를 뷰에 반영
- (void)viewWillAppear:(BOOL)animated
{
    self.modalInput.text = self.msg;
}

- (void)viewWillDisappear:(BOOL)animated
{
    // 뷰가 사라지면서 키보드 감추기
    [self.modalInput resignFirstResponder];
    [super viewWillDisappear:animated];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
