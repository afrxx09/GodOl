class BreweryContactsController < ApplicationController
  before_action :set_brewery_contact, only: [:show, :edit, :update, :destroy]

  # GET /brewery_contacts
  # GET /brewery_contacts.json
  def index
    @brewery_contacts = BreweryContact.all
  end

  # GET /brewery_contacts/1
  # GET /brewery_contacts/1.json
  def show
  end

  # GET /brewery_contacts/new
  def new
    @brewery_contact = BreweryContact.new
  end

  # GET /brewery_contacts/1/edit
  def edit
  end

  # POST /brewery_contacts
  # POST /brewery_contacts.json
  def create
    @brewery_contact = BreweryContact.new(brewery_contact_params)

    respond_to do |format|
      if @brewery_contact.save
        format.html { redirect_to @brewery_contact, notice: 'Brewery contact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @brewery_contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @brewery_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brewery_contacts/1
  # PATCH/PUT /brewery_contacts/1.json
  def update
    respond_to do |format|
      if @brewery_contact.update(brewery_contact_params)
        format.html { redirect_to @brewery_contact, notice: 'Brewery contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @brewery_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brewery_contacts/1
  # DELETE /brewery_contacts/1.json
  def destroy
    @brewery_contact.destroy
    respond_to do |format|
      format.html { redirect_to brewery_contacts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brewery_contact
      @brewery_contact = BreweryContact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brewery_contact_params
      params.require(:brewery_contact).permit(:brewery_id, :contact_type_id, :brewery_contact)
    end
end
