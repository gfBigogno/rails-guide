class Article < ApplicationRecord

    include Visible

    # dependent -> DELETE CASCADE
    has_many :comments, dependent: :destroy

    # Validações dos atributos
    validates :title, presence: true
    validates :body, presence: true, length: {minimum: 10}

end
