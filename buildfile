import pkgs = libimgui/

libimgui = [dir_path] $pkgs

import pkgs += libimgui-platform-glfw/ libimgui-render-opengl2/ libimgui-render-opengl3/ libimgui-render-vulkan/ libimgui-examples/

switch $($libimgui/ cxx.target.class)
{
    case 'windows'
    {
        import pkgs += {libimgui-platform-win32/ libimgui-render-dx9/ libimgui-render-dx10/ libimgui-render-dx11/ libimgui-render-dx12/}
    }
    case 'macos'
    {
        import pkgs += {libimgui-platform-osx/ libimgui-render-metal/}
    }
}

./: $pkgs
