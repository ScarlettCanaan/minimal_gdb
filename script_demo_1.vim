function! Foo()
  python << EOF
import threading
global timer

def file_dif(file_name, lineno): 
  import vim
  vim.command(':e ' + file_name)
  vim.command(':' + lineno)
  vim.command('normal! zz')

def file_same_line_dif(lineno):
  vim.command(':' + lineno)
  vim.command('normal! zz')

def set_NO(_file_path, _line_cur):
  file_path = _file_path
  line_cur = _line_cur
  try:
      _file = open('/tmp/test_for_mei', 'r')
      current_file = _file.readline()
      current_file = current_file[0:len(current_file) -1]
      current_line = int(_file.readline())
      print current_file, '  ', current_line, '  ', file_path, '  ', line_cur 
      if(file_path != current_file):
        file_path = current_file
        file_dif(current_file, str(current_line))
#       vim.command(':e ' + current_file)
#       vim.command(':' + str(current_line))
#       vim.command('normal! zz')
      elif(line_cur != current_line):
        line_cur = current_line
        file_same_line_dif(str(current_line))
      else:
        pass
        #_file.close()
  except IOError:
      pass
  timer = threading.Timer(1, set_NO, [file_path, line_cur])
  timer.start()

def timer_test():
  timer = threading.Timer(1.1, set_NO, ['', 0])
  timer.start()

timer_test()
EOF
endfunction


