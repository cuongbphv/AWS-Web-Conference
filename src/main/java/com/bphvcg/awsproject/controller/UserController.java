package com.bphvcg.awsproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {


    @GetMapping("/403")
    public String accessDenied() {
        return "403";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Tài khoản hoặc mật khẩu không đúng vui lòng đăng nhập lại.");

        if (logout != null)
            model.addAttribute("logout", "Đăng xuất thành công.");

        return "login";
    }
    
}
