class ReservationsController < ApplicationController
<<<<<<< HEAD
  def reserve
    reservations_handler.reserve
=======
  before_action :load_user, only: [:users_reservations]


  def reserve
    reservation_handler.reserve
>>>>>>> 8989e3f8414f2fe1d83c39ab87db26c2fd91ef4f
    redirect_to(book_path(book.id))
    ReservationsMailer.notify_about_reservation(current_user, book).deliver_now
  end

  def take
<<<<<<< HEAD
    reservations_handler.take
=======
    reservation_handler.take (current_user) if book.can_take?(current_user)
>>>>>>> 8989e3f8414f2fe1d83c39ab87db26c2fd91ef4f
    redirect_to(book_path(book.id))
  end

  def give_back
<<<<<<< HEAD
    reservations_handler.give_back
=======
    reservation_handler.give_back if book.can_give_back?(current_user)
>>>>>>> 8989e3f8414f2fe1d83c39ab87db26c2fd91ef4f
    redirect_to(book_path(book.id))
  end

  def cancel
    reservations_handler.cancel_reservation
    redirect_to(book_path(book.id))
  end

<<<<<<< HEAD
  private

  def reservations_handler
    @reservations_handler ||= ReservationsHandler.new(current_user, book)
=======
  def users_reservations
  end

  def available_reservation
    reservations.find_by(status: 'AVAILABLE')
  end

  private

  def reservation_handler
    @reservation_handler ||= ::ReservationHandler.new(current_user,book)
  end

  def book
    @book ||= Book.find(params[:book_id])
>>>>>>> 8989e3f8414f2fe1d83c39ab87db26c2fd91ef4f
  end

  def book
    @book ||= Book.find(params[:book_id])
  end
end
