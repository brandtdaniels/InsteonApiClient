import AuthClient
@testable import InsteonApiClient
import RequestClient
import XCTest

final class InsteonApiClientTests: XCTestCase {

  var apiClient: ApiClient!

  var mockRequestClient: RequestClientProtocol!
  var mockAuthClient: AuthClientProtocol!

  override func setUp() {
    super.setUp()

    mockRequestClient = URLSessionRequestClient(session: URLSession.shared)

    let configuration: AuthConfigurationProtocol = AuthConfiguration(
      clientId: "390ad000-0b74-4d40-910a-9e5f869cf8281515668553.994086099",
      clientSecret: "sbS7ymIipErnh6eEo7q8ZYSBorRwkJb5Qzw8lrJWe2Q=",
      redirectUri: "insteon://",
      state: "1234",
      authorizationEndpoint: "https://connect.insteon.com/api/v2/oauth2/auth",
      tokenEndpoint: "https://connect.insteon.com/api/v2/oauth2/token"
    )
    mockAuthClient = AuthClient(configuration)

    apiClient = ApiClient(mockRequestClient, mockAuthClient)

  }

  func testExample() {

    let expectation = XCTestExpectation(
      description: "Send api request"
    )

    let request = GetRooms(houseId: 45876)

    apiClient.request(request) { result in

      expectation.fulfill()


    }

    wait(for: [expectation], timeout: 10.0)

  }

  static var allTests = [
    ("testExample", testExample),
  ]

}
