# Here you need to specify a list of end targets for each platform.

# windows
win32 {
    TARGET_LIST += example.exe
}

# linux
# by default installer create shortcut for last binary file of the list
unix {
    TARGET_LIST += example
}

# os X
macx {
    TARGET_LIST += example
}
