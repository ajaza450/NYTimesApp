

import Foundation

struct Article : Codable,Equatable {
     init(url: String? = nil, id: Int? = nil, source: String? = nil, published_date: String? = nil, updated: String? = nil, section: String? = nil, byline: String? = nil, type: String? = nil, title: String? = nil, abstract: String? = nil, media: [Media]? = nil) {
        self.url = url
        self.id = id
        self.source = source
        self.published_date = published_date
        self.updated = updated
        self.section = section
        self.byline = byline
        self.type = type
        self.title = title
        self.abstract = abstract
        self.media = media
    }
    
	let url : String?
	let id : Int?
	let source : String?
	let published_date : String?
	let updated : String?
	let section : String?
	let byline : String?
	let type : String?
	let title : String?
	let abstract : String?
	
	let media : [Media]?
	

	enum CodingKeys: String, CodingKey {
        case url = "url"
		case id = "id"
		case source = "source"
		case published_date = "published_date"
		case updated = "updated"
		case section = "section"
		case byline = "byline"
		case type = "type"
		case title = "title"
		case abstract = "abstract"
        case media = "media"
		
	}


}
