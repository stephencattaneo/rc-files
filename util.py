import os,sys

PROJECT_HOME=os.getenv('PROJECT_HOME')

def write_js_dir():
  _write_dir('app/assets/javascripts')

def write_style_dir():
  _write_dir('app/assets/stylesheets')

def write_spec_dir():
  _write_dir('spec')

def write_frontend_dir():
  _write_dir('frontend')

def write_base_dir():
  _write_dir('')

def _write_dir(dir):
  pieces = os.getcwd().split(PROJECT_HOME)
  if len(pieces) < 2:
    return
  os.chdir(
    '/'.join([os.getenv('PROJECT_HOME'), base_dir(pieces[1]), dir])
  )
  sys.stdout.write(os.getcwd())

def base_dir(relative_path):
  return relative_path.split('/')[1]


