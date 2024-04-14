//
//  APIManager.swift
//  Async_Await_CallAPI
//
//  Created by macOS on 13/04/2024.
//

import Foundation
// Định nghĩa một enum để mô tả các loại lỗi có thể xảy ra khi giao tiếp mạng.
enum networkError: Error {
    case invalidURL // Lỗi khi địa chỉ URL không hợp lệ.
    case invalidReponse // Lỗi khi nhận phản hồi không hợp lệ từ máy chủ.
}

// Định nghĩa lớp APIManager để thực hiện các yêu cầu mạng.
final class APIManager {
    // Định nghĩa một phương thức async để gửi yêu cầu mạng và nhận kết quả.
    func request<T: Decodable>(url: String) async throws -> T {
        // Kiểm tra xem địa chỉ URL được cung cấp có hợp lệ không.
        guard let url = URL(string: url) else {
            throw networkError.invalidURL // Nếu không hợp lệ, ném ra lỗi invalidURL.
        }
        
        // Thực hiện yêu cầu mạng bất đồng bộ và đợi kết quả.
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Kiểm tra xem phản hồi từ máy chủ có hợp lệ không (mã trạng thái 200).
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw networkError.invalidReponse // Nếu không hợp lệ, ném ra lỗi invalidReponse.
        }
        
        // Giải mã dữ liệu nhận được từ phản hồi thành đối tượng kiểu T và trả về.
        return try JSONDecoder().decode(T.self, from: data)
    }
}
