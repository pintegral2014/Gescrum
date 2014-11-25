package action;

import action.model.HistoriaModel;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * Created by jordan on 06-07-2014.
 */
public class Historia extends ActionSupport implements ModelDriven{
    HistoriaModel historiaModel = new HistoriaModel();

    @Override
    public Object getModel() {
        return historiaModel;
    }

    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }
}
