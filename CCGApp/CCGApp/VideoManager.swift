//
//  VideoManager.swift
//  CCGApp
//
//  Created by Matheus Nishi on 01/06/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit
import Alamofire

protocol VideoManagerDelegate {
    func dataReady()
}

class VideoManager: NSObject {
    let API_KEY = "AIzaSyBP4-Hta2cRB1mvFCU9WmfAhxA1metDRys"
    let UPLOADS_PLAYLIST_ID = "PLTbbXJzj2Sz3jkSaIFxURr4cRIL0vm7qt"
    
    var videos = [Video]()
    
    var delegate:VideoManagerDelegate?
    
    func getVideos() {
        
        let parameters: Parameters = [
            "part": "snippet",
            "playlistId": UPLOADS_PLAYLIST_ID,
            "key": API_KEY
        ]
        
        Alamofire.request(
            URL(string: "https://www.googleapis.com/youtube/v3/playlistItems")!,
            method: .get,
            parameters: parameters,
            encoding: URLEncoding.default
        )
        .responseJSON { response in
            
            if response.result.error != nil {
                print("\(#function) - \(#line) line - Youtube request error - \(String(describing: response.result.error))")
                return
            }
            
            guard let data = response.result.value as? [String: AnyObject] else {
                print("\(#function) - \(#line) line - Youtube request error")
                return
            }
            
            guard let items = data["items"] as? [[String: AnyObject]] else {
                print("\(#function) - \(#line) line - Youtube request error")
                return
            }
            
            for item in items {
                
                guard let snippet = item["snippet"] as? [String: AnyObject] else {
                    continue
                }
                
                guard let title = snippet["title"] as? String else {
                    continue
                }
                
                guard let description = snippet["description"] as? String else {
                    continue
                }
                guard let thumbnail = snippet["thumbnails"] as? [String: AnyObject] else {
                    continue
                }
                
                guard let resourceId = snippet["resourceId"] as? [String: AnyObject] else {
                    continue
                }
                
                guard let videoId = resourceId["videoId"] as? String, let maxres = thumbnail["maxres"] as? [String: AnyObject] else {
                    continue
                }
                
                guard let thumbnailUrl = maxres["url"] as? String else {
                    continue
                }
                
                let video = Video()
                video.id = videoId
                video.title = title
                video.videoDescription = description
                video.videoThumbnailUrl = thumbnailUrl
                
                self.videos.append(video)
                
                if self.delegate != nil {
                    self.delegate!.dataReady()
                }
            }
                
        }
        
    }
    
}
