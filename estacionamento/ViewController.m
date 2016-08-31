//
//  ViewController.m
//  estacionamento
//
//  Created by rony tjioe chung on 12/07/16.
//  Copyright © 2016 pato. All rights reserved.
//

#import "ViewController.h"
#import "RecordsManager.h"
#import "ReceiptsManager.h"
#import "Config.h"

@interface ViewController ()



@end

@implementation ViewController

-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {

}

-(IBAction)operadorUnwindSegue:(UIStoryboardSegue *)segue {
    NSLog(@"hahah");
}

- (IBAction)entrar:(id)sender
{
    NSString *pass =  rm.senhas[rm.curUser];
    if ([_passwordTextField.text isEqualToString:pass])
    {
        if (rm.curUser == 0)
        {
            //ADMIN
            [self performSegueWithIdentifier:@"adminSegue" sender:sender];
        }
        else
        {
            //OPERADOR
            [self performSegueWithIdentifier:@"operadorSegue" sender:sender];
        }
        rm.nPhotos = 0;
        [rem saveEventWithDate:[NSDate date] eventType:eventType_Login operador:rm.curUser];
    }
    else
    {
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Senha incorreta!"
                                              message:@"Tente de novo"
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"OK action");
                                   }];
        [alertController addAction: okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
//    return 50.f;
//}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return n_users +1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (row == 0) {
        return @"admin";
    }
    return [NSString stringWithFormat:@"%li", (long)row];
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    rm.curUser = (int)row;
    NSLog(@"row:");
    NSLog(@"%i",rm.curUser);
}

//- (IBAction)submitEmailClicked:(id)sender {
//    
////    [self.password resignFirstResponder];
//    
//    UIAlertController* formAlert = [UIAlertController alertControllerWithTitle:@"Erro ao verificar email"
//                                                                       message:@"Email inválido"
//                                                                preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
//                                                          handler:^(UIAlertAction * action) {}];
//    
//    [formAlert addAction:defaultAction];
//    
//    if ([self.password.text length] == 0) {
//        formAlert.message = @"Email é obrigatório";
//        [self presentViewController:formAlert animated:YES completion:nil];
//        return;
//    }
//    
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.labelText = @"Enviando...";
//    hud.dimBackground = YES;
//    
//    
//    [clm verifyEmail:self.password.text block:^void(NSURLSessionTask *operation, NSError *error) {
//        [MBProgressHUD hideHUDForView:self.view animated:NO];
//        [self performSegueWithIdentifier:@"LoginVerified" sender:sender];
//    } errorBlock:^void(NSURLSessionDataTask *task, NSError *error) {
//        [MBProgressHUD hideHUDForView:self.view animated:NO];
//        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
//        NSInteger statusCode = [response statusCode];
//        switch (statusCode) {
//            case 403:
//                [self presentViewController:formAlert animated:YES completion:nil];
//                break;
//            default:
//                formAlert.message = @"Ocorreu um erro inesperado. Tente novamente mais tarde.";
//                [self presentViewController:formAlert animated:YES completion:nil];
//                break;
//        }
//    }];
//}

- (void)viewWillAppear:(BOOL)animated
{
    _passwordTextField.text = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _passwordTextField.keyboardType = UIKeyboardTypePhonePad;
    _passwordTextField.secureTextEntry = YES;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
