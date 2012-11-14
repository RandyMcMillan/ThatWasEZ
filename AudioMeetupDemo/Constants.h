//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//
//

#define VIEWBOUNDS  [[UIScreen mainScreen] bounds]
#define IS_IPAD     (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/*
 *
 *   NSLog(@"InfoDictVersion = %@",
 *   [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleInfoDictionaryVersionKey]);
 *   NSLog(@"Executable = %@",
 *   [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleExecutableKey]);
 *   NSLog(@"Identifier = %@",
 *   [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleIdentifierKey]);
 *   NSLog(@"BundleVersion = %@",
 *   [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey]);
 *   NSLog(@"DevRegion = %@",
 *   [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleDevelopmentRegionKey]);
 *   NSLog(@"NameKey = %@",
 *   [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleNameKey]);
 *   NSLog(@"Localization = %@",
 *   [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleLocalizationsKey]);
 *
 *   NSDictionary *appInfo = [[NSBundle mainBundle] infoDictionary];
 *   NSString *versionStr = [NSString stringWithFormat:@"build (%@)",
 *   [appInfo objectForKey:@"GitTag"]];
 *
 */

#define INFODICTVERSION [[[NSBundle mainBundle] infoDictionary] objectForKey : (NSString *)kCFBundleInfoDictionaryVersionKey]
#define BUNDLEVERSION   [[[NSBundle mainBundle] infoDictionary] objectForKey : (NSString *)kCFBundleVersionKey]
#define DEVREGION       [[[NSBundle mainBundle] infoDictionary] objectForKey : (NSString *)kCFBundleDevelopmentRegionKey]
#define NAMEKEY         [[[NSBundle mainBundle] infoDictionary] objectForKey : (NSString *)kCFBundleNameKey]
#define LOCALIZATION    [[[NSBundle mainBundle] infoDictionary] objectForKey : (NSString *)kCFBundleLocalizationsKey]

#define APPINFO         [[NSBundle mainBundle] infoDictionary]

/*  Add Write GitVersion to your Build Phases
 *
 *   infoplist="$BUILT_PRODUCTS_DIR/$INFOPLIST_PATH"
 *   gittag="$(cd "$SRCROOT" && git describe --always --abbrev=0)"
 *   if [[ -n "$gittag" ]]; then
 *   defaults write "${infoplist%.plist}" GitTag "$gittag"
 *   fi
 *
 */

#define VERSIONSTRING [NSString stringWithFormat : @ "build (%@)", [APPINFO objectForKey : @ "GitTag"]]

/*
 *
 *   NSString *versionStr = VERSIONSTRING;
 *   NSLog(@"GitVersion = %@",versionStr);
 *
 */



#define MINIMUM_SCALE 1.0f
#define MAXIMUM_SCALE 4.0f
#define ZOOM_STEP 1.5

