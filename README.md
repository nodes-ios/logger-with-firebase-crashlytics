# Logger with Firebase Crashyltics

This is an extension of our Swift logging package for use with the pointfree swift-dependencies library that includes Firebase Crashlytics support. 

[Please see the readme of that package to find core documentation.](https://github.com/nodes-ios/logger)


## Adding the Firebase Logging Service

You can add the firebase logging service to the dependency like shown below. This should be done at app launch as early as possible but after Firebase has been started. It is important to note that it is still up to you to configure and run Firebase within your project. If you do not, the logger framework will not capture any logs for Firebase.

 You can provide a minimum log level for events that should be sent to Firebase. If you do not, it will default to `error`.
 
```
// Adding Firebase Service Client to Logger
logger.addLogClient(.firebase(minLevel: .debug))
```
