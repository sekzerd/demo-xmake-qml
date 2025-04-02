add_rules("mode.debug", "mode.release")

set_arch("x86")
target("demo_xmake_qml")
    set_kind("binary")
    add_files("*.cpp") 
    add_rules("qt.quickapp")
    add_files("main.cpp")
    add_files("qml.qrc")

    set_languages("c++17")