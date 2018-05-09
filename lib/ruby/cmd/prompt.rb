require 'readline'

###
#
# This module provides the CLI interface
#
###

module CLI

  ###
  #
  # This class contains auto complete functionality
  # TODO: should be refactored to a new module
  #
  ###

  class Prompt
    def initialize(class_name, prompt = "> ")
      @prompt = prompt
      @class_name = class_name
      @complete_commands = []
      @initial_complete_commands = []

      complete

      Readline.completion_append_character = " "
      Readline.basic_word_break_characters = ""

      Readline.completion_proc = proc do |s|
        s = update_complete_commands! s
        @complete_commands.grep(/^#{Regexp.escape(s)}/)
      end
    end

    def complete
      @complete_commands = @class_name.instance_methods.grep(/^do_(.*?)$/).map {|s| s.to_s.sub("do_", "")}
      @initial_complete_commands = @class_name.instance_methods.grep(/^do_(.*?)$/).map {|s| s.to_s.sub("do_", "")}
    end

    # def do_git line
    #   puts line
    # end

    # def complete_git
    #   %w(clone init commit status push)
    # end

    def update_complete_commands! s
      args = s.split
      command = args.shift
      method_names = command.nil? ? [] : @class_name.instance_methods.grep(/^complete_#{Regexp.escape(command)}$/)

      if command.nil? or method_names.empty?
        @complete_commands = @initial_complete_commands.clone
      else
        @complete_commands = self.send(method_names[0]).map {|s| "#{command} #{s}"}
      end

      s
    end

    def cmd_loop
      while true
        line = Readline.readline(@prompt, false)
        if line.nil?
          break
        end
        params = line.split
        unless params.empty?
          method_names = @class_name.instance_methods.grep(/^do_#{Regexp.escape(params.shift)}$/)
          unless method_names.empty?
            self.send(method_names[0], params.join(" "))
          end
        end

        if line.to_s.strip != ""
          Readline::HISTORY.push << line
        end
      end
    end
  end
end
