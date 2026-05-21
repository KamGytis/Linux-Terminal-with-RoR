class TerminalController < ApplicationController
  def index
  end

  def execute
    command = params[:command]

    allowed = ["ls", "pwd", "whoami", "echo hello", "help", "system_info"]

    return render json: { output: "Command not allowed" } unless allowed.include?(command)

    output =
      case command
      when "ls" then `ls`
      when "pwd" then `pwd`
      when "whoami" then `whoami`
      when "echo hello" then "hello"
      when "help" then "You can use commands: echo hello, whoami, pwd, ls"
      end

    render json: { output: output }
  end
end