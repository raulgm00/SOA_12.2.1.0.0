package model.capturacriterios.vo;

import oracle.jbo.server.ViewObjectImpl;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Fri Dec 04 12:22:36 CST 2015
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class UserByIdVOImpl extends ViewObjectImpl {
    /**
     * This is the default constructor (do not remove).
     */
    public UserByIdVOImpl() {
    }

    /**
     * Returns the bind variable value for p_nameUSR.
     * @return bind variable value for p_nameUSR
     */
    public String getp_nameUSR() {
        return (String) getNamedWhereClauseParam("p_nameUSR");
    }

    /**
     * Sets <code>value</code> for bind variable p_nameUSR.
     * @param value value to bind as p_nameUSR
     */
    public void setp_nameUSR(String value) {
        setNamedWhereClauseParam("p_nameUSR", value);
    }
}

