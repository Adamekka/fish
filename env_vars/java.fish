if test (uname) = Darwin
    set -l java_home (/usr/libexec/java_home 2>/dev/null)
    if test $status -eq 0
        set -x JAVA_HOME $java_home
    end
    set -x ANDROID_HOME /opt/homebrew/share/android-sdk
    set -x ANDROID_NDK_ROOT /opt/homebrew/share/android-ndk
end
