require 'rails-helper'

Rspec.describe ReservationHandler, type: 'service'  do
  let(:user) {
    User.new
  }
  subject {
    described_class.new(user)
  }

  describe '#reserve' do
    let(:book) {
      Book.new
    }
    before {
      allow(book).to received_message_chain(:can_be_reserved?).with(user).and_return(can_be_reserved)
    }

    context 'with available book' do
      let(:can_be_reserved) {
        false
      }
      it {
        expect(subject.reserve(book)).to eq('Book is not available for reservation')
      }
    end
    context 'without available book' do
      let(:can_be_reserved){
        true
      }
    end

  end

end