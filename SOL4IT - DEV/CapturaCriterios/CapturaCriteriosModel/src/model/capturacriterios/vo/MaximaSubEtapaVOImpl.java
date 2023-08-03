package model.capturacriterios.vo;

import oracle.jbo.Variable;
import oracle.jbo.VariableValueManager;
import oracle.jbo.server.ViewObjectImpl;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Mon Sep 14 15:20:30 CDT 2015
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class MaximaSubEtapaVOImpl extends ViewObjectImpl {
    /**
     * This is the default constructor (do not remove).
     */
    public MaximaSubEtapaVOImpl() {
    }

    /**
     * Returns the bind variable value for p_etapa.
     * @return bind variable value for p_etapa
     */
    public Integer getp_etapa() {
        return (Integer) getNamedWhereClauseParam("p_etapa");
    }

    /**
     * Sets <code>value</code> for bind variable p_etapa.
     * @param value value to bind as p_etapa
     */
    public void setp_etapa(Integer value) {
        setNamedWhereClauseParam("p_etapa", value);
    }
    
    public void dumpQueryAndParameters()
    {
        // get the query in it's current state
        String lQuery = getQuery();
        //get Valriables
        VariableValueManager lEnsureVariableManager = ensureVariableManager();
        Variable[] lVariables = lEnsureVariableManager.getVariables();
        int lCount = lEnsureVariableManager.getVariableCount();
        // Dump query
        //System.out.println("---query--- " + lQuery);
        // if variables found dump them
        if (lCount > 0)
        {
            //System.out.println("---Variables:");
            for (int ii = 0; ii < lCount; ii++)
            {
                Object lObject = lEnsureVariableManager.getVariableValue(lVariables[ii]);
                //System.out.println("  --- Name: " + lVariables[ii].getName() + " Value: " + (lObject != null ?  lObject.toString() : "null") );
            }
        }
    }
    
    @Override
    public void executeQuery()
    {
        dumpQueryAndParameters();
        super.executeQuery();
    }


    /**
     * Returns the bind variable value for t_proyecto.
     * @return bind variable value for t_proyecto
     */
    public Integer gett_proyecto() {
        return (Integer) getNamedWhereClauseParam("t_proyecto");
    }

    /**
     * Sets <code>value</code> for bind variable t_proyecto.
     * @param value value to bind as t_proyecto
     */
    public void sett_proyecto(Integer value) {
        setNamedWhereClauseParam("t_proyecto", value);
    }
}
