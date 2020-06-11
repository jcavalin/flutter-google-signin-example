# Google Sign in Example

An example of how to use google sign in with flutter.


## Setup

You have to [change `app/build.gradle` and put your key for your app](https://github.com/jcavalin/flutter-google-signin-example/blob/master/android/app/build.gradle#L50).

```
keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias androiddebugkey
```
<sub>
NOTE: Debug key needs to have androiddebugkey alias
</sub>

------------------------

You can find more details [in this excellent tutorial](https://medium.com/flutter-community/flutter-sign-in-with-google-in-android-without-firebase-a91b977d166f).

This example uses [google_sign_in package](https://pub.dev/packages/google_sign_in).