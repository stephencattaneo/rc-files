if defined?(PryDebugger)
  Pry.commands.alias_command 'b', 'break'
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'return', 'finish'
  Pry.commands.alias_command 'r', 'return'
  Pry.commands.alias_command 'trace', 'pry-backtrace'
  Pry.commands.alias_command 't', 'trace'
end
