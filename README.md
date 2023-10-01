# The Simple Weather App

### Debug build type

  * Built with optimization off and debug enabled for nice development
  
## Setup the environment

  -  Install latest XCode
  
  -  Add your Apple ID to XCode
  -  Setup provisioning profile
    - create certificates for yourself (iOS App Development)
    
## Architecture

- Main architecture patterns are MVC and MVVM
- MVVM is used for more complex views/features that would benefit from splitting the code into better testable (and usually smaller) components
- MVC is used for small and simple displaying only views -> no extra and boiler plate view model
- Follow most common design patterns and common sense (DRY, SOLID, KISS)

## Configuration

### Local configuration

- Put all URLs/endpoints into `AppConfiguration.swift` file
- Local feature flags are stored in to User Defaults

### Remote configuration

WIP

## Coding conventions

### Base references

- Swift.org: https://www.swift.org/documentation/api-design-guidelines/
- Github: https://github.com/kodecocodes/swift-style-guide

### Other references specificly by the app

- Indent using 4 spaces
- Use SwiftFormat if possible
- Keep method arguments on the same line by default:

```
// preferrred

myFunc(x: 155.0, y: 255.0)

// not preferred

myFunc(x: 155.0,
       y: 255.0)
```

- If there are many and/or long arguments, it's allowed to split them to separate lines and align them to improve readability:

```
showFeedback(title: "something",
             description: "something",
             buttonTitle: "something",
             isSuccess: false)
```

- Commenting (Use Apple recommended markdown style for method/function comments in order to support autocomplete descriptions)

```
  /**
     Description
     */

    func doSomething()
```

## Source structure

- Keep the folder structure matching the xcode project stucture 1-to-1
- Put storyboard files under storyboards folder
- Use feature based structure
- ViewControllers, ViewModels, Models, Views in subfolders under feature folder if large feature (if small feature, no need to use subfolders)
- Services are kept under services folder
- Generic/shared/reusable views under Views folder

### Updating dependencies

  - File -> Packages -> Update to latest Package Versions (update dependencies)
  - Commit your workspace with the changes made by step above
  - Push your canges
  - If problems appear, consider cleaning your workspace
    - `git clean -d -x -f` 
    
### Bump build and version numbers

Be sure to bump versions, otherwise you will need to start again because iTunes Connect
will reject your upload.
   
   - Check from iTunes Connect the last released version and code

### Configure XCode for your build type
   - Provisioning profiles are generated and managed automagically by Xcode. No need to do any manual setup for this.

### Itunes connect

   - My Apps and create VERSION (iOS)
   - Add your version number and wait until the uploaded package is available
   - Submit for review
   - Manual release preferably

### Regional availability

   - It is good idea to first release a new version on some region and then scale up from there
   - Itunes connect / Pricing and Availability / Availability

## Sandbox testing (Apple Pay)

  - Sandbox testing guide: https://developer.apple.com/support/apple-pay-sandbox/
  - There's a dummy apple pay button in debug menu to test out
  - Sandbox credit card needs to be re-added if one logs in and out from the iCould account on device
