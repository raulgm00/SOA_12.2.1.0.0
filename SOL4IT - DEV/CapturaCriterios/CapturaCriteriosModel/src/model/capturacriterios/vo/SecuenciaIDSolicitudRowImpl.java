package model.capturacriterios.vo;

import oracle.jbo.domain.Number;
import oracle.jbo.server.ViewRowImpl;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Thu Sep 10 11:05:03 CDT 2015
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class SecuenciaIDSolicitudRowImpl extends ViewRowImpl {
    /**
     * AttributesEnum: generated enum for identifying attributes and accessors. DO NOT MODIFY.
     */
    public enum AttributesEnum {
        Nextval;
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
    public static final int NEXTVAL = AttributesEnum.Nextval.index();

    /**
     * This is the default constructor (do not remove).
     */
    public SecuenciaIDSolicitudRowImpl() {
    }

    /**
     * Gets the attribute value for the calculated attribute Nextval.
     * @return the Nextval
     */
    public Number getNextval() {
        return (Number) getAttributeInternal(NEXTVAL);
    }
}

