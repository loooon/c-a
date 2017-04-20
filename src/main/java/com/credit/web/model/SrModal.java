package com.credit.web.model;

import java.util.List;

/**
 * Created by Michael Chan on 4/11/2017.
 */
public class SrModal
{
    private List<SiteResourceModel> siteResourceModels;

    public SrModal(List<SiteResourceModel> siteResourceModels)
    {
        super();
        this.siteResourceModels = siteResourceModels;
    }
    public SrModal(){
        super();
    }

    public List<SiteResourceModel> getSiteResourceModels()
    {
        return siteResourceModels;
    }

    public void setSiteResourceModels(List<SiteResourceModel> siteResourceModels)
    {
        this.siteResourceModels = siteResourceModels;
    }
}
