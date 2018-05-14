# NKAuth

All the authentication apis are contained in the `NKAuth` class. You can register a user to Nooko, authenticate that user, and retrieve its informations.

# Register a user

To register a user you call `[NKAuth registerUserWithName:surname:...]`. The fields, `name`, `surname`, `email` and `password` are required, the otheer are optional. The field `data` is a json string representing additional data that you want to pass when registering the user. It will be returned when retrieving the profile

**Objective-C**:

```
[NKAuth registerUserWithName:@"name"
						 Surname:@"surname"
						   Email:@"email"
					 	Password:@"password"
						   Phone:@"phone"
						   Image:nil
							 Data:nil
						 Success:^{
                             
						 } Failure:^(NSError *error) {
                             
}];
```

**Swift**:

```
NKAuth.registerUser(withName: "name", surname: "surname", email: "email", password: "password", phone: "1234567890", image: nil, data: nil, success: {
            
}, failure: { (error) in
            
})
```

# Authenticate a user

After registeering the user you can authenticate it with its email and password. All the communication with the server is made in https so all the data are encrypted. If the authentication is correct the api will return the access token. This token will be put in the `Authorization` header for all the subsequent call to all the Nooko apis.

**Objective-C**:

```
[NKAuth authenticateUserWithEmail:@"email" Password:@"password" Success:^(NSString *accessToken) {
        
} Failure:^(NSError *error) {
        
}];
```
**Swift**:

```
NKAuth.authenticateUser(withEmail: "email", password: "password", success: { (accessToken) in
            
}, failure: { (error) in
            
})

```

You can see if a user is curreently authenticated with `[NKAuth userIsLoggedIn]`.

If a user is authenticated you can retrieve its access token with `[NKAuth authToken]`.

To logout the current user use `[NKAuth logoutCurrentUser]`.


# Retrieve user informations

You can retrieve the informations of the current user with `[getUserProfileWithSuccess:failure]`. In case of succes it returns a `NKUser` object as a parameter of the success block.

**Objective-C**:

```
[NKAuth getUserProfileWithSuccess:^(NKUser *user) {
        
} Failure:^(NSError *error) {
        
}];
```
**Swift**:

```
NKAuth.getUserProfile(success: { (user) in
            
}, failure: { (error) in
            
})

```
