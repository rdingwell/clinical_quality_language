package org.cqframework.cql.cql2elm.model;

import org.hl7.elm_modelinfo.r1.ModelInfo;

import javax.xml.bind.JAXB;

public class QuickModelHelper {
    public static ModelInfo load() {
        return JAXB.unmarshal(QuickModelHelper.class.getResourceAsStream("/org/hl7/fhir/quick-modelinfo.xml"),
                ModelInfo.class);
    }
}
