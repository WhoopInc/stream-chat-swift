//
// Copyright © 2023 Stream.io Inc. All rights reserved.
//

import XCTest

@available(iOS 13.0, *)
class StartupTime: XCTestCase {
    
    func testPerformance() {
        measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
            XCUIApplication().launch()
        }
    }
}
