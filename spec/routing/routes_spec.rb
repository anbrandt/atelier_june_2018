require 'rails_helper'

describe 'AppRouting' do
<<<<<<< HEAD
  it { expect(root: 'books', action: 'index') }
  it { expect(get: 'books/12/reserve').to route_to(controller: 'reservations', action: 'reserve', book_id: '12') }
  it { expect(get: reserve_book_path(book_id: 12)).to route_to(controller: 'reservations', action: 'reserve', book_id: '12') }
  it { expect(get: take_book_path(book_id: 12)).to route_to(controller: 'reservations', action: 'take', book_id: '12') }
  it { expect(get: give_back_book_path(book_id: 12)).to route_to(controller: 'reservations', action: 'give_back', book_id: '12') }
  it { expect(get: cancel_book_reservation_path(book_id: 12)).to route_to(controller: 'reservations', action: 'cancel', book_id: '12') }
  it { expect(get: users_reservations_path(user_id: 12)).to route_to(controller: 'reservations', action: 'users_reservations', user_id: '12') }
  it { expect(get: 'google-isbn').to route_to(controller: 'google_books', action: 'show') }

  # resources :books
  it { expect(get: books_path).to route_to(controller: 'books', action: 'index') }
  it { expect(post: 'books').to route_to(controller: 'books', action: 'create') }
  it { expect(get: new_book_path).to route_to(controller: 'books', action: 'new') }
  it { expect(get: edit_book_path(id: '12')).to route_to(controller: 'books', action: 'edit', id: '12') }
  it { expect(get: book_path(id: '12')).to route_to(controller: 'books', action: 'show', id: '12') }
  it { expect(patch: 'books/12').to route_to(controller: 'books', action: 'update', id: '12') }
  it { expect(put: 'books/12').to route_to(controller: 'books', action: 'update', id: '12') }
  it { expect(delete: 'books/12').to route_to(controller: 'books', action: 'destroy', id: '12') }
=======
  it {
    expect(root: 'books', action: 'index')
  }
  it {
    expect(get: 'books/12/reserve').to route_to(controller: 'reservations', action: 'reserve', book_id: '12')
  }
  it {
    expect(get: 'books/5/take').to route_to(controller: 'reservations', action: 'take', book_id: '5')
  }
  it {
    expect(get: 'books/6/give_back').to route_to(controller: 'reservations', action: 'give_back', book_id: '6')
  }
  it {
    expect(get: 'books/7/cancel_reservation').to route_to(controller: 'reservations', action: 'cancel', book_id: '7')
  }
  it {
    expect(get: 'users/1/reservations').to route_to(controller: 'reservations', action: 'users_reservations', user_id: '1')
  }
  it {
    expect(get: 'google-isbn').to route_to(controller: 'google_books', action: 'show')
  }

>>>>>>> 8989e3f8414f2fe1d83c39ab87db26c2fd91ef4f
end
