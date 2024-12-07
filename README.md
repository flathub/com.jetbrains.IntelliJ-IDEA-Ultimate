# @EDITOR_TITLE@ unofficial Flatpak wrapper
This version is running inside a container and is therefore not able  to access SDKs on your host system!

## How to run commands on the host system
To execute commands on the host system, run @EDITOR_TITLE@ with:

`$ flatpak run --talk-name=org.freedesktop.Flatpak @FLATPAK_ID@`

And this inside the sandbox:

`$ flatpak-spawn --host <COMMAND>`

This allows applications to launch arbitrary commands on the host.
This must not be used unless absolutely necessary and when no existing solutions using Flatpak or portals exist.
This is are considered a security issue, use at your risk.

To make it permanent

`$ flatpak override --user < --talk-name=org.freedesktop.Flatpak @FLATPAK_ID@`

To make the Integrated Terminal automatically use the host system's shell,
you can modify `Settings > Tools > Terminal > Shell path` to 

`/usr/bin/env -- flatpak-spawn --host bash`

## Flatpak standard SDK
This flatpak provides a standard development environment (gcc, python, etc).
To see what's available:
```
$ flatpak run --command=sh @FLATPAK_ID@
$ ls /usr/bin (shared runtime)
$ ls /app/bin (bundled with this flatpak)
```

## Flatpak extensions
To get support for additional languages, you have to install SDK extensions, e. g.
```
$ flatpak install flathub org.freedesktop.Sdk.Extension.openjdk
$ flatpak install flathub org.freedesktop.Sdk.Extension.openjdk21
$ flatpak install flathub org.freedesktop.Sdk.Extension.openjdk17
$ flatpak install flathub org.freedesktop.Sdk.Extension.openjdk11
$ flatpak install flathub org.freedesktop.Sdk.Extension.openjdk8
```

To enable selected extensions, set `FLATPAK_ENABLE_SDK_EXT` environment variable
to a comma-separated list of extension names (name is ID portion after the last dot):

`$ FLATPAK_ENABLE_SDK_EXT=openjdk,xxx flatpak run @FLATPAK_ID@`

To make this persistent, set the variable via flatpak override:

`$ flatpak override --user @FLATPAK_ID@ --env=FLATPAK_ENABLE_SDK_EXT="dotnet,golang"`

You can use to find others

`$ flatpak search <TEXT>`