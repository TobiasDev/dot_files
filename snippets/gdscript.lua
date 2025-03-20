local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

return {
    -- Left Side Debug Messages
    s("tugstr", { 
        t("TugDebugManager.print_standard_message_on_screen(\""), 
        i(1, "Standard message"), 
        t("\", "), 
        c(2, { t("5.0"), t("") }),
        t(")") 
    }),
    s("tugwarn", { 
        t("TugDebugManager.print_warning_message_on_screen(\""), 
        i(1, "Warning message"), 
        t("\", "), 
        c(2, { t("5.0"), t("") }),
        t(")") 
    }),
    s("tugerr", { 
        t("TugDebugManager.print_error_message_on_screen(\""), 
        i(1, "Error message"), 
        t("\", "), 
        c(2, { t("5.0"), t("") }),
        t(")") 
    }),

    -- Banner Notifications
    s("tugbannerstr", { 
        t("TugDebugManager.add_standard_banner_notification(\""), 
        i(1, "Standard banner"), 
        t("\", "), 
        c(2, { t("5.0"), t("") }),
        t(")") 
    }),
    s("tugbannerwarn", { 
        t("TugDebugManager.add_warning_banner_notification(\""), 
        i(1, "Warning banner"), 
        t("\", "), 
        c(2, { t("5.0"), t("") }),
        t(")") 
    }),
    s("tugbannererr", { 
        t("TugDebugManager.add_error_banner_notification(\""), 
        i(1, "Error banner"), 
        t("\", "), 
        c(2, { t("5.0"), t("") }),
        t(")") 
    }),
    -- Register Console Command
    s("tugreg", {
        t("TugConsoleManager.register_console_command("),
        t({"\""}), i(1, "command_name"), t({"\",    # Command name"}),
        t({"\n\t"}), i(2, "function_ref"), t({",    # Function reference"}),
        t({"\n\t"}), c(3, { t("[]"), t("{\"float\", \"float\"}") }), t({",    # OPTIONAL: Parameter types"}),
        t({"\n\t"}), c(4, { t("0"), t("2") }), t({",    # OPTIONAL: Required parameters"}),
        t({"\n\t"}), c(5, { t("[]"), t("{\"x_pos\", \"y_pos\"}") }), t({",    # OPTIONAL: Parameter names"}),
        t({"\n\t\""}), i(6, "category"), t({"\",    # OPTIONAL: Category"}),
        t({"\n\t\""}), i(7, "description"), t({"\"   # OPTIONAL: Description"}),
        t({"\n)"}),
    })

}
