//
//  GoogleServices.swift
//  XinChao
//
//  Created by Nguyen Quang Manh on 8/12/17.
//  Copyright © 2017 Vinmas. All rights reserved.
//

import UIKit
import Alamofire
//import GoogleMaps
//
//typealias PolyLineCompletion = ([GMSPolyline]?) -> Void
//typealias DistanceCompletion = (String?, String?) -> Void
//
//class GoogleServices: NSObject {
//
//    static func getPolyLine(origin: CLLocationCoordinate2D, destination: CLLocationCoordinate2D, polyLineCompletion: PolyLineCompletion?) {
//        let origin = "\(origin.latitude),\(origin.longitude)"
//        let destination = "\(destination.latitude),\(destination.longitude)"
//
//        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=driving&key=AIzaSyDPAyLo67kxSpDTi-pwdfalbepICsWCj-0"
//
//        Alamofire.request(url).responseJSON { response in
//            guard let json = response.result.value as? NSDictionary else { return }
//            guard let routes = json.object(forKey:"routes") as? [AnyObject] else { return }
//            var polyLines: [GMSPolyline] = []
//            for route in routes {
//                guard let route = route as? NSDictionary else { return }
//                let routeOverviewPolyline = route.object(forKey: "overview_polyline") as? NSDictionary
//                guard let points = routeOverviewPolyline?["points"] as? String else { return }
//                let path = GMSPath.init(fromEncodedPath: points)
//                let polyline = GMSPolyline.init(path: path)
//                polyline.strokeWidth = 5
//                polyline.strokeColor = UIColor.gray
//                polyLines.append(polyline)
//            }
//            polyLineCompletion?(polyLines)
//        }
//    }
//
//    static func getDurationAndDistance(origin: CLLocationCoordinate2D, destination: CLLocationCoordinate2D, distanceCompletion: DistanceCompletion?) {
//        let origin = "\(origin.latitude),\(origin.longitude)"
//        let destination = "\(destination.latitude),\(destination.longitude)"
//
//        let url = "https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=\(origin)&destinations=\(destination)&key=AIzaSyAMobjpExlst_JExDHxY4utoha6RrHGXfU"
//
//        Alamofire.request(url).responseJSON { response in
//
//            guard let json = response.result.value as? NSDictionary else { return }
//
//            let _ = json.object(forKey: "origin_addresses") as? [String]
//            let _ = json.object(forKey: "destination_addresses") as? [String]
//
//            guard let rows = json.object(forKey:"rows") as? [AnyObject] else { return }
//            guard let row = rows.first as? NSDictionary else { return }
//            guard let elements = row.object(forKey: "elements") as? [NSDictionary] else { return }
//
//            guard let distance = elements.first?.object(forKey: "distance") as? NSDictionary else { return }
//            guard let duration = elements.first?.object(forKey: "duration") as? NSDictionary else { return }
//
//            let distanceText = distance.object(forKey: "text") as? String
//            let durationText = duration.object(forKey: "text") as? String
//            distanceCompletion?(distanceText, durationText)
//        }
//    }
//}

