package model.capturacriterios.vo;

import oracle.jbo.domain.Number;
import oracle.jbo.server.ViewRowImpl;
// ---------------------------------------------------------------------
// ---    File generated by Oracle ADF Business Components Design Time.
// ---    Mon Sep 14 17:11:03 CDT 2015
// ---    Custom code may be added to this class.
// ---    Warning: Do not modify method signatures of generated methods.
// ---------------------------------------------------------------------
public class MaximaSubEtapaVORowImpl extends ViewRowImpl {
    /**
     * AttributesEnum: generated enum for identifying attributes and accessors. DO NOT MODIFY.
     */
    public enum AttributesEnum {
        NuevaSubetapa;
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


    public static final int NUEVASUBETAPA = AttributesEnum.NuevaSubetapa.index();

    /**
     * This is the default constructor (do not remove).
     */
    public MaximaSubEtapaVORowImpl() {
    }

    /**
     * Gets the attribute value for the calculated attribute NuevaSubetapa.
     * @return the NuevaSubetapa
     */
    public Number getNuevaSubetapa() {
        return (Number) getAttributeInternal(NUEVASUBETAPA);
    }
}
