cmake_minimum_required(VERSION 3.14.0)
set(CMAKE_OSX_DEPLOYMENT_TARGET 10.13 CACHE STRING "")

set(vst3sdk_SOURCE_DIR "C:/Users/julia/.Datenablage/julian/.Uni/LVA/2. Semester/MMS/Projekt/VST_SDK/vst3sdk")
if(NOT vst3sdk_SOURCE_DIR)
    message(FATAL_ERROR "Path to VST3 SDK is empty!")
endif()

project(MMS_SynthesizerPlugin
    # This is your plug-in version number. Change it here only.
    # Version number symbols usable in C++ can be found in
    # source/version.h and ${PROJECT_BINARY_DIR}/projectversion.h.
    VERSION 1.0.0.0 
    DESCRIPTION "MMS_SynthesizerPlugin VST 3 Plug-in"
)

set(SMTG_VSTGUI_ROOT "${vst3sdk_SOURCE_DIR}")

add_subdirectory(${vst3sdk_SOURCE_DIR} ${PROJECT_BINARY_DIR}/vst3sdk)
smtg_enable_vst3_sdk()

smtg_add_vst3plugin(MMS_SynthesizerPlugin
    source/version.h
    source/myplugincids.h
    source/mypluginprocessor.h
    source/mypluginprocessor.cpp
    source/myplugincontroller.h
    source/myplugincontroller.cpp
    source/mypluginentry.cpp
)

#- VSTGUI Wanted ----
if(SMTG_ADD_VSTGUI)
    target_sources(MMS_SynthesizerPlugin
        PRIVATE
            resource/myplugineditor.uidesc
    )
    target_link_libraries(MMS_SynthesizerPlugin
        PRIVATE
            vstgui_support
    )
    smtg_target_add_plugin_resources(MMS_SynthesizerPlugin
        RESOURCES
            "resource/myplugineditor.uidesc"
    )
endif(SMTG_ADD_VSTGUI)
# -------------------

smtg_target_add_plugin_snapshots (MMS_SynthesizerPlugin
    RESOURCES
        resource/52E2328BFAD3526A9814E5775EEEB7A4_snapshot.png
        resource/52E2328BFAD3526A9814E5775EEEB7A4_snapshot_2.0x.png
)

target_link_libraries(MMS_SynthesizerPlugin
    PRIVATE
        sdk
)

smtg_target_configure_version_file(MMS_SynthesizerPlugin)

if(SMTG_MAC)
    smtg_target_set_bundle(MMS_SynthesizerPlugin
        BUNDLE_IDENTIFIER net.mms.synthesizerPlugin
        COMPANY_NAME "MMS SynthesizerPlugin"
    )
    smtg_target_set_debug_executable(MMS_SynthesizerPlugin
        "/Applications/VST3PluginTestHost.app"
        "--pluginfolder;$(BUILT_PRODUCTS_DIR)"
    )
elseif(SMTG_WIN)
    target_sources(MMS_SynthesizerPlugin PRIVATE 
        resource/win32resource.rc
    )
    if(MSVC)
        set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT MMS_SynthesizerPlugin)

        smtg_target_set_debug_executable(MMS_SynthesizerPlugin
            "$(ProgramW6432)/Steinberg/VST3PluginTestHost/VST3PluginTestHost.exe"
            "--pluginfolder \"$(OutDir)/\""
        )
    endif()
endif(SMTG_MAC)
