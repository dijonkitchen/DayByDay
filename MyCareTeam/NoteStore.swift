//
//  NoteStore.swift
//  ElevenNote
//
//  Copyright (c) 2014 ElevenFifty. All rights reserved.
//

import Foundation

class NoteStore {
    // Mark: Singleton Pattern (hacked since we don't have class var's yet)
    class var sharedNoteStore : NoteStore {
    struct Static {
        static let instance : NoteStore = NoteStore()
        }
        return Static.instance
    }
    
    // Private init to force usage of singleton
    private init() {
        load()
    }
    
    // Array to hold our notes
    private var notes : [Note]!
    
    // CRUD - Create, Read, Update, Delete
    
    // Create
    
    func createNote(theNote:Note = Note()) -> Note {
        notes.append(theNote)
        save()
        return theNote
    }
    
    // Read
    
    func getNote(index:Int) -> Note {
        return notes[index]
    }
    
    // Update
    func updateNote(theNote theNote:Note) {
        save()
        // Notes passed by reference, no update code needed
    }
    
    // Delete
    func deleteNote(index:Int) {
        
        notes.removeAtIndex(index)
        save()
    }
    
    func deleteNote(withNote:Note) {
        
        for (i, note) in notes.enumerate() {
            if note === withNote {
                notes.removeAtIndex(i)
                return
            }
        }
        
    }
    
    // Count
    func count() -> Int {
        return notes.count
    }
    
    
    // Mark: Persistence
    
    // 1: Find the file & directory we want to save to...
    func archiveFilePath() -> String {
        
        let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
        let path = DocumentsDirectory.URLByAppendingPathComponent("NoteStore")
        
        return path.path!
    }
    
    // 2: Do the save to disk.....
    func save() {
        NSKeyedArchiver.archiveRootObject(notes, toFile: archiveFilePath())
    }
    
    
    // 3: Do the reload from disk....
    func load() {
        let filePath = archiveFilePath()
        let fileManager = NSFileManager.defaultManager()
        
        if fileManager.fileExistsAtPath(filePath) {
            notes = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as! [Note]
        } else {
            notes = [Note]()
        }
    }
    
}