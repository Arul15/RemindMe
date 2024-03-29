//
//  RemindMeViewController.m
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

#import "RemindMeViewController.h"
#import "RemindMeAppDelegate.h"

@implementation RemindMeViewController

@synthesize reminderText;
@synthesize scheduleControl;
@synthesize setButton;
@synthesize clearButton;
@synthesize datePicker;


#pragma mark -
#pragma mark === Initialization and shutdown ===
#pragma mark -

- (void)viewDidLoad {
	
	datePicker.minimumDate = [NSDate date];
	reminderText.delegate = self;
}

- (void)viewDidUnload {
	
	[super viewDidUnload];
	self.reminderText = nil;
	self.scheduleControl = nil;
	self.clearButton = nil;
	self.setButton = nil;
	self.datePicker = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return NO;
}

- (void)dealloc {
	[reminderText release];
	[scheduleControl release];
	[clearButton release];
	[setButton release];
	[datePicker release];
    [super dealloc];
}

#pragma mark -
#pragma mark === Text Field Delegate ===
#pragma mark -

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	[textField resignFirstResponder];
	return YES;
}

#pragma mark -
#pragma mark === View Actions ===
#pragma mark -

- (void)clearNotification {
	
	[[UIApplication sharedApplication] cancelAllLocalNotifications];
}

- (void)scheduleNotification {
	
	[reminderText resignFirstResponder];
	[[UIApplication sharedApplication] cancelAllLocalNotifications];

	Class cls = NSClassFromString(@"UILocalNotification");
	if (cls != nil) {
		
		UILocalNotification *notif = [[cls alloc] init];
		notif.fireDate = [datePicker date];
		notif.timeZone = [NSTimeZone defaultTimeZone];
		
		notif.alertBody = @"Did you forget something?";
		notif.alertAction = @"Show me";
		notif.soundName = UILocalNotificationDefaultSoundName;
		notif.applicationIconBadgeNumber = 1;
		
		NSInteger index = [scheduleControl selectedSegmentIndex];
		switch (index) {
			case 1:
				notif.repeatInterval = NSMinuteCalendarUnit;
				break;
			case 2:
				notif.repeatInterval = NSHourCalendarUnit;
				break;
			case 3:
				notif.repeatInterval = NSDayCalendarUnit;
				break;
			case 4:
				notif.repeatInterval = NSWeekCalendarUnit;
				break;
			default:
				notif.repeatInterval = 0;
				break;
		}
		
		NSDictionary *userDict = [NSDictionary dictionaryWithObject:reminderText.text
												forKey:kRemindMeNotificationDataKey];
		notif.userInfo = userDict;
		
		[[UIApplication sharedApplication] scheduleLocalNotification:notif];
		[notif release];
	}
}

#pragma mark -
#pragma mark === Public Methods ===
#pragma mark -

- (void)showReminder:(NSString *)text {
	
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Reminder" 
											message:text delegate:nil
											cancelButtonTitle:@"OK"
											otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}

@end
