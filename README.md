# InjectionTDD

[![CI Status](http://img.shields.io/travis/polac24/InjectionTDD.svg?style=flat)](https://travis-ci.org/polac24/InjectionTDD)
[![Version](https://img.shields.io/cocoapods/v/InjectionTDD.svg?style=flat)](http://cocoapods.org/pods/InjectionTDD)
[![License](https://img.shields.io/cocoapods/l/InjectionTDD.svg?style=flat)](http://cocoapods.org/pods/InjectionTDD)
[![Platform](https://img.shields.io/cocoapods/p/InjectionTDD.svg?style=flat)](http://cocoapods.org/pods/InjectionTDD)

![Swift4](https://img.shields.io/badge/Swift-4.0-brightgreen.svg)
![Swift3.1](https://img.shields.io/badge/Swift-3.1-yellowgreen.svg)

# Synopsis

This library triggers Xcode unit tests using [John Holdsworth](https://github.com/johnno1962)'s [injectionforxcode](https://github.com/johnno1962/injectionforxcode) tool.

InjectionTDD immediatelly runs your related unit tests, every time you save implemntation file with ⌘+S.

![quick](documentation/gifs/quick.gif)


## Swift version

This branch is compatible with `Swift 4` and Xcode 9. For Swift3, checkout branch `swift3`.

## Requirements

* [injectionforxcode](http://johnholdsworth.com/injection.html) (version with TDD)
* implementation and unit test written in **Swift** (project can be mixed ObjC and Swift)
* Xcode 8 or Xcode 9
* valid global Xcode version using `xcode-select`

### Limitations

* no static libraries (`.a` or static `.framework`) used in a target
* testing target has "Host Application"
* ⌘+U required when adding new `.swift` file

![requirement_host_application](documentation/images/requirement_host_application.png).

## Installation

### 1. Ensure that you have correctly set global Xcode (`xcode-select`)

1. Call `xcode-select -p`
2. If path does not correspond to your current Xcode version, setup it using command:

```bash
sudo xcode-select -s /Applications/PATH_TO_YOUR_XCODE_VERSION/Contents/Developer
```

### 2. Integrate `InjectionTDD` with your Xcode project:

### - Integration using CocoaPods

InjectionTDD is available through [CocoaPods](http://cocoapods.org).

To install it, simply add the following line to your `Podfile`, **into Tests target :warning:**:

For Swift 4:

```ruby
...
  target 'REMTTests' do
    # Your test Pods
  
    pod 'InjectionTDD', '~> 0.4'
  end
```

For Swift 3:

```ruby
...
  target 'REMTTests' do
    # Your test Pods

    pod 'InjectionTDD', '~> 0.3'
  end
```

### - Integration compiled  `.framework`

Add binary framework to your test target. You can find compiled framework (`InjectionTDD.framework.zip`) in [releases section](https://github.com/polac24/InjectionTDD/releases).

You can find sample integration on [one approach to integrate binary framework](documentation/Integrate_binary.md).

## How to use it?

1. After successful  `InjectionTDD` integration with your test target (step 2.), run it (⌘+U) and you will see prompt `Ready for InjectionTDD...`

![prompt](documentation/images/prompt.png)

2. It means that your unit tests wait for injection bundles and will never terminate :white_check_mark:
3. Using [injectionforxcode](https://github.com/johnno1962/injectionforxcode), inject your implementation (e.g. shortcut **⌃+=**)
4. injectionforxcode automatically finds all related tests for your file and execute them
5. On output console you will see summary of all actions and summary of your tests :tada:

![result](documentation/images/result.png)

![overview](documentation/gifs/overview.gif)

6. To get feedback immediatelly after each save with ⌘+S, enable "FileWatcher" in injectionforxcode:

![file_watcher](documentation/images/file_watcher.png)

## Test Summary Notification

To display notification everytime your test finishes, install extra breakpoints that present a summary of your test suite:

![Success](documentation/images/notification_success.png)

![Failure](documentation/images/notification_failure.png)


### Summary notifications installation:

**:warning: Remeber to install breakpoints when Xcode is closed, otherwise new breakpoints may not be added**

#### - When using CocoaPods (source available)

```bash
curl https://codeload.github.com/polac24/InjectionTDD/tar.gz/master | tar -xz --strip=3 InjectionTDD-master/scripts/update_breakpoints_source/
./update_breakpoints_source.sh
```

#### - When using `.framework` (no source available)

```bash
curl https://codeload.github.com/polac24/InjectionTDD/tar.gz/master | tar -xz --strip=3 InjectionTDD-master/scripts/update_breakpoints_binary/
./update_breakpoints_binary.sh
```

#### - Simple notification for both CocoaPods & `.framework`

You can also install notification that do not provide any details and therefore can be used with both scenarios (with or without sources):

![Success](documentation/images/notification_success_generic.png)

![Failure](documentation/images/notification_failure_generic.png)

```bash
curl https://codeload.github.com/polac24/InjectionTDD/tar.gz/master | tar -xz --strip=3 InjectionTDD-master/scripts/update_breakpoints_generic/
./update_breakpoints_generic.sh
```

## Recommendations

* If you want to speed up your injection, disable code coverage. Just unselect "Gather coverage data" in your test scheme when doing TDD: ![no_coverage](documentation/images/no_coverage.png)


## Author

Bartosz Polaczyk, polac24@gmail.com

## Credits

This library is an addition to [John Holdsworth](https://github.com/johnno1962) great tool [injectionforxcode](https://github.com/johnno1962/injectionforxcode). More details about live code injection you will find at [Injection, the App](http://johnholdsworth.com/injection.html) and [@Orta](https://twitter.com/@orta) [video post](http://artsy.github.io/blog/2016/03/05/iOS-Code-Injection/).

## License

InjectionTDD is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
