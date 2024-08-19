project "ImGuizmo"
	kind "StaticLib"
	language "C++"
    staticruntime "on"
	architecture "x86_64"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"*.h",
		"*.cpp"
	}
	
	includedirs
	{
		"../ImGui",
	}
	
	defines
	{
		"IMGUI_DEFINE_MATH_OPERATORS"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"
		
	filter { "system:windows", "configurations:Debug" }
        buildoptions "/MTd"
	
    filter { "system:windows", "configurations:Release" }
        buildoptions "/MT"
