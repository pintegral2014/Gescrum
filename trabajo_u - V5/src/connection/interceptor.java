package connection;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
/**
 * Created by EmilioCesar on 19-11-2014.
 */
public class interceptor  extends AbstractInterceptor {

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        Map<String, Object> session = invocation.getInvocationContext().getSession();

        String loginId = (String) session.get("loginConexion");

        if (loginId == null)
        {
            return Action.LOGIN;
        }
        else
        {
            return invocation.invoke();
        }
    }
}
