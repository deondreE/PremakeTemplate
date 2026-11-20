workspace "PremakeTemplate"
   configurations { "Debug", "Release" }

project "Engine"
   kind "StaticLib"
   language "C++"
   cppdialect "C++20"
   targetdir "bin/%{cfg.buildcfg}"

   files { "engine/**.hpp", "engine/**.cpp" }

   includedirs { "engine/include" }

   filter "system:windows"
     defines {"WIN32", "WIN32_LEAN_AND_MEAN"}

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"

project "Sandbox"
    kind "ConsoleAppliation"
    language "C++"
    cppdialect "C++20"
    targetdir "bin/%{cfg.buildcfg}"

    files { "sandbox/**.hpp", "sandbox/**.cpp" }

    includedirs { "engine/include" }

    links "Engine"

    filter "system:windows"
    defines {"WIN32", "WIN32_LEAN_AND_MEAN"}

    filter "configurations:Debug"
    defines { "DEBUG" }
    symbols "On"

    filter "configurations:Release"
    defines { "NDEBUG" }
    optimize "On"
