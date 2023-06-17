class ArtigosController < ApplicationController
  before_action :set_artigo, only: %i[ show update destroy ]

  # GET /artigos
  def index
    @artigos = Artigo.all

    render json: @artigos
  end

  # GET /artigos/1
  def show
    render json: @artigo
  end

  # POST /artigos
  def create
    @artigo = Artigo.new(artigo_params)

    if @artigo.save
      render json: @artigo, status: :created, location: @artigo
    else
      render json: @artigo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /artigos/1
  def update
    if @artigo.update(artigo_params)
      render json: @artigo
    else
      render json: @artigo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /artigos/1
  def destroy
    render json: @artigo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artigo
      @artigo = Artigo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artigo_params
      params.require(:artigo).permit(:titulo, :texto, :autor)
    end
end
