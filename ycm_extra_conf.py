import os
import subprocess

mac_sdk_path = subprocess.check_output(
  ('xcrun', '--show-sdk-path')
).strip()

cppflags = [
  '-std=c++11',
  '-x', 'c++'
]

objcflags = [
  '-isysroot', mac_sdk_path,
  '-I', mac_sdk_path + '/usr/local/include',
  '-I', mac_sdk_path + '/System/Library/Frameworks',
  # '-fmodules',
]

per_extension_flags = {
  'cc': cppflags,
  'mm': cppflags + objcflags + [
    '-x', 'objective-c++',
    '-framework', 'Foundation',
  ]
}

def FlagsForFile(filename, **_kwargs):
  flags = [
    '-Wall',
    '-Wextra',
    '-Wpedantic',
    '-Werror',
    '-std=c++11',
  ] + per_extension_flags.get(os.path.splitext(filename)[1][1:], [])

  return {
    'flags': flags,
    'do_cache': True
  }
