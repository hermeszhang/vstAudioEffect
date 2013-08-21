#!/bin/bash

g++ -bundle -o plugin plugin.cpp -arch i386 vstsdk2.4/public.sdk/source/vst2.x/audioeffect.cpp vstsdk2.4/public.sdk/source/vst2.x/audioeffectx.cpp vstsdk2.4/public.sdk/source/vst2.x/vstplugmain.cpp -I vstsdk2.4/public.sdk/source/vst2.x/ -I vstsdk2.4 -w 

echo "<?xml version="1.0" encoding="UTF-8"?>
	  <!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
	  <plist version="1.0">
      <dict>
	  <key>CFBundleDevelopmentRegion</key> <string>English</string> <key>CFBundleExecutable</key> <string>plugin</string> <key>CFBundleIdentifier</key> <string>com.apple.carbonbundletemplate</string> <key>CFBundleInfoDictionaryVersion</key> <string>6.0</string>
      <key>CFBundleName</key> <string>plugin</string> <key>CFBundlePackageType</key> <string>BNDL</string> <key>CFBundleShortVersionString</key> <string>1.0</string> <key>CFBundleSignature</key> <string>????</string> <key>CFBundleVersion</key> <string>1.0</string> <key>CSResourcesFileMapped</key> <true/>
      </dict>
      </plist>" > info.plist 

mkdir plugin.vst
mkdir plugin.vst/Contents
mkdir plugin.vst/Contents/MacOS
cp plugin plugin.vst/Contents/MacOS && cp info.plist plugin.vst/Contents/

echo "BNDL????" > plugin.vst/Contents/PkgInfo

SetFile -a B plugin.vst

echo "Build Succeeded!"
echo "Moving to VST Folder"
cp -r plugin.vst ~/Library/Audio/Plug-Ins/VST/plugin.vst