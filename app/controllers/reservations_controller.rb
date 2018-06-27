class ReservationsController < ApplicationController
  def reserve
    reservations_handler.reserve
  before_action :load_user, only: [:users_reservations]
  end

  def reserve
    reservation_handler.reserve
    redirect_to(book_path(book.id))
    ReservationsMailer.notify_about_reservation(current_user, book).deliver_now
  end

  def take
    reservations_handler.take
    reservation_handler.take (current_user) if book.can_take?(current_user)
    redirect_to(book_path(book.id))
  end

  def give_back
    reservations_handler.give_back
    reservation_handler.give_back if book.can_give_back?(current_user)
    redirect_to(book_path(book.id))
  end

  def cancel
    reservations_handler.cancel_reservation
    redirect_to(book_path(book.id))
  end

  private

  def reservations_handler
    @reservations_handler ||= ReservationsHandler.new(current_user, book)
  end
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
  end

  def book
    @book ||= Book.find(params[:book_id])
  end
  end
