import os
import subprocess

mac_sdk_path = subprocess.check_output(
  ('xcrun', '--show-sdk-path')
).strip()

cppflags = [
  '-std=c++14',
  '-x', 'c++'
]

objcflags = [
  '-isysroot', mac_sdk_path,
  '-I', mac_sdk_path + '/usr/local/include',
  '-fmodules',
  '-fobjc-arc',
  '-c',
]

per_extension_flags = {
  'cc': cppflags,
  'cpp': cppflags,
  'm': objcflags,
  'mm': cppflags + objcflags + [
    '-x', 'objective-c++',
  ]
}

def FlagsForFile(filename, **_kwargs):
  flags = [
    '-Wall',
    '-Wextra',
    '-Wpedantic',
    '-Werror',
  ] + per_extension_flags.get(os.path.splitext(filename)[1][1:], [])

  return {
    'flags': flags,
    'do_cache': True
  }
