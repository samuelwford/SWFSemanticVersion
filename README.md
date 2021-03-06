# SWFSemanticVersion

[![Version](http://cocoapod-badges.herokuapp.com/v/SWFSemanticVersion/badge.png)](http://cocoadocs.org/docsets/SWFSemanticVersion)
[![Platform](http://cocoapod-badges.herokuapp.com/p/SWFSemanticVersion/badge.png)](http://cocoadocs.org/docsets/SWFSemanticVersion)

A port of the semantic version value class from the [semantic Ruby gem](https://github.com/jlindsey/semantic) that implements the [SemVer](http://semver.org) versioning scheme.

## Usage

To run the example project; clone the repo, build and run with Xcode. The sample is an iOS app that you can type two semantic version strings into and display the comparison result.

### Creating a Semantic Version

The `SWFSemanticVersion` class parses a string in the format defined by the standard and produces an immutable value object from it. If the version string can't be parsed it returns `nil`.

Instances can be compared and follow the rules defined by the standard. Specifically, major > minor > patch. Pre-release < release, but two pre-release suffixes are compared lexically and numerically. Build suffixes are ignored for comparison.

For example:

* 1.0.0 < 2.0.0 < 2.1.0 < 2.1.1
* 1.0.0-alpha < 1.0.0-alpha.1 < 1.0.0-alpha.beta < 1.0.0-beta < 1.0.0-beta.2 < 1.0.0-beta.11 < 1.0.0-rc.1 < 1.0.0

Create from a string (will return a nil if the string isn't parseable):

```objc
SWFSemanticVersion *semVer = [SWFSemanticVersion semanticVersionWithString:@"0.1.0"];
```

Or create manually:

```objc
SWFSemanticVersion *semVer = [[SWFSemanticVersion alloc] initWithMajor:@(0) minor:@(0) patch:@(0) pre:nil build:nil];
```

## Installation

SWFSemanticVersion is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "SWFSemanticVersion"

## Author

Samuel Ford, samuel.ford@icloud.com

### Acknowledgements

* [Mikael Barlett](https://github.com/samuelwford/SWFSemanticVersion/pull/1)
* [Will Lisac](https://github.com/samuelwford/SWFSemanticVersion/pull/2)

## License

SWFSemanticVersion is available under the MIT license. See the LICENSE file for more info.

