import os,sys

WORKSPACE=os.getenv('WORKSPACE')

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
  pieces = os.getcwd().split(WORKSPACE)
  if len(pieces) < 2:
    return
  os.chdir(
    '/'.join([os.getenv('WORKSPACE'), base_dir(pieces[1]), dir])
  )
  sys.stdout.write(os.getcwd())  

def base_dir(relative_path):
  return relative_path.split('/')[1]
  

