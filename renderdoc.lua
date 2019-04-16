-- scaffold geniefile for renderdoc

renderdoc_script = path.getabsolute(path.getdirectory(_SCRIPT))
renderdoc_root = path.join(renderdoc_script, "renderdoc")

renderdoc_includedirs = {
	path.join(renderdoc_script, "config"),
	renderdoc_root,
}

renderdoc_libdirs = {}
renderdoc_links = {}
renderdoc_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { renderdoc_includedirs }
	end,

	_add_defines = function()
		defines { renderdoc_defines }
	end,

	_add_libdirs = function()
		libdirs { renderdoc_libdirs }
	end,

	_add_external_links = function()
		links { renderdoc_links }
	end,

	_add_self_links = function()
		links { "renderdoc" }
	end,

	_create_projects = function()

project "renderdoc"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		renderdoc_includedirs,
	}

	defines {}

	files {
		path.join(renderdoc_script, "config", "**.h"),
		path.join(renderdoc_root, "**.h"),
		path.join(renderdoc_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
