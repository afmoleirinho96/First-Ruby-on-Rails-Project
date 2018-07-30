class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :set_options_for_select, only: [:new, :edit, :update, :create] #apresentar informações dos tipos



  #http_basic_authenticate_with name: "admin", password: "secret", only: :destroy
  #http_basic_authenticate_with name: "dhh", password: "secret", only: [:destroy, :create]





  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all.page(params[:page]).per(20)
    @my_name="André"
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @contact.build_address
    #options_for_select

  end

  # GET /contacts/1/edit
  def edit
    #options_for_select
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)


    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        #options_for_select
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    #Options for our Form, either to create or edit.
    def set_options_for_select
      @kind_options_for_select=Kind.all
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :kind_id, :rmk,
        address_attributes: [:street, :city],
        phones_attributes: [:id, :phone, :_destroy])
    end
end
