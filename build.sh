SCHEME=InAppSettingsKitFramework
FRAMEWORK_NAME=InAppSettingsKit
ARCHS=~/Documents/Archives

xcodebuild archive \
-scheme $SCHEME \
-archivePath $ARCHS/macCatalyst.xcarchive \
-sdk macosx \
SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES SUPPORTS_MACCATALYST=YES

#----- Make iOS Simulator archive
xcodebuild archive \
-scheme $SCHEME \
-archivePath $ARCHS/simulator.xcarchive \
-sdk iphonesimulator \
SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

#----- Make iOS device archive
xcodebuild archive \
-scheme $SCHEME \
-archivePath $ARCHS/iosdevice.xcarchive \
-sdk iphoneos \
SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

#----- Make XCFramework
xcodebuild -create-xcframework \
-framework $ARCHS/simulator.xcarchive/Products/@rpath/$FRAMEWORK_NAME.framework \
-framework $ARCHS/iosdevice.xcarchive/Products/@rpath/$FRAMEWORK_NAME.framework \
-framework $ARCHS/macCatalyst.xcarchive/Products/@rpath/$FRAMEWORK_NAME.framework \
-output ~/Documents/$FRAMEWORK_NAME.xcframework
