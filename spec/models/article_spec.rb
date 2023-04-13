require 'rails_helper'

RSpec.describe Article, type: :model do

  subject { build(:article) }

  describe "Associations" do
    it { should belong_to(:user) }
  end

  describe "Validations" do

    # faz a validação com base no subject
    it { should validate_presence_of(:title) }
    
    it { should validate_length_of(:body).is_at_least(10) }

    # É possível ainda a utilização do should_not
    it { should have_many(:comments) }

    it "is valid with valid attributes" do
      article = build(:article)
      expect(article).to be_valid
    end
    
  end
  
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  # Agrupar testes
  context "Validar title" do
    it "ele seja válido (seja preenchido)" do
      subject.title = "New article"
      expect(subject).to be_valid
    end

    it "ele seja inválido (não seja preenchido)" do
      subject.title = ""
      expect(subject).to_not be_valid
    end
  end

  context "Validar body" do
    it "ele seja inválido (não seja preenchido)" do
      subject.body = ""
      expect(subject).to_not be_valid
    end

    it "ele seja válido (tenha no minimo 10 de tamanho)" do
      subject.body = "content necessario mais de 10"
      expect(subject).to be_valid
    end

    it "ele seja inválido (tenha menos de 10 de tamanho)" do
      subject.body = "content"
      expect(subject).to_not be_valid
    end
  end
  
end
