//------------------------------------------------------------------------
// Copyright(c) 2023 MMS SynthesizerPlugin.
//------------------------------------------------------------------------

#pragma once

#include "pluginterfaces/base/funknown.h"
#include "pluginterfaces/vst/vsttypes.h"

namespace MyCompanyName {
//------------------------------------------------------------------------
static const Steinberg::FUID kMMS_SynthesizerPluginProcessorUID (0x52E2328B, 0xFAD3526A, 0x9814E577, 0x5EEEB7A4);
static const Steinberg::FUID kMMS_SynthesizerPluginControllerUID (0x6B90781B, 0xF4E65B63, 0x92FF39B9, 0xB204591D);

#define MMS_SynthesizerPluginVST3Category "Instrument"

//------------------------------------------------------------------------
} // namespace MyCompanyName
