package hl.ep.view.common;

//import hl.ep.view.bean.EmployeePurchaseHomeBean;

import java.util.HashMap;
import java.util.Map;

import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.el.ValueExpression;

import javax.faces.context.FacesContext;

import oracle.binding.ManagedDataControl;
import oracle.binding.OperationBinding;

public class CustomEventHandler implements ManagedDataControl {
    public CustomEventHandler() {
        super();
    }
    /*
    public void openTabOrderForm()
    {
    EmployeePurchaseHomeBean dsb = null;
    if(getBackingBean("#{pageFlowScope.homeBean}") != null)
        {
            dsb = (EmployeePurchaseHomeBean)getBackingBean("#{pageFlowScope.homeBean}");
            dsb.openTabOrderForm();
        }
    }
    
    private Object getBackingBean(String beanName) {
        Object object = null;
        FacesContext fctx = FacesContext.getCurrentInstance();
        ELContext elctx = fctx.getELContext();
        ExpressionFactory expressionFactory = fctx.getApplication().getExpressionFactory();
        ValueExpression ve = expressionFactory.createValueExpression(elctx, beanName, Object.class);
        if (ve != null && ve.getValue(elctx) != null) {
            object = ve.getValue(elctx);
        }
        return object;
    }
    */
    public String getName() {
        return null;
    }

    public void release() {
    }

    public Object getDataProvider() {
        return null;
    }

    public boolean invokeOperation(Map p0, OperationBinding p1) {
        return false;
    }

    public void beginRequest(HashMap p0) {
    }

    public void endRequest(HashMap p0) {
    }

    public boolean resetState() {
        return false;
    }
    
    public void invokeContextualEventCopyOrder()
    {
    }
}
