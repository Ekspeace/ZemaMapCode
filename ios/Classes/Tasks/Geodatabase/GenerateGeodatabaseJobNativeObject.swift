//
// Created by Valentin Grigorean on 29.07.2022.
//

import Foundation
import ArcGIS

class GenerateGeodatabaseJobNativeObject: BaseNativeObject<GenerateGeodatabaseJob> {
    init(objectId: String, job: GenerateGeodatabaseJob, messageSink: NativeMessageSink) {
        super.init(objectId: objectId, nativeObject: job, nativeHandlers: [
            JobNativeHandler(job: job),
        ], messageSink: messageSink)
    }
}
