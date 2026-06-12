# Clear out any old partial data just in case
Folder.destroy_all
TerminalFile.destroy_all

# Create your root directory
root_folder = Folder.create!(name: "root", parent_id: nil)

# Create a couple of quick subfolders and files inside the root directory to test!
app_folder = Folder.create!(name: "app", parent_id: root_folder.id)
config_folder = Folder.create!(name: "config", parent_id: root_folder.id)

TerminalFile.create!(name: "README.md", folder: root_folder)
TerminalFile.create!(name: "Gemfile", folder: root_folder)

puts "Database successfully seeded with root, app/, config/, README.md, and Gemfile!"