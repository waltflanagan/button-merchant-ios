/**

 PostInstallBodyTests.swift

 Copyright © 2018 Button, Inc. All rights reserved. (https://usebutton.com)

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.

*/

import XCTest
@testable import ButtonMerchant

class PostInstallBodyTests: XCTestCase {

    func testInitialization() {
        let signals = Signals(system: TestSystem())
        let body = PostInstallBody(applicationId: "app-abc123",
                                   ifa: "000-000-000",
                                   ifaLimited: true,
                                   signals: signals)
        XCTAssertEqual(body.applicationId, "app-abc123")
        XCTAssertEqual(body.ifa, "000-000-000")
        XCTAssertTrue(body.ifaLimited)
        XCTAssertEqual(body.signals, signals)
    }

    func testSerializationToDictionary() {
        let signals = Signals(system: TestSystem())
        let body = PostInstallBody(applicationId: "app-abc123",
                                   ifa: "000-000-000",
                                   ifaLimited: true,
                                   signals: signals)

        XCTAssertEqual(body.dictionaryRepresentation as NSDictionary, ["application_id": "app-abc123",
                                                                       "ifa": "000-000-000",
                                                                       "ifa_limited": true,
                                                                       "signals": ["source": "button-merchant",
                                                                                   "os": "ios",
                                                                                   "os_version": "11.0",
                                                                                   "device": "iPhone",
                                                                                   "country": "US",
                                                                                   "language": "en",
                                                                                   "screen": "1080x1920"]])
    }
}