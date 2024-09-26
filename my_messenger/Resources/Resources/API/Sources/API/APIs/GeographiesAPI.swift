//
// GeographiesAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class GeographiesAPI {

    /**
     Get recent media from a custom geo-id.
     
     - parameter geoId: (path) The geography ID. 
     - parameter count: (query) Max number of media to return. (optional)
     - parameter minId: (query) Return media before this &#x60;min_id&#x60;. (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @available(*, deprecated, message: "This operation is deprecated.")
    @discardableResult
    open class func geographiesGeoIdMediaRecentGet(geoId: String, count: Int? = nil, minId: String? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: MediaListResponse?, _ error: Error?) -> Void)) -> RequestTask {
        return geographiesGeoIdMediaRecentGetWithRequestBuilder(geoId: geoId, count: count, minId: minId).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get recent media from a custom geo-id.
     - GET /geographies/{geo-id}/media/recent
     - Get recent media from a geography subscription that you created.  **Note:** You can only access Geographies that were explicitly created by your OAuth client. Check the Geography Subscriptions section of the [real-time updates page](https://instagram.com/developer/realtime/). When you create a subscription to some geography that you define, you will be returned a unique `geo-id` that can be used in this query. To backfill photos from the location covered by this geography, use the [media search endpoint](https://instagram.com/developer/endpoints/media/).  **Warning:** [Deprecated](http://instagram.com/developer/changelog/) for Apps created **on or after** Nov 17, 2015 
     - API Key:
       - type: apiKey access_token (QUERY)
       - name: api_key
     - OAuth:
       - type: oauth2
       - name: instagram_auth
     - parameter geoId: (path) The geography ID. 
     - parameter count: (query) Max number of media to return. (optional)
     - parameter minId: (query) Return media before this &#x60;min_id&#x60;. (optional)
     - returns: RequestBuilder<MediaListResponse> 
     */
    @available(*, deprecated, message: "This operation is deprecated.")
    open class func geographiesGeoIdMediaRecentGetWithRequestBuilder(geoId: String, count: Int? = nil, minId: String? = nil) -> RequestBuilder<MediaListResponse> {
        var localVariablePath = "/geographies/{geo-id}/media/recent"
        let geoIdPreEscape = "\(APIHelper.mapValueToPathItem(geoId))"
        let geoIdPostEscape = geoIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{geo-id}", with: geoIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "count": (wrappedValue: count?.encodeToJSON(), isExplode: false),
            "min_id": (wrappedValue: minId?.encodeToJSON(), isExplode: false),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<MediaListResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
}
