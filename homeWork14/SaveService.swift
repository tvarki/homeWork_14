//
//  SaveService.swift
//  homeWork14
//
//  Created by Дмитрий Яковлев on 24.12.2019.
//  Copyright © 2019 Дмитрий Яковлев. All rights reserved.
//

import Foundation


// MARK: - class for all work
class SaveService{
    
    
    let fileManager = FileManager()
    let tempDir = NSTemporaryDirectory()
    let fileName = "file.txt"
    
    // MARK: - writeToUserDefaults

    func writeToUserDefaults(str : String, key: String) {
        UserDefaults.standard.set(str, forKey: key)
    }
    
    // MARK: - getFromUserDefaults
    func getFromUserDefaults(key: String) -> String?{
        guard let a  = UserDefaults.standard.object(forKey: key) as? String
            else { return nil }
        return a
    }
    
    func checkDirectory() -> String? {
        do {
            let filesInDirectory = try fileManager.contentsOfDirectory(atPath: tempDir)
            
            let files = filesInDirectory
            if files.count > 0 {
                if files.first == fileName {
                    print("file.txt found")
                    return files.first
                } else {
                    print("File not found")
                    return nil
                }
            }
        } catch let error as NSError {
            print(error)
        }
        return nil
    }
    
    // MARK: - saveToFile
    func saveToFile(content : NameTelephone) {
        let path = (tempDir as NSString).appendingPathComponent(fileName)
        guard let contentsOfFile = try? JSONEncoder().encode(content) else {return}
        // Записываем в файл
        do {
            try (contentsOfFile).write(to: URL(fileURLWithPath: path))
            print("File text.txt created at temp directory")
        } catch let error as NSError {
            print("could't create file text.txt because of error: \(error)")
        }
    }
    
    // MARK: - readFromFile

    func readFromFile() -> NameTelephone?{
        // Читаем
        let directoryWithFiles = checkDirectory() ?? "Empty"
        
        let path = (tempDir as NSString).appendingPathComponent(directoryWithFiles)
        
        let file: FileHandle? = FileHandle(forReadingAtPath: path)
        let data = file?.readDataToEndOfFile()
        file?.closeFile()
        guard data != nil else{return nil}
        let contentsOfFile = try? JSONDecoder().decode(NameTelephone.self, from: data!)
        return contentsOfFile
        
    }
    
}
