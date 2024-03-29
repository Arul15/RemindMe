//
//  RemindMeViewController.h
//
//  Created by Keith Harrison on 12/07/2010 http://useyourloaf.com
//  Copyright (c) 2010 Keith Harrison. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  Redistributions of source code must retain the above copyright
//  notice, this list of conditions and the following disclaimer.
//
//  Redistributions in binary form must reproduce the above copyright
//  notice, this list of conditions and the following disclaimer in the
//  documentation and/or other materials provided with the distribution.
//
//  Neither the name of Keith Harrison nor the names of its contributors
//  may be used to endorse or promote products derived from this software
//  without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER ''AS IS'' AND ANY
//  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE FOR ANY
//  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 

#import <UIKit/UIKit.h>

@interface RemindMeViewController : UIViewController <UITextFieldDelegate> {

	UITextField *reminderText;
	UISegmentedControl *scheduleControl;
	UIButton *setButton;
	UIButton *clearButton;
	UIDatePicker *datePicker;
}

@property (nonatomic,retain) IBOutlet UITextField *reminderText;
@property (nonatomic,retain) IBOutlet UISegmentedControl *scheduleControl;
@property (nonatomic,retain) IBOutlet UIButton *setButton;
@property (nonatomic,retain) IBOutlet UIButton *clearButton;
@property (nonatomic,retain) IBOutlet UIDatePicker *datePicker;

- (IBAction)clearNotification;
- (IBAction)scheduleNotification;
- (void)showReminder:(NSString *)text;
@end

