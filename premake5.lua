project "yaml-cpp"
	kind "StaticLib"
	language "C++"

	targetdir (bin_dir .. "/Libs/Vendor/%{prj.name}")
	objdir (int_dir .. "/Libs/Vendor/%{prj.name}")

    -- Not using precompiled headers

	files
	{
		"premake5.lua",
		"src/**.h",
		"src/**.cpp",
		"include/**.h",
	}

	removefiles
	{
		"premake5.lua",
	}

	includedirs
	{
		"include",
	}

	dependson
	{
		-- nil
	}

	links
	{
		-- nil
	}

	defines { "_LIB",  "YAML_CPP_STATIC_DEFINE", }

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "off"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "off"

	filter "configurations:Debug"
		defines { "_DEBUG" }
		runtime "Debug"
		symbols "on"

	filter "configurations:Profile"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "on"

	filter "configurations:Release"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "on"

	filter {}