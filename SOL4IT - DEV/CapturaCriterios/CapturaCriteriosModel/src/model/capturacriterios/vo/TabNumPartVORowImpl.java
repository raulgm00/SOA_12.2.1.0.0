package model.capturacriterios.vo;

import oracle.jbo.server.ViewRowImpl;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Wed Sep 09 10:58:41 CDT 2015
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class TabNumPartVORowImpl extends ViewRowImpl {
    /**
     * AttributesEnum: generated enum for identifying attributes and accessors. DO NOT MODIFY.
     */
    public enum AttributesEnum {
        ID_TabNumPart,
        NumPartida,
        Opcion;
        private static AttributesEnum[] vals = null;
        private static final int firstIndex = 0;

        public int index() {
            return AttributesEnum.firstIndex() + ordinal();
        }

        public static final int firstIndex() {
            return firstIndex;
        }

        public static int count() {
            return AttributesEnum.firstIndex() + AttributesEnum.staticValues().length;
        }

        public static final AttributesEnum[] staticValues() {
            if (vals == null) {
                vals = AttributesEnum.values();
            }
            return vals;
        }
    }
    public static final int ID_TABNUMPART = AttributesEnum.ID_TabNumPart.index();
    public static final int NUMPARTIDA = AttributesEnum.NumPartida.index();
    public static final int OPCION = AttributesEnum.Opcion.index();

    /**
     * This is the default constructor (do not remove).
     */
    public TabNumPartVORowImpl() {
    }

    /**
     * Gets the attribute value for the calculated attribute ID_TabNumPart.
     * @return the ID_TabNumPart
     */
    public Integer getID_TabNumPart() {
        return (Integer) getAttributeInternal(ID_TABNUMPART);
    }

    /**
     * Sets <code>value</code> as the attribute value for the calculated attribute ID_TabNumPart.
     * @param value value to set the  ID_TabNumPart
     */
    public void setID_TabNumPart(Integer value) {
        setAttributeInternal(ID_TABNUMPART, value);
    }

    /**
     * Gets the attribute value for the calculated attribute NumPartida.
     * @return the NumPartida
     */
    public Integer getNumPartida() {
        return (Integer) getAttributeInternal(NUMPARTIDA);
    }

    /**
     * Sets <code>value</code> as the attribute value for the calculated attribute NumPartida.
     * @param value value to set the  NumPartida
     */
    public void setNumPartida(Integer value) {
        setAttributeInternal(NUMPARTIDA, value);
    }

    /**
     * Gets the attribute value for the calculated attribute Opcion.
     * @return the Opcion
     */
    public String getOpcion() {
        return (String) getAttributeInternal(OPCION);
    }

    /**
     * Sets <code>value</code> as the attribute value for the calculated attribute Opcion.
     * @param value value to set the  Opcion
     */
    public void setOpcion(String value) {
        setAttributeInternal(OPCION, value);
    }
}

