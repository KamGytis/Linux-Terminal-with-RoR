class CreateTerminalFiles < ActiveRecord::Migration[8.1]
  def change
    create_table :terminal_files do |t|
      t.string :name
      t.text :content
      t.references :folder, null: false, foreign_key: true

      t.timestamps
    end
  end
end
