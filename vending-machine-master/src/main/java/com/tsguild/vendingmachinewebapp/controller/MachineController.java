/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsguild.vendingmachinewebapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Jimmy Cook
 */
@Controller
public class MachineController {
    
    @RequestMapping(value = {"/","/machine"}, method = RequestMethod.GET)
    public String displayMachinePage(){
        return "machine";
    }
    
}
