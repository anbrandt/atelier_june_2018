require '/home/andrzej/dev/00_RUBY/infakt/atelier_june_2018/spec/rails_helper.rb'

describe ReservationHandler, type: :service do
  let(:user) {
    User.new
  }
  subject {
    described_class.new(user, book)
  }

  describe '#reserve' do
  let(:book) {
    Book.new
  }

  before {
    allow(book).to receive_message_chain(:can_reserve?).with(user).and_return(can_be_reserved)
  }

  context 'without available book' do
    let(:can_be_reserved) {
      false
   }
    it {
      expect(subject.reserve()).to eq('Book is not available for reservation')
    }
  end

  context 'with availabe book' do
    let(:can_be_reserved) {
      true
    }
    before {
      allow(book).to receive_message_chain(:reservations, :create).with(no_args).
                         with(user: user, status: 'RESERVED').and_return(true)
    }

    it {
      expect(subject.reserve()).to be_truthy
    }

  end
  end

  describe '#take' do
    let(:book) {
      Book.new
    }

    before {
      allow(book).to receive_message_chain(:can_take?).with(user).and_return(can_be_taken)
    }

    context 'when book can\'t be taken' do
      let(:can_be_taken) {
        false
      }

      it {
        expect(subject.take(user)).to eq(nil)
      }
    end

    context 'when reservation is possible and user didn\'t have reservations before' do
        let(:can_be_taken) {
          true
        }
        before {
          allow(book).to receive_message_chain(:available_reservation, :present).with(no_args).
          with(status: 'TAKEN').and_return(false)
        }

        it {
          expect(subject.take(user)).to eq
        }

    end

    context 'when reservation is possible and user did have previous reservations' do

    end

  end

  end
