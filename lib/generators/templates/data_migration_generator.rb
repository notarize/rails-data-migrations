# typed: strict

class ClassName < ActiveRecord::DataMigration
  extend T::Sig

  disable_ddl_transaction!

  sig { void }
  def up
    # put your code to modify data and output results here
  end
end
