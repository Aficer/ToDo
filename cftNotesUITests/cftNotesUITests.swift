//
//  cftNotesUITests.swift
//  cftNotesUITests
//
//  Created by Вадим Эфис on 31.01.2023.
//

import XCTest

class cftNotesUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        app.terminate()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {

        //проверяем 1 вью
        //Находим NaviganionBar, проверяем наличие
        let todoNavigationBar = app.navigationBars["ToDo 👩‍💻"]
        XCTAssertTrue(todoNavigationBar.exists)
        //нажимаем на кнопку  Edit, проверяем наличие кнопки Done
        app.navigationBars["ToDo 👩‍💻"].buttons["Edit"].tap()
        let doneButton = app.buttons["Done"]
        XCTAssertTrue(doneButton.exists)
        app.navigationBars["ToDo 👩‍💻"].buttons["Done"].tap()
        //Ищем и проверяем кнопку Добавить
        let addButton = app.buttons["Добавить"]
        XCTAssertTrue(addButton.exists)
        //Переходим на AddView и проверяем наличие кнопки сохранить
        app.navigationBars["ToDo 👩‍💻"].buttons["Добавить"].tap()
        let button1 = app.buttons["СОХРАНИТЬ"]
        XCTAssertTrue(button1.exists)
        //Находим textField проверяем его и нажимаем сохранить - ожидаем увидеть alert
        let textField1 = app.scrollViews["Добавить заметку"].otherElements.textFields["Напиши что нибудь..."]
        XCTAssertTrue(textField1.exists)
        app.buttons["СОХРАНИТЬ"].tap()
        //Проверяем наличие alerta
        let alert = app.alerts["Нужно больше букв!"]
        XCTAssertTrue(alert.exists)
        app.buttons["OK"].tap()
        
        


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
