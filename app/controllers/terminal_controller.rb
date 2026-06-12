class TerminalController < ApplicationController
  def index
  end

  def execute

    current_folder_id = params[:folder_id]
    current_folder = Folder.find(current_folder_id)
    raw_input = params[:command]
    command = raw_input.split(" ") 

    allowed = ["ls","cd", "pwd", "whoami", "echo", "help"]

    return render json: { output: "Command not allowed" } unless allowed.include?(command[0])

    output =
      case command[0]
      when "ls"  
        folder_names = current_folder.subfolders.map(&:name)
        file_names = current_folder.terminal_files.map(&:name)
        (folder_names + file_names).join(" ")

      when "cd"
        target = command[1]
        
        if target == ".."
          if current_folder.parent_id
            current_folder_id = current_folder.parent_id
          end
          "" 
        else
          subfolder = current_folder.subfolders.find_by(name: target)
          if subfolder
            current_folder_id = subfolder.id
            "" 
          else
            "folder not found"
          end
        end
      when "pwd" then current_folder.name
      when "whoami" then `whoami`
      when "echo" then "hello"
      when "help" then "You can use commands: echo, whoami, pwd, ls, cd"
      end

    render json: { output: output, new_folder_id: current_folder_id }
  end
end