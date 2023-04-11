class Article < ApplicationRecord

    include Visible

    # dependent -> DELETE CASCADE
    has_many :comments, dependent: :destroy
    belongs_to :user

    # Validações dos atributos
    validates :title, presence: true
    validates :body, presence: true, length: {minimum: 10}

    def self.ransackable_attributes(auth_object = nil)
        %w[title]
    end

end
