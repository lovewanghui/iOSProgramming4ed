//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by John Gallagher on 1/6/14.
//  Copyright (c) 2014 John Gallagher. All rights reserved.
//

#import "BNRQuizViewController.h"
//一种类扩展的形式.这里的属性是私有的.方法也是的.

@interface BNRQuizViewController ()

@property (nonatomic, assign) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *answers;
@property (nonatomic, copy) NSArray *questions;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

/**
 设置插座变量(outlets),插座变量是一种指向对象的指针.
 思考这里为什么要使用weak???
 */
@end

@implementation BNRQuizViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        // Create two arrays filled with questions and answers
        // and make the pointers point to them

        self.questions = @[@"From what is cognac made?",
                           @"What is 7+7?",
                           @"What is the capital of Vermont?"];

        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    }

    // Return the address of the new object
    return self;
}


/**
 思考:数据的懒加载技术???
 思考:整个控制器的生命周期中,在周期内什么条件下调用什么方法???
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (IBAction)showQuestionButtonPressed:(UIButton *)sender
{
    // Step to the next question
    self.currentQuestionIndex++;

    // Am I pas the last question?
    if (self.currentQuestionIndex == [self.questions count]) {

        // Go back to the first question
        self.currentQuestionIndex = 0;
    }

    // Get the string at the index in the questions array
    NSString *question = self.questions[self.currentQuestionIndex];

    // Display the string in the question label
    self.questionLabel.text = question;

    // Reset the answer label
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswerButtonPressed:(UIButton *)sender
{
    // What is the answer to the current question?
    NSString *answer = self.answers[self.currentQuestionIndex];

    // Display it in the answer label
    self.answerLabel.text = answer;
}

/**
 设置动作(action),动作是一种方法.这种方法在视图和用户发生交互的时候会被调用.
 */
@end
