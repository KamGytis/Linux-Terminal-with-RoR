class TerminalController < ApplicationController
  def index
  end

  def execute

    current_folder_id = params[:folder_id]
    current_folder = Folder.find(current_folder_id)
    raw_input = params[:command]
    command = raw_input.split(" ") 

    allowed = ["ls", "pwd", "whoami", "echo", "help"]

    return render json: { output: "Command not allowed" } unless allowed.include?(command[0])

    output =
      case command[0]
      when "ls" then {
        folder_names = current_folder.subfolders.map(&:name)
        file_names = current_folder.terminal_files.map(&:name)
        (folder_names + file_name).join(" ")

      }
      when "pwd" then `pwd`
      when "whoami" then `whoami`
      when "echo" then "hello"
      when "help" then "You can use commands: echo, whoami, pwd, ls"
      end

    render json: { output: output, new_folder_id: current_folder_id }
  end
end