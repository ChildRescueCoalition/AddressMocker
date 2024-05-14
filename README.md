# AddressMocker

Support library for Testing and Mocking services.

Created via SPM:
```
swift package init --name AddressMocker
```

## Sample Usage

When testing services, this library becomes useful for consistently returning values based on an IP. For example:

```swift
// This will always return the same Boolean value for the IP, since it's based on a formula/hash.
let inCPS = try AddressMocker(usingIPv4: "127.0.0.1").boolean
```
