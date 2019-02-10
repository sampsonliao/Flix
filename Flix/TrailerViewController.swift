//
//  TrailerViewController.swift
//  Flix
//
//  Created by Sampson Liao on 2/6/19.
//  Copyright © 2019 sliao. All rights reserved.
//

import UIKit
import WebKit
import youtube_ios_player_helper

class TrailerViewController: UIViewController {

    
    
    var movieId: Int!
    var movie = [[String: Any]]()
    var key: String = ""
    
    
    
    @IBOutlet weak var playerView: YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(String(movieId))/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")!

        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                self.movie = dataDictionary["results"] as! [[String: Any]]
                //print(self.movie)
                self.key = self.movie[0]["key"] as! String
                //let myURL = URL(string: "https://www.youtube.com/watch?v=\(key)")
                //let youtubeRequest = URLRequest(url: myURL!)
                self.playerView.load(withVideoId: self.key)
                // videoPlayer.load(youtubeRequest)
                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data
                
            }
        }
        task.resume()

        // Do any additional setup after loading the view.
    }


    @IBAction func pushCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
