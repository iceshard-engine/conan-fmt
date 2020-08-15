newoption {
    trigger = "arch",
    description = "Build for the given architecture",
    value = "ARCH"
}

workspace "fmt"
    configurations { "Debug", "Release" }
    debugformat "C7"

    architecture(_OPTIONS.arch)

    filter { "Debug" }
        symbols "On"

    filter { "Release" }
        optimize "On"

    project "fmt"
        kind "StaticLib"

        includedirs {
            "include"
        }

        files {
            "src/**.cc"
        }
