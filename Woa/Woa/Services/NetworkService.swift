//
//  NetworkService.swift
//  Woa
//
//  Created by evaklq on 2024-05-03.
//

import Foundation
import Alamofire

final class NetworkService {
    static let shared = NetworkService()
    let customDateFormatter = DateFormatter()
    var currentUser: UserDto?

    private init() {
        customDateFormatter.dateFormat = "yyyy-MM-dd"
    }

    // MARK: - Auth Actions
    func registration(email: String, password: String, completion: @escaping (Result<UserDto, Error>) -> Void) {
        let url = "http://127.0.0.1:7067/auth/registration"
        let params: Parameters = [
            "email": email,
            "password": password
        ]

        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "accept": "*/*",
            "credentials": "include"
        ]

        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).validate().response { response in
            guard let data = response.data else {
                if let error = response.error {
                    completion(.failure(error))
                }
                return
            }

            let decoder = JSONDecoder()
            guard let userDto = try? decoder.decode(UserDto.self, from: data) else {
                completion(.failure(NetworkError.jsonDecoderError))
                return
            }
            
            self.currentUser = userDto
            completion(.success(userDto))
        }
    }

    func authorize(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let url = "http://127.0.0.1:5038/auth/authorize"
        let params: Parameters = [
            "email": email,
            "password": password
        ]

        let headers: HTTPHeaders = [
            "credentials": "include"
        ]

        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).validate().response { response in
            guard let data = response.data else {
                if let error = response.error {
                    completion(.failure(error))
                }
                return
            }

            completion(.success(true))
        }
    }
}

// MARK: - User Role Actions
extension NetworkService {
    func updateRole(with authorDto: AuthorDto, locationId: Int, completion: @escaping (Result<Bool, Error>) -> Void) {
        let url = "http://127.0.0.1:5038/users/updateRole"
        let deathDate = authorDto.deathDate
        var deathString: String? = nil

        if deathDate != nil {
            deathString = customDateFormatter.string(from: authorDto.deathDate ?? Date())
        }

        let params: Parameters = [
            "firstName": "authorDto.firstName",
            "lastName": "authorDto.lastName",
            "biography": "authorDto.biography",
            "birthDate": customDateFormatter.string(from: authorDto.birthDate),
            "deathDate": deathString ?? "null",
            "locationId": locationId
        ]

        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "credentials": "include"
        ]

        AF.request(url, method: .patch, parameters: params, encoding: JSONEncoding.default, headers: headers).validate().response { response in
            guard let data = response.data else {
                if let error = response.error {
                    completion(.failure(error))
                }
                return
            }

            completion(.success(true))
        }
    }
}

// MARK: - Locations Actions
extension NetworkService {
    func createLocation(with locationDto: LocationDto, completion: @escaping (Result<Int, Error>) -> Void) {
        let url = "http://127.0.0.1:5038/locations/createLocation"
        let params: Parameters = [
            "country": locationDto.country,
            "city": locationDto.city,
            "address": locationDto.address ?? "null"
        ]

        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]

        AF.request(url, method: .post, parameters: params, headers: headers).validate().response { response in
            guard let data = response.data else {
                if let error = response.error {
                    completion(.failure(error))
                }
                return
            }

            let decoder = JSONDecoder()
            guard let id = try? decoder.decode(Int.self, from: data) else {
                completion(.failure(NetworkError.jsonDecoderError))
                return
            }

            completion(.success(id))
        }
    }
}

// MARK: - Images Actions
extension NetworkService {
    func getImageLink(with image: UIImage, name: String?, completion: @escaping (Result<String, Error>) -> Void) {
        let url = "http://127.0.0.1:5038/images/getLink"
        let data = getData(with: image)
        let params: Parameters = [
            "imageData": data
        ]

        AF.request(url, method: .post, parameters: params).validate().response { response in
            guard let data = response.data else {
                if let error = response.error {
                    completion(.failure(error))
                }
                return
            }

            let decoder = JSONDecoder()
            guard let stringLink = try? decoder.decode(String.self, from: data) else {
                completion(.failure(NetworkError.jsonDecoderError))
                return
            }

            completion(.success(stringLink))
        }
    }

    func getImage(link: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        AF.request(link, method: .get).validate().response { response in
            guard let data = response.data else {
                if let error = response.error {
                    completion(.failure(error))
                }
                return
            }

            let image = UIImage(data: data) ?? UIImage()

            completion(.success(image))
        }
    }
}

// MARK: - Arts Actions
extension NetworkService {
    func getArtsByType(type: ArtType, completion: @escaping (Result<[Art], Error>) -> Void) {
        let url = "http://127.0.0.1:5038/arts/" + type.rawValue + "s"

        AF.request(url, method: .get).validate().response {[weak self] response in
            guard let self = self else { return }
            guard let data = response.data else {
                if let error = response.error {
                    completion(.failure(error))
                }
                return
            }

            var artsDto: [ArtDto] = []

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(self.customDateFormatter)
            do {
                artsDto = try decoder.decode([ArtDto].self, from: data)
            } catch {
                completion(.failure(error))
            }

            self.configureArts(arts: artsDto, completion: { arts in
                completion(.success(arts))
            })
        }
    }

    func createArt(completion: @escaping (Result<Bool, Error>) -> Void) {
        let url = "http://127.0.0.1:5038/arts/author/create"

        let params: Parameters = [
              "isSelling": true,
              "title": "string",
              "rating": 0,
              "cost": 0,
              "description": "string",
              "dateCreated": "2024-05-08",
              "artCategory": 0,
              "author": [
                "firstName": "string",
                "lastName": "string",
                "biography": "string",
                "birthDate": "2024-05-08T10:48:15.571Z",
                "deathDate": "2024-05-08T10:48:15.571Z",
                "locationId": 0
              ],
              "location": [
                "country": "string",
                "city": "string",
                "address": "string"
              ],
              "images": [ "imageLink": "https://i.ibb.co/Cnps6w7/Guernica-1.jpg" ],
              "tags": [ "tag": "string"]
        ]

        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]

        AF.request(url, method: .post, parameters: params, headers: headers).validate().response { response in
            guard let data = response.data else {
                if let error = response.error {
                    completion(.failure(error))
                }
                return
            }

            completion(.success(true))
        }
    }

    func getPopularArts(amount: Int?, completion: @escaping (Result<[Art], Error>) -> Void) {
        let currentAmount = amount ?? 0
        let url = "http://127.0.0.1:5038/arts/popular/" + currentAmount.description

        AF.request(url, method: .get).validate().response {[weak self] response in
            guard let self = self else { return }
            guard let data = response.data else {
                if let error = response.error {
                    completion(.failure(error))
                }
                return
            }

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(self.customDateFormatter)
            var artsDto: [ArtDto] = []
            do {
                artsDto = try decoder.decode([ArtDto].self, from: data)
            } catch {
                completion(.failure(error))
            }

            self.configureArts(arts: artsDto, completion: { arts in
                completion(.success(arts))
            })
        }
    }
}

private extension NetworkService {
    func getData(with image: UIImage) -> String {
        guard let imageData = image.pngData() else { return "" }
        let base64String = imageData.base64EncodedString()

        return base64String
    }

    func configureArts(arts: [ArtDto], completion: @escaping ([Art]) -> Void) {
        let notSellArtDtos = arts.filter { !$0.isSelling }
        var result: [Art] = []
        let group = DispatchGroup()

        for artDto in notSellArtDtos {
            if let imageDto = artDto.images.first {
                group.enter()
                getImageFromDto(imageDto: imageDto) { [weak self] image in
                    defer { group.leave() }
                    guard let self = self else { return }
                    let artType = self.getArtType(artDto.artCategory)
                    let year = self.getYear(date: artDto.dateCreated)
                    let art = Art(
                        type: artType,
                        images: [image],
                        name: artDto.title,
                        year: year,
                        isLike: false,
                        isInCart: false,
                        cost: artDto.cost,
                        isSelling: false,
                        isSelled: false
                    )
                    result.append(art)
                }
            }
        }

        group.notify(queue: .main) {
            completion(result)
        }
    }

    func getArtType(_ category: ArtCategoryDto) -> ArtType {
        switch category {
        case .picture:
            return ArtType.picture
        case .sculpture:
            return ArtType.sculpture
        case .photo:
            return ArtType.photo
        case .graphics:
            return ArtType.graphic
        case .artObject:
            return ArtType.artObject
        }
    }

    func getImageFromDto(imageDto: ImageDto?, completion: @escaping (UIImage) -> Void) {
        getImage(link: imageDto?.imageLink ?? "") { result in
            switch result {
            case .success(let image):
                completion(image)
            case .failure:
                completion(UIImage())
            }
        }
    }

    func getYear(date: Date?) -> Int? {
        guard let date = date else { return nil }
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        return year
    }
}
