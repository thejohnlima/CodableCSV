import Foundation

extension CSVReader {
    /// Configuration for how to read CSV data.
    public struct Configuration {
        /// The encoding used to identify the underlying data or `nil` if you want the CSV reader to try to figure it out.
        ///
        /// If no encoding is provided and the input data doesn't contain a Byte Order Marker (BOM), UTF8 is presumed.
        public var encoding: String.Encoding?
        /// The field and row delimiters.
        public var delimiters: Delimiter.Pair
        /// Indication on whether the CSV will contain a header row or not, or that information is unknown and it should try to be inferred.
        public var headerStrategy: Strategy.Header
        /// Indication on whether some characters should be trim at reading time.
        public var trimStrategry: Strategy.Trim
        /// Boolean indicating whether the data/file/string should be completely parsed at reader's initialization.
        ///
        /// Setting this property to `true` samples the data/file/string at initialization time. This process returns some interesting data such as blob/file size, full-file encoding validation, etc.
        /// The *presample* process will however hurt performance since it iterates over all the data in initialization.
        public var presample: Bool
        
        /// Designated initializer setting the default values.
        public init() {
            self.encoding = nil
            self.delimiters = (field: .comma, row: .lineFeed)
            self.headerStrategy = .none
            self.trimStrategry = .none
            self.presample = false
        }
    }
}

extension CSVReader {
    /// Private configuration variables for the CSV reader.
    internal struct Settings {
        /// The unicode scalar delimiters for fields and rows.
        let delimiters: Delimiter.RawPair
        /// Boolean indicating whether the received CSV contains a header row or not.
        let hasHeader: Bool
        /// The characters set to be trimmed at the beginning and ending of each field.
        let trimCharacters: CharacterSet?
        /// The unicode scalar used as encapsulator and escaping character (when printed two times).
        let escapingScalar: Unicode.Scalar = "\""
        
        ///
        init(configuration: Configuration, iterator: ScalarIterator, buffer: ScalarBuffer, headers: inout [String]) throws {
            fatalError()
            
//            var blob = data
//            #warning("The CSVReader should be encoding independing. That is why it must be kept as unicode scalar iterator.")
//            #warning("The BOM detection must happen whether a data blob or a file handle is received")
//            let finalEncoding: String.Encoding
//            switch (encoding, blob.removeBOM()) {
//            case (.none, let e?):  finalEncoding = e
//            case (let e?, .none):  finalEncoding = e; #warning("Match unicode and UTF16 encodings, etc.")
//            case (let p?, let e?) where p==e: finalEncoding = p
//            case (let p?, let e?): throw Error.invalidInput(#"The String encoding provided "\#(p)" doesn't match the Byte Order Mark on the file "\#(e)""#)
//            case (.none,  .none):  throw Error.invalidInput("The String encoding for the data blob couldn't be inferred. Please pass a specific one.")
//            }
        }
        
//        /// Designated initializer taking generic CSV configuration (with possible unknown data) and making it specific to a CSV reader instance and its iterator.
//        /// - parameter configuration: The public CSV reader configuration variables.
//        /// - parameter iterator: Source of the unicode scalar data. Note, that you can only iterate once through it.
//        /// - parameter buffer: Buffer containing all read scalars used to infer not specified information.
//        /// - throws: `CSVReader.Error` exclusively.
//        init(configuration: Configuration, iterator: AnyIterator<Unicode.Scalar>, buffer: ScalarBuffer) throws {
//            switch configuration.trimStrategry {
//            case .none:         self.trimCharacters = nil
//            case .whitespaces:  self.trimCharacters = CharacterSet.whitespaces
//            case .set(let set): self.trimCharacters = (!set.isEmpty) ? set : nil
//            }
//
//            let fieldDelimiter = configuration.delimiters.field.unicodeScalars
//            let rowDelimiter = configuration.delimiters.row.unicodeScalars
//
//            switch (fieldDelimiter, rowDelimiter) {
//            case (let field?, let row?):
//                try Settings.validate(delimiter: field, identifier: "field")
//                try Settings.validate(delimiter: row, identifier: "row")
//                self.delimiters = (field, row)
//            case (nil, let row?):
//                try Settings.validate(delimiter: row, identifier: "row")
//                self.delimiters = try CSVReader.inferFieldDelimiter(iterator: iterator, rowDelimiter: row, buffer: buffer)
//            case (let field?, nil):
//                try Settings.validate(delimiter: field, identifier: "field")
//                self.delimiters = try CSVReader.inferFieldDelimiter(iterator: iterator, rowDelimiter: field, buffer: buffer)
//            case (nil, nil):
//                self.delimiters = try CSVReader.inferDelimiters(iterator: iterator, buffer: buffer)
//            }
//
//            switch configuration.headerStrategy {
//            case .none:      self.hasHeader = false
//            case .firstLine: self.hasHeader = true
//            case .unknown:   self.hasHeader = try CSVReader.inferHeaderStatus(iterator: iterator, buffer: buffer)
//            }
//        }
        
        /// Simple non-empty delimiter validation.
        /// - parameter delimiter: The unicode scalars that forms a given delimiter.
        /// - parameter identifier: String indicating whether the delimiter is a field or a row delimiter.
        /// - throws: `CSVReader.Error.invalidDelimiter` exclusively.
        private static func validate(delimiter: String.UnicodeScalarView, identifier: String) throws {
//            guard !delimiter.isEmpty else {
//                throw Error.invalidDelimiter("Custom \(identifier) delimiters must include at least one unicode scalar.")
//            }
            fatalError()
        }
    }
}

extension CSVReader {
    /// Tries to infer the field delimiter given the row delimiter.
    /// - throws: `CSVReader.Error` exclusively.
    fileprivate static func inferFieldDelimiter(iterator: AnyIterator<Unicode.Scalar>, rowDelimiter: String.UnicodeScalarView, buffer: ScalarBuffer) throws -> Delimiter.RawPair {
        //#warning("TODO:")
        fatalError()
    }
    
    /// Tries to infer the row delimiter given the field delimiter.
    /// - throws: `CSVReader.Error` exclusively.
    fileprivate static func inferRowDelimiter(iterator: AnyIterator<Unicode.Scalar>, fieldDelimiter: String.UnicodeScalarView, buffer: ScalarBuffer) throws -> Delimiter.RawPair {
        //#warning("TODO:")
        fatalError()
    }
    
    /// Tries to infer both the field and row delimiter from the raw data.
    /// - throws: `CSVReader.Error` exclusively.
    fileprivate static func inferDelimiters(iterator: AnyIterator<Unicode.Scalar>, buffer: ScalarBuffer) throws -> Delimiter.RawPair {
        //#warning("TODO:")
        fatalError()
    }
    
    /// Tries to infer whether the CSV data has a header row or not.
    /// - throws: `CSVReader.Error` exclusively.
    fileprivate static func inferHeaderStatus(iterator: AnyIterator<Unicode.Scalar>, buffer: ScalarBuffer) throws -> Bool {
        //#warning("TODO:")
        fatalError()
    }
}
