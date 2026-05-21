class TerminalController < ApplicationController
  def index
  end

  def execute

    raw_input = params[:command]
    command = raw_input.split(" ") 

    allowed = ["ls", "pwd", "whoami", "echo", "help"]

    return render json: { output: "Command not allowed" } unless allowed.include?(command[0])

    output =
      case command[0]
      when "ls" then `ls`
      when "pwd" then `pwd`
      when "whoami" then `whoami`
      when "echo" then "hello"
      when "help" then "You can use commands: echo, whoami, pwd, ls"
      end

    render json: { output: output }
  end
end