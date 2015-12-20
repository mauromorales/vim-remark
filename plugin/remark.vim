let s:plugindir = expand('<sfile>:p:h:h')

function! s:RemarkPreview()
  call s:RemarkBuild()
  let s:file_name = expand('%:t:r') . ".html"
  call system("xdg-open " . s:file_name)
endfunction

function! s:RemarkBuild()
  ruby << EOF
  require 'erb'
  buffer = VIM::Buffer.current
  @markdown = "\n"
  buffer.length.times do |i|
    @markdown += buffer[i+1] + "\n"
  end
  path = VIM::evaluate "expand('%:p:h')"
  plugindir = VIM::evaluate "s:plugindir"
  if File.exist?(File.join(path, "layout.html.erb"))
    layout_file = File.join(path, "layout.html.erb")
  else
    layout_file = File.join(plugindir, "assets", "layout.html.erb")
  end
  renderer = ERB.new(File.read(layout_file))
  html = renderer.result()
  file_name = VIM::evaluate "expand('%:t:r')"
  File.write(File.join(path, "#{file_name}.html"), html)
EOF
endfunction

command! RemarkBuild call s:RemarkBuild()
command! RemarkPreview call s:RemarkPreview()
