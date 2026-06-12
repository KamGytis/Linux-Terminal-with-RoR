# Clear out any existing data so we don't duplicate records on re-seed
TerminalFile.destroy_all
Folder.destroy_all

# 1. Create the Ultimate Root Folder (/)
root = Folder.create!(name: "root", parent_id: nil)

# 2. Create the standard subdirectories inside Root
app_dir    = Folder.create!(name: "app", parent_id: root.id)
config_dir = Folder.create!(name: "config", parent_id: root.id)
db_dir     = Folder.create!(name: "db", parent_id: root.id)

# 3. Create sub-subdirectories inside /app
controllers_dir = Folder.create!(name: "controllers", parent_id: app_dir.id)
views_dir       = Folder.create!(name: "views", parent_id: app_dir.id)

# 4. Plant some mock files into our folders
TerminalFile.create!(name: "Gemfile", content: "source 'https://rubygems.org'\ngem 'rails'", folder: root)
TerminalFile.create!(name: "README.md", content: "Welcome to the Mock Rails Terminal!", folder: root)

TerminalFile.create!(name: "terminal_controller.rb", content: "class TerminalController < ApplicationController...", folder: controllers_dir)
TerminalFile.create!(name: "routes.rb", content: "Rails.application.routes.draw do...", folder: config_dir)
TerminalFile.create!(name: "seeds.rb", content: "# This very file!", folder: db_dir)

puts "🌱 Database successfully seeded with a Virtual File System!"