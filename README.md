# TestChanel
This project has the ambition to show my capabilities to develop an iOS iPhone Weather application.
The first view show current weather in several cities in France (Paris, Lyon, Marseille, Bordeaux,Toulouse, Nantes).
And the details as forecast for 5 days with data every 3 hours, of every cities is available by tap on the selected city.
Used of https://openweathermap.org/api.

## Prerequisite
You need to install the last Xcode from Apple Store, and Cocoapods.

## How to install it
After download this project. You don't need to install something else. This project used cocoapods dependency manager. But I included the pod repository to simplified the installation.

## How to Use
To open the project, double click to TestChanel.xcworkspace file, Xcode will be launch. After you can run the project and test it on a simulator.

## Artichecture
The architecture is a classical MVP architecture.
The ViewControllers has a responsability to show the view, contains no data.
The ViewControllers ask to the Presenters all informations needed.
The Presenters used the Alamofire API to get the data for the Openweathermap API and delivers it to the ViewControllers.

I choose this architecture because it is sufficient for the need of this little project...

## Test
I used XCTest for the test of the project, and I have 83,2% of code coverage.

## Scheme
I have 2 schemes: 
- TestChanel for the PRODUCTION version
The app name is TestChanel.
The Bundle identifier is com.yas.TestChanel

- TestChanel-dev for the DEVELOPMENT version
The app name is TestChanel-dev.
The DEVELOPMENT version has the DEVELOPMENT flag.
The Bundle identifier is com.yas.TestChanel-dev
