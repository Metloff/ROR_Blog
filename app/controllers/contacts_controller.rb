class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @a = params[:contact]
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
    else
      flush.now[:error] = 'Cannot send message.'
      render :new 
    end
  end

end
