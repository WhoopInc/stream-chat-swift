//
// Copyright © 2023 Stream.io Inc. All rights reserved.
//

import XCTest

@available(iOS 15.0, *)
class ScrollTime: StreamTestCase {
    
    func testMessageList() {
        WHEN("user opens the message list") {
            backendRobot.generateChannels(count: 1, messagesCount: 200)
            userRobot.login().openChannel()
        }
        THEN("user scrolls the message list") {
            let measureOptions = XCTMeasureOptions()
            measureOptions.invocationOptions = [.manuallyStop]
            measure(metrics: [XCTOSSignpostMetric.scrollingAndDecelerationMetric], options: measureOptions) {
                userRobot.scrollMessageListUp()
                stopMeasuring()
            }
        }
    }
    
    func testChannelList() {
        WHEN("user opens the channel list") {
            backendRobot.generateChannels(count: 200)
            userRobot.login().waitForChannelListToLoad()
        }
        THEN("user scrolls the channel list") {
            let measureOptions = XCTMeasureOptions()
            measureOptions.invocationOptions = [.manuallyStop]
            measure(metrics: [XCTOSSignpostMetric.scrollingAndDecelerationMetric], options: measureOptions) {
                userRobot.scrollChannelListDown()
                stopMeasuring()
            }
        }
    }
}
