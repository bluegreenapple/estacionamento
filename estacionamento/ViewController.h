//
//  ViewController.h
//  estacionamento
//
//  Created by rony tjioe chung on 12/07/16.
//  Copyright © 2016 pato. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

- (IBAction)entrar:(id)sender;

@end

