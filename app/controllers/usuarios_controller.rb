class UsuariosController < ApplicationController

    before_filter :authorize

    # GET /usuarios

    def index
        @usuarios = Usuario.find(:all)

        respond_to do |format|
            format.html # index.html.erb
        end
    end

    # POST /usuarios

    def new
        @usuario = Usuario.new
        respond_to do |format|
            format.html # new.html.erb
        end
    end

    # POST /usuarios

    def create
        @usuario = Usuario.new(params[:usuario])
        respond_to do |format|
            if @usuario.save
                flash[:notice] = "Usu‡rio #{@usuario.nome} adicionado com sucesso"
                format.html { redirect_to(:action => "index") }
            else
                format.html { render :action => "new" }
            end
        end
    end

    # GET /usuarios/1/edit

    def edit
        @usuario = Usuario.find(params[:id])
    end

    # PUT /usuarios/1

    def update
        @usuario = Usuario.find(params[:id])

        respond_to do |format|
            if @usuario.update_attributes(params[:usuario])
                flash[:notice] = "Usu‡rio #{@usuario.nome} alterado com sucesso"
                format.html { redirect_to(:action => "index") }
            else
                format.html { render :action => "edit" }
            end
        end
    end

    # DELETE /usuarios/1

    def destroy
        @usuario = Usuario.find(params[:id])
        @usuario.destroy

        respond_to do |format|
            format.html { redirect_to(notas_url) }
        end
    end
end
