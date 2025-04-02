add_rules("mode.debug", "mode.release")
set_arch("x86")

target("demo_xmake_qml")
    set_kind("binary")  
    set_languages("c++17")
    -- add_files("qml.qrc", {rule = "qt.qrc", values = {rcc_output = "qrc_qml.cpp"}})

    add_files("qml.qrc")
    
    add_files("*.cpp") 
    -- add_files("*.qml")
    -- add_files("layout/*.qml")
    
    add_rules("qt.quickapp")


    add_defines("QT_MESSAGELOGCONTEXT")  -- Keep logging context
    add_defines("QT_NO_DEBUG_OUTPUT")    -- Disable debug optimization
    set_symbols("debug")                 -- Keep symbols in release
    set_optimize("none") 

    if is_plat("windows") then
        add_ldflags("/SUBSYSTEM:CONSOLE")
    end