# MBPush

This MBurger module manages the psuh notification work. MBPush implements the pub/sub paradigm: your client can subscribe/unsubscribe to topics based on what kind of push notifications it wants to recieve. The server then will send the notification to all the client subscriber to the topic. The topic representing thhe whole application (the one to wich the dashboard will send notifications) is `project.PROJECT_ID`


The first thing you need to do to setup push notifications for your project is setitng the push notifications token in your `AppDelegate` `application:didFinishLaunchingWithOptions:`.

**Objective-C**:

```objective-c
#import "AppDelegate.h"
#import "MBurger.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [MBManager sharedManager].pushToken = @"YOUR_PUSH_TOKEN";
    
    return YES;
}
```

**Swift**:

```swift
import MBurger

...

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        MBManager.shared(). pushToken = "YOUR_PUSH_TOKEN"
    return true
}
```

Then you need to obtain a push notifications token from the APNS with the `UNUserNotificationCenter` class, requesting authorization to the user.

Once you have obtained a push notification you need to register the device to the MBPush push service and after that you can register to all the topics from what you want to receive notifications. As said above the topic representing thhe whole application (the one to wich the dashboard will send notifications) is `project.PROJECT_ID`.

**Objective-C**:

```objective-c
- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken {
    
    [MBPush registerDeviceWithDeviceData: deviceToken
    							    	Success:^{
        [MBPush registerToTopic: @"project.PROJETC_ID" 
       					 Success:^{
           				 } 
        					 Failure:^(NSError *error) {
        
        					 }];
    } Failure:^(NSError *error) {
        
    }];
}
```

**Swift**:

```swift
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        MBPush.registerDevice(withDeviceData: deviceToken, success: {
            MBPush.register(toTopic: "project.46", success: {
                print("Registered to push")
            }, failure: {error in
                print(error)
            })
        }, failure: { error in
            print(error)
        })
    }
```

