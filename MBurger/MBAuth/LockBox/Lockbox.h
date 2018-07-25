//
//  Lockbox.h
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation
// the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Lockbox : NSObject

#ifdef DEBUG
// For unit tests
@property (strong, nonatomic, readonly) NSString *keyPrefix;
#endif

@property (assign, nonatomic, readonly) OSStatus lastStatus;

// When the default key prefix (your app's bundle id) is not sufficient, instantiate your own
// instance of Lockbox specifying your own key prefix, and use the appropriate instance methods
// to store and retrieve keychain data. You can also instantiate your own instance and use the
// default key prefix simply by calling [[Lockbox alloc] init];
-(instancetype)initWithKeyPrefix:(NSString *)keyPrefix;

// When adding instance methods, remember to add a corresponding class method.

-(BOOL)archiveObject:(id<NSSecureCoding>)object forKey:(NSString *)key;
-(BOOL)archiveObject:(id<NSSecureCoding>)object forKey:(NSString *)key accessibility:(CFTypeRef)accessibility;

-(id)unarchiveObjectForKey:(NSString *)key;

-(BOOL)setString:(NSString *)value forKey:(NSString *)key DEPRECATED_MSG_ATTRIBUTE("Migrate to -archiveObject:forKey:");
-(BOOL)setString:(NSString *)value forKey:(NSString *)key accessibility:(CFTypeRef)accessibility DEPRECATED_MSG_ATTRIBUTE("Migrate to -archiveObject:forKey:accesibility");
-(NSString *)stringForKey:(NSString *)key DEPRECATED_MSG_ATTRIBUTE("Migrate to -unarchiveObject:forKey:");

-(BOOL)setArray:(NSArray *)value forKey:(NSString *)key DEPRECATED_MSG_ATTRIBUTE("Migrate to -archiveObject:forKey:");
-(BOOL)setArray:(NSArray *)value forKey:(NSString *)key accessibility:(CFTypeRef)accessibility DEPRECATED_MSG_ATTRIBUTE("Migrate to archiveObject:forKey:accesibility");
-(NSArray *)arrayForKey:(NSString *)key DEPRECATED_MSG_ATTRIBUTE("Migrate to -unarchiveObject:forKey:");

-(BOOL)setSet:(NSSet *)value forKey:(NSString *)key DEPRECATED_MSG_ATTRIBUTE("Migrate to -archiveObject:forKey:");
-(BOOL)setSet:(NSSet *)value forKey:(NSString *)key accessibility:(CFTypeRef)accessibility DEPRECATED_MSG_ATTRIBUTE("Migrate to -archiveObject:forKey:accesibility");
-(NSSet *)setForKey:(NSString *)key DEPRECATED_MSG_ATTRIBUTE("Migrate to -unarchiveObject:forKey:");

-(BOOL)setDictionary:(NSDictionary *)value forKey:(NSString *)key DEPRECATED_MSG_ATTRIBUTE("Migrate to -archiveObject:forKey:");
-(BOOL)setDictionary:(NSDictionary *)value forKey:(NSString *)key accessibility:(CFTypeRef)accessibility DEPRECATED_MSG_ATTRIBUTE("Migrate to -archiveObject:forKey:accesibility");
-(NSDictionary *)dictionaryForKey:(NSString *)key DEPRECATED_MSG_ATTRIBUTE("Migrate to -unarchiveObject:forKey:");

-(BOOL)setDate:(NSDate *)value forKey:(NSString *)key DEPRECATED_MSG_ATTRIBUTE("Migrate to -archiveObject:forKey:");
-(BOOL)setDate:(NSDate *)value forKey:(NSString *)key accessibility:(CFTypeRef)accessibility DEPRECATED_MSG_ATTRIBUTE("Migrate to -archiveObject:forKey:accesibility");
-(NSDate *)dateForKey:(NSString *)key DEPRECATED_MSG_ATTRIBUTE("Migrate to -unarchiveObject:forKey:");

// Class methods that maintain the convenience of storing and retrieving data from the keychain
// using class-level methods. An internal instance of Lockbox is instantiated for the class that
// uses the instance methods above, and a key prefix equal to your app's bundle id.

+(BOOL)archiveObject:(id<NSSecureCoding>)object forKey:(NSString *)key;
+(BOOL)archiveObject:(id<NSSecureCoding>)object forKey:(NSString *)key accessibility:(CFTypeRef)accessibility;

+(id)unarchiveObjectForKey:(NSString *)key;

+(BOOL)setString:(NSString *)value forKey:(NSString *)key DEPRECATED_MSG_ATTRIBUTE("Migrate to +archiveObject:forKey:");
+(BOOL)setString:(NSString *)value forKey:(NSString *)key accessibility:(CFTypeRef)accessibility DEPRECATED_MSG_ATTRIBUTE("Migrate to +archiveObject:forKey:accesibility");
+(NSString *)stringForKey:(NSString *)key DEPRECATED_MSG_ATTRIBUTE("Migrate to +unarchiveObject:forKey:");

+(BOOL)setArray:(NSArray *)value forKey:(NSString *)key DEPRECATED_MSG_ATTRIBUTE("Migrate to +archiveObject:forKey:");
+(BOOL)setArray:(NSArray *)value forKey:(NSString *)key accessibility:(CFTypeRef)accessibility DEPRECATED_MSG_ATTRIBUTE("Migrate to +archiveObject:forKey:accesibility");
+(NSArray *)arrayForKey:(NSString *)key DEPRECATED_MSG_ATTRIBUTE("Migrate to +unarchiveObject:forKey:");

+(BOOL)setSet:(NSSet *)value forKey:(NSString *)key DEPRECATED_MSG_ATTRIBUTE("Migrate to +archiveObject:forKey:");
+(BOOL)setSet:(NSSet *)value forKey:(NSString *)key accessibility:(CFTypeRef)accessibility DEPRECATED_MSG_ATTRIBUTE("Migrate to +archiveObject:forKey:accesibility");
+(NSSet *)setForKey:(NSString *)key DEPRECATED_MSG_ATTRIBUTE("Migrate to +unarchiveObject:forKey:");

+(BOOL)setDictionary:(NSDictionary *)value forKey:(NSString *)key DEPRECATED_MSG_ATTRIBUTE("Migrate to +archiveObject:forKey:");
+(BOOL)setDictionary:(NSDictionary *)value forKey:(NSString *)key accessibility:(CFTypeRef)accessibility DEPRECATED_MSG_ATTRIBUTE("Migrate to +archiveObject:forKey:accesibility");
+(NSDictionary *)dictionaryForKey:(NSString *)key DEPRECATED_MSG_ATTRIBUTE("Migrate to +unarchiveObject:forKey:");

+(BOOL)setDate:(NSDate *)value forKey:(NSString *)key DEPRECATED_MSG_ATTRIBUTE("Migrate to +archiveObject:forKey:");
+(BOOL)setDate:(NSDate *)value forKey:(NSString *)key accessibility:(CFTypeRef)accessibility DEPRECATED_MSG_ATTRIBUTE("Migrate to +archiveObject:forKey:accesibility");
+(NSDate *)dateForKey:(NSString *)key DEPRECATED_MSG_ATTRIBUTE("Migrate to +unarchiveObject:forKey:");

@end
