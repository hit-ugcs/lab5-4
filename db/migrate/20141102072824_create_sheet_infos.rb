class CreateSheetInfos < ActiveRecord::Migration
  def change
    create_table :sheet_infos do |t|
      t.integer :course_id

      t.timestamps
    end
  end
end
