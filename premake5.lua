imguiPath = "%{wks.location}/dependencies/imgui"
imguiBuildPath = "%{imguiPath}/build/%{cfg.platform}_%{cfg.buildcfg}"

project "imgui"
	kind "StaticLib"
	language "C++"
	targetdir "%{imguiBuildPath}"

	files {
		"*.h",
        "*.cpp",
        "backends/imgui_impl_glfw.h",
        "backends/imgui_impl_glfw.cpp",
        "backends/imgui_impl_opengl3.h",
        "backends/imgui_impl_opengl3.cpp"
	}

	includedirs {
		".",
        "backends",

        IncludeDir["GLFW"]
	}

    dependson "glfw"

	IncludeDir["imgui"] = "%{imguiPath}"
	LibraryDir["imgui"] = "%{imguiBuildPath}"
	Link["imgui"] = "imgui"

	filter "configurations:Debug"
        runtime "Debug"

    filter "configurations:Release"
        runtime "Release"
