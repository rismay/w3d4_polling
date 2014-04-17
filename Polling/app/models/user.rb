class User < ActiveRecord::Base
  has_many :polls,
    class_name: Poll,
    foreign_key: :author_id,
    primary_key: :id

  has_many :responses,
    class_name: Response,
    foreign_key: :responder_id,
    primary_key: :id

end
