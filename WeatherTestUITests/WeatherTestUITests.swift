//
//  WeatherTestUITests.swift
//  WeatherTestUITests
//
//  Created by Pratap Singh on 10/12/23.
//

import XCTest

final class WeatherTestUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPullToRefreshMainWeatherView() {
        let firstCell = app.tables.children(matching: .cell).element(boundBy: 0)
        let start = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let finish = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 6))
        start.press(forDuration: 0, thenDragTo: finish)
    }

    func testScrollHourlyWeatherDetail() {
        app.tables.cells.firstMatch.tap()
        let cell = app.tables.children(matching: .cell).element(boundBy: 1)
        cell.swipeLeft()
        cell.swipeLeft()
        cell.swipeLeft()
        cell.tap()
        XCTAssertTrue(cell.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
