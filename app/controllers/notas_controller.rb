class NotasController < ApplicationController

    before_filter :authorize

    # GET /notas
    # GET /notas.xml

    def index
        @notas = Nota.find(:all, :order => 'numero desc')

        @total_por_usuario = Nota.sum(:valor, :group => 'usuario', :conditions => 'usuario_id <> 0')

        respond_to do |format|
            format.html # index.html.erb
        end
    end

    # GET /notas/new
    # GET /notas/new.xml

    def new
        @nota = Nota.new
        respond_to do |format|
            format.html # new.html.erb
        end
    end

    # POST /notas

    def create
        @nota = Nota.new(params[:nota])
        respond_to do |format|
            if @nota.save
                flash[:notice] = "A NF de numero #{@nota.numero} foi adicionada com sucesso."
                format.html { redirect_to(:action => "index") }
            else
                format.html { render :action => "new" }
            end
        end
    end

    # GET /notas/1/edit

    def edit
        @nota = Nota.find(params[:id])
    end

    def detalhe
        @nota = Nota.find(params[:id])
    end

    # PUT /notas/1

    def update
        @nota = Nota.find(params[:id])

        respond_to do |format|
            if @nota.update_attributes(params[:nota])
                flash[:notice] = "A NF de numero #{@nota.numero} foi alterada com sucesso."
                format.html { redirect_to(:action => "index") }
            else
                format.html { render :action => "edit" }
            end
        end
    end

    # DELETE /posts/1

    def destroy
        @nota= Nota.find(params[:id])
        @nota.destroy

        respond_to do |format|
            format.html { redirect_to(notas_url) }
        end
    end


    def busca_avancada

        qnumero  = params['qnumero']
        qemissao = params['qemissao']
        qempresa = params['qempresa']
        qemissor = params['qemissor']

        if (qemissao || qempresa || qemissor)
           @notas = Nota.find :all, :conditions => "empresa_id = #{qempresa}"
           respond_to do |format|
                if (@notas == nil)
                    flash[:notice] = "NF(s) n‹o encontrada"
                    format.html { redirect_to(:action => "index") }
                else
                    format.html { render :action => "index"}
                end
            end
        else
            @nota = Nota.find_by_numero(qnumero)
            respond_to do |format|
                if (@nota == nil)
                    flash[:notice] = "NF n‹o encontrada"
                    format.html { redirect_to(:action => "index") }
                else
                    format.html { render :action => "detalhe"}
                end
            end
        end


    end


end
