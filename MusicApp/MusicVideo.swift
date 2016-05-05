//
//  MusicVideo.swift
//  MusicApp
//
//  Created by Grants Office on 5/3/16.
//  Copyright © 2016 Grants Office. All rights reserved.
//

import Foundation

class Videos {
    
    private var _vName:String
    private var _vRights:String
    private var _vPrice:String
    private var _vImageUrl:String
    private var _vArtist:String
    private var _vVideoUrl:String
    private var _vImid:String
    private var _vGenre:String
    private var _vLinkToiTunes:String
    private var _vReleaseDte:String
     var _vRank = 0
    
    var vImageData:NSData?
    
    var vName: String {
        return _vName
    }
    
    var vRights: String {
        return _vRights
    }
    
    var vPrice: String {
        return _vPrice
    }
    
    var vImageUrl: String {
        return _vImageUrl
    }
    
    var vArtist: String {
        return _vArtist
    }
    
    var vVideoUrl: String {
        return _vVideoUrl
    }
    
    var vImid: String {
        return _vImid
    }
    
    var vGenre: String {
        return _vGenre
    }
    
    var vLinkToiTunes: String {
        return _vLinkToiTunes
    }
    
    var vReleaseDte: String {
        return _vReleaseDte
    }
    
    
    
    init(data: JSONDictionary) {
        
        if let name = data["im:name"] as? JSONDictionary, vName = name["label"] as? String {
            self._vName = vName
        } else {
            _vName = ""
        }
        
        if let rights = data["rights"] as? JSONDictionary, label = rights["label"] as? String {
            self._vRights = label
        } else {
            _vRights = ""
        }
        
        if let price = data["im:price"] as? JSONDictionary, label = price["label"] as? String {
            self._vPrice = label
        } else {
            _vPrice = ""
        }
        
        if let img = data["im:image"] as? JSONArray, image = img[2] as? JSONDictionary, immage = image["label"] as? String {
            self._vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
        } else {
            _vImageUrl = ""
        }
        
        if let artist = data["im:artist"] as? JSONDictionary, label = artist["label"] as? String {
            self._vArtist = label
        } else {
            _vArtist = ""
        }
        
        if let video = data["link"] as? JSONArray, vUrl = video[1] as? JSONDictionary,
            vHref = vUrl["attributes"] as? JSONDictionary, vVideoUrl = vHref["href"] as? String {
            self._vVideoUrl = vVideoUrl
        } else {
            _vVideoUrl = ""
        }
        
        if let id = data["id"] as? JSONDictionary, attributes = id["attributes"] as? JSONDictionary,
            imId = attributes["im:id"] as? String {
            self._vImid = imId
        } else {
            _vImid = ""
        }
        
        if let category = data["category"] as? JSONDictionary,
        attributes = category["attributes"] as? JSONDictionary,
            term = attributes["term"] as? String {
            self._vGenre = term
        } else {
            _vGenre = ""
        }
        
        if let release = data["id"] as? JSONDictionary, linkToiTunes = release["label"] as? String {
            self._vLinkToiTunes = linkToiTunes
        } else {
            _vLinkToiTunes = ""
        }
        
        if let releaseData = data["im:releaseDate"] as? JSONDictionary,
        rel2 = releaseData["attributes"] as? JSONDictionary,
            label = rel2["label"] as? String {
            self._vReleaseDte = label
        } else {
            self._vReleaseDte = ""
        }
        
        
    }
    
    
}