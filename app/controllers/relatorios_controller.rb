class RelatoriosController < ApplicationController

    before_filter :authorize
    
    def last_day_of_the_month(adate)
        Date.civil(adate.year, adate.month, -1)
        
        
    end

    def first_day_of_the_month(adate)
        Date.parse(adate.year.to_s + "-" + adate.month.to_s + "-01") 
    end

    def index
        mes
    end

    def mes

        adate = nil
        qdata = params['qdata']
        if (qdata == nil)
            adate = Date.civil(Date.today.year, Date.today.month, 1)
        else
            year, month = qdata.split('-')
            adate = Date.civil(year.to_i, month.to_i, 1)
        end

        data_ini = first_day_of_the_month(adate)
        data_fin = last_day_of_the_month(adate)
        @notas = Nota.find(:all,
                           :conditions => ["emissao BETWEEN :dataIni AND :dataFin", {:dataIni => data_ini, :dataFin => data_fin}])

        @impostos = {}
        emissores = Usuario.find(:all)
        emissores.each do |e|
          @impostos.store(e, Impostos.new)
        end

        respond_to do |format|
            if (@notas == nil)
                flash[:notice] = "Nenhuma NF encontrada"
            end
            format.html { render :action => "mes"}
        end
    end

    def trimetre
        
    end

end
