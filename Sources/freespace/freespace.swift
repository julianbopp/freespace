import Foundation

@main
public struct freespace {

    public static func main() {
        let fileURL = URL(fileURLWithPath:"/")
        do {
            let values = try fileURL.resourceValues(forKeys: [.volumeAvailableCapacityKey])
            /* 
            Description of keys from Apple:

            ------------------------------------------------------------------------    
            static let volumeAvailableCapacityKey: URLResourceKey
                Key for the volume’s available capacity in bytes (read-only).
            static let volumeAvailableCapacityForImportantUsageKey: URLResourceKey
                Key for the volume’s available capacity in bytes for storing important resources (read-only).
            static let volumeAvailableCapacityForOpportunisticUsageKey: URLResourceKey
                Key for the volume’s available capacity in bytes for storing nonessential resources (read-only).
            static let volumeTotalCapacityKey: URLResourceKey
                Key for the volume’s total capacity in bytes (read-only).
            ------------------------------------------------------------------------    

            In relation to Available/purgeable which macOS shows in info right click menu of the volume:
            volumeAvailableCapacity -- Available disk space without purgeable
            volumeAvailableCapacityForImportantUsage -- Available disk space + purgeable space
            */
            if let capacity = values.volumeAvailableCapacity{
                print("Available capacity: \(capacity)")
            } else {
                print("Capacity is unavailable")
            }
        } catch {
            print("Error retrieving capacity: \(error.localizedDescription)")
        }
    }
}
