class ImportData < ActiveRecord::Migration[7.1]
  def change
  end

  def up
    Rake::Task['db:data:load'].invoke
  end
end
