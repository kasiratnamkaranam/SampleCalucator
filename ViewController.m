//
//  ViewController.m
//  SimpleCalC
//
//  Created by Karanam Kasiratnam on 11/07/13.
//  Copyright (c) 2013 Karanam Kasiratnam. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize enter1,enter2,resultDisplay,resultArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.resultArray = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

  //  addition of two numbers

- (IBAction)addition:(id)sender {
    
    int a=[self.enter1.text intValue];
    int b=[self.enter2.text intValue];
    int c=a+b;
    
    self.resultDisplay.text = [NSString stringWithFormat:@" Result = %d",c];
}

  //  subtraction of two numbers

- (IBAction)subtraction:(id)sender {
    
    int a=[self.enter1.text intValue];
    int b=[self.enter2.text intValue];
    int c=a-b;
    
    self.resultDisplay.text = [ NSString stringWithFormat:@" Result = %d",c];
}

  //  multiplication of two numbers

- (IBAction)multiplication:(id)sender {
    
    int a=[self.enter1.text intValue];
    int b=[self.enter2.text intValue];
    int c=a*b;
    
    self.resultDisplay.text = [NSString stringWithFormat:@"Result = %d",c];
}

  //  division of two numbers

- (IBAction)division:(id)sender {
    
    float a=[self.enter1.text intValue];
    float b=[self.enter2.text intValue];
    float c=a/b;
    
    self.resultDisplay.text = [NSString stringWithFormat:@"Result = %f",c];
}

- (IBAction)facebookShare:(id)sender {
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        SLComposeViewControllerCompletionHandler myBlock = ^(SLComposeViewControllerResult result){
            if (result == SLComposeViewControllerResultCancelled){
                
            
                NSLog(@"Cancelled");
            }else{ 
                NSLog(@"Done");
            }
            [controller dismissViewControllerAnimated:YES completion:Nil];
        };
        
        controller.completionHandler = myBlock;
        
        //Adding the text to the facebook Post value from iOS
        
        [controller setInitialText:@"Result"];
        [controller setInitialText:self.resultDisplay.text];
    
    
    
        [self presentViewController:controller animated:YES completion:nil];
    }
}

  //this is for dismiss the keyboard

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
}
    

@end
