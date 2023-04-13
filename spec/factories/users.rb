FactoryBot.define do
  factory :user do
    id { 1 }
    email { "email@email.com" }
    encrypted_password { "$2a$12$SU2KDPdHndhxc3BfE5rfG.n8UCRuKT9ZxGtUpi2po7M4EKe8mX6SS" }
  end
end
