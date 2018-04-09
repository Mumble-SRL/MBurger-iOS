<p align="center" >
<img src="https://mumbleideas.it/wp-content/uploads/2017/12/Mumble-anim-300.gif" alt="Mumble Logo" title="Mumble Logo">
</p>

# NoookoSDK

NookoSDK is a client libary, written in Objective C, that can be used to interact with the [Nooko](https://nooko3.mumbleserver.it/login) API.

# Installation

# Installation with CocoaPods

CocoaPods is a dependency manager for iOS, which automates and simplifies the process of using 3rd-party libraries in your projects. You can install CocoaPods with the following command:

```
$ gem install cocoapods

```

To integrate the NookoSDK into your Xcode project using CocoaPods, specify it in your Podfile:

```
platform :ios, '10.0'

target 'TargetName' do
    pod 'NookoSDK', git: 'https://gitlab.mumbleserver.it/iOS/NookoSDK'
end
```

Then, run the following command:

```
$ pod install
```

CocoaPods is the preferred methot to install the library.

# Manual installation

To install the library manually drag and drop the folder `NookoSDK` to your project structure in XCode. 

Note that `NookoSDK` has `AFNetworking (3.0)` as a dependency, so you have to install also this library.

# Initialization

To initialize the SDK you have to create a token through the [dashboard](https://nooko3.mumbleserver.it/). Click on the settings icon on the top-right and create a API Key specifiyng the permissions.

In your `AppDelegate` `application:didFinishLaunchingWithOptions:` initialize the SDK like the following:

```
#import "AppDelegate.h"
#import "NookoSDK.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [NKManager sharedManager].apiToken = @"26c96ab3c9a67f45cc2e9bff35869bfd8a778cb0";
    
    return YES;
}
```

You will not be able to interact with the SDK if you don't initialize it with a correct token/key.

# Usage

# Project


# Blocks


# Sections

# Object mapping

# Serialization

# Contacts

You can contuct us at [info@mumbleideas.it](mailto:https://gitlab.mumbleserver.it/iOS/NookoSDK/raw/master/LICENSE).

# License

NookoSDK is released under the MIT license. See [LICENSE](https://gitlab.mumbleserver.it/iOS/NookoSDK/raw/master/LICENSE) for details.