# typed: strict

class ClassName < ActiveRecord::DataMigration
  extend T::Sig

  disable_ddl_transaction!

  sig { void }
  def up
    Rails.logger.info('starting TODO-message')

    # put your code to modify data and output results here

    Rails.logger.info('finished TODO-message')
  end
end
