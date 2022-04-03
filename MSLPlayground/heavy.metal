//
//  heavy.metal
//  MSLPlayground
//
//  Created by Makeeyaf on 2022/04/03.
//

#include <metal_stdlib>
using namespace metal;

#include <CoreImage/CoreImage.h>
extern "C" { namespace coreimage {
    
    float4 tiktokfy(sampler s) {
        float2 coord = s.coord();
        float2 rOffset = float2(+0.02, +0.02);
        float2 gbOffset = float2(-0.02, -0.02);

        float3 rgb;
        rgb.r = s.sample(coord - rOffset).r;
        rgb.gb = s.sample(coord - gbOffset).gb;
        
        return float4(rgb, 1.0);
    }
}}
