//
//  RootViewController.swift
//  Weather
//
//  Created by Matt Deuschle on 5/12/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    var weatherArray = [Weather]()
    var weatherDic = [JSON]()

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self

        downloadApi(34.07, lon: -118.4) {
            
        }

    }

    func downloadApi(lat: Double, lon: Double, download: Downloadcomplete) {

//        let url = "http://api.openweathermap.org/data/2.5/find?lat=34.07&lon=-118.4&cnt=10&appid=410f10b49176eef3db7a6fe196ec891c"

        let url = "\(baseUrl)\(lat)&lon=\(lon)&cnt=10&appid=\(apiKey)"
        Alamofire.request(.GET, url).responseJSON { response in

            if let value = response.result.value {

                let json = JSON(value)
                self.weatherDic = json["list"].arrayValue

                for dic in self.weatherDic {

                    let weatherObject = Weather(json: dic)
                    self.weatherArray.append(weatherObject)
                    print(self.weatherArray.debugDescription)
                }
            }
        }

    }



    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
