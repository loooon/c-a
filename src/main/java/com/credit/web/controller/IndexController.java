package com.credit.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wangjunling on 2017/3/31.
 */
@Controller
public class IndexController
{
    @RequestMapping("")
    public String index()
    {
        return "index";
    }
}
