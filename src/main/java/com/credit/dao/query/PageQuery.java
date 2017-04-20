package com.credit.dao.query;

public class PageQuery extends Query
{

    private static final Integer DEFAULT_PAGE_SIZE = 10;

    protected Integer pageNum = 1;

    protected Integer pageSize = DEFAULT_PAGE_SIZE;

    protected Integer start = 1;

    protected Integer end = pageSize;

    public PageQuery()
    {

    }

    public PageQuery(Integer pageNum, Integer pageSize)
    {
        if (pageNum == null || pageNum < 1)
        {
            pageNum = 1;
        }
        this.pageNum = pageNum;
        if (pageSize == null || pageSize < 1)
        {
            pageSize = 10;
        }
        this.pageSize = pageSize;
    }

    public Integer getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(Integer pageNum)
    {
        if (pageNum < 1)
        {
            pageNum = 1;
        }
        this.pageNum = pageNum;
    }

    public Integer getPageSize()
    {
        return pageSize;
    }

    public void setPageSize(Integer pageSize)
    {
        if (pageSize < 1 || pageSize > 100)
        {
            pageSize = DEFAULT_PAGE_SIZE;
        }
        this.pageSize = pageSize;
    }

    public void refreshStartEnd()
    {
        if (pageNum == null || pageNum < 2)
        {
            this.start = 1;
            end = pageSize;
        }
        else
        {
            start = (pageNum - 1) * pageSize + 1;
            end = pageNum * pageSize;
        }
    }

    public Integer getStart()
    {
        if (pageNum == null || pageNum < 2)
        {
            this.start = 0;
        }
        else
        {
            this.start = (pageNum - 1) * pageSize;
        }
        return start;
    }

    public Integer getEnd()
    {
        if (pageNum == null || pageNum < 2)
        {
            end = pageSize;
        }
        else
        {
            end = pageNum * pageSize;
        }
        return end;
    }

}
