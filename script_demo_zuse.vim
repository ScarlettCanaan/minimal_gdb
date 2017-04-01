function! Foo()
  python << EOF
def file_dif(file_name, lineno): 
  import vim
  vim.command(':e ' + file_name)
  vim.command(':' + lineno)
  vim.command('normal! zz')

def file_same_line_dif(lineno):
  vim.command(':' + lineno)
  vim.command('normal! zz')

def set_NO():
  file_path = ''
  line_cur = 0
  while(True):
#   p = multiprocessing.Process(target = worker_python, (0,))
#   p.start()
    _file = open('/tmp/test_for_mei', 'r')
    try:
      _file = open('/tmp/test_for_mei', 'r')
      current_file = _file.readline()
      current_file = current_file[0:len(current_file) -1]
      current_line = int(_file.readline())
      if(file_path != current_file):
        file_path = current_file
        file_dif(current_file, str(current_line))
#       vim.command(':e ' + current_file)
#       vim.command(':' + str(current_line))
#       vim.command('normal! zz')
      elif(line_cur != current_line):
        file_same_line_dif(str(current_line))
#       vim.command(':' + str(current_line))
#       vim.command('normal! zz')
      else:
        pass
      _file.close()
    except IOError:
      pass
    import time
    time.sleep(0.1)

set_NO()
EOF
endfunction


