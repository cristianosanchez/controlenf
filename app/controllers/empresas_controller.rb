class EmpresasController < ApplicationController

    before_filter :authorize

    # GET /empresas
    def index
        @empresas = Empresa.find (:all)
        respond_to do |format|
            format.html # index.html.erb
        end
    end

    # GET /empresas/new
    # GET /empresas/new.xml
    def new
        @empresa = Empresa.new
        respond_to do |format|
            format.html # new.html.erb
        end
    end

    # POST /empresas
    def create
        @empresa = Empresa.new(params[:empresa])
        respond_to do |format|
            if @empresa.save
                flash[:notice] = "A empresa #{@empresa.razao_social} foi inclu’da com sucesso."
                format.html { redirect_to(:action => "index") }
            else
                format.html { render :action => "new" }
            end
        end
    end

    # GET /empresas/1/edit

    def edit
        @empresa = Empresa.find(params[:id])
    end

    # PUT /empresas/1
    def update
        @empresa = Empresa.find(params[:id])

        respond_to do |format|
            if @empresa.update_attributes(params[:empresa])
                flash[:notice] = "A empresa #{@empresa.razao_social} foi alterada com sucesso."
                format.html { redirect_to(:action => "index") }
            else
                format.html { render :action => "edit" }
            end
        end
    end

    # DELETE /empresas/1
    def destroy
        @empresa= Empresa.find(params[:id])
        @empresa.destroy
        respond_to do |format|
            format.html { redirect_to(empresas_url) }
        end
    end
end
