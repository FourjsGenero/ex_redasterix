IMPORT FGL red_asterix
MAIN
DEFINE rec RECORD
    field1, field2, field3, field4, field5 STRING,
    ed, de, be, se, te, tx, dt, co, cb, rg, sl STRING
END RECORD

    OPTIONS FIELD ORDER FORM
    OPTIONS INPUT WRAP

    CALL ui.Interface.loadStyles("red_asterix_test.4st")
    CALL ui.Form.setDefaultInitializer("form_init")
    CALL ui.Window.getCurrent().setText("Automatic Mandatory Indicator Test")
    WHILE TRUE
        MENU "Select Method"
            ON ACTION red_asterix ATTRIBUTES(TEXT="Red Asterix") 
                LET red_asterix.mandatory_mode = 1
                EXIT MENU
            ON ACTION style ATTRIBUTES(TEXT="Style")
                LET red_asterix.mandatory_mode = 2
                EXIT MENU
            ON ACTION placeholder ATTRIBUTES(TEXT="Placeholder")
                LET red_asterix.mandatory_mode = 3
                EXIT MENU
            ON ACTION close
                EXIT WHILE
        END MENU
        OPEN WINDOW w WITH FORM "red_asterix_test"
        INPUT BY NAME rec.*
           
        CLOSE WINDOW w
        LET int_flag = 0
    END WHILE
END MAIN



FUNCTION form_init(f)
DEFINE f ui.Form
    CALL red_asterix.form_init(f)
END FUNCTION